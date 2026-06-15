# assuming 'original' names, 'new' names and variable 'type'  (change if necessary)
type_funs <- list(
  character = as.character,
  obsolete  = as.character,
  numeric   = as.numeric,
  integer   = as.integer,
  factor    = as.factor,
  logical   = as.logical,
  date      = as.Date,
  ordinal   = \(x) {
    lvls <- unique(x)
    lvls <- lvls[!is.na(lvls)]
    factor(x, levels = lvls, ordered = TRUE)
  }
)

w_original_to_new <- function(.data,.dict){
	.data <- .data %>% rename(all_of(set_names(.dict$original, .dict$new)))
	.data %>% mutate( across(all_of(.dict$new), ~ {
             tp <- .dict$type[match(cur_column(), .dict$new)]
             fn <- type_funs[[tp]]
               fn(.x)
           },
           .names = "{.col}")
  )
}

w_ordinal_levels <- function(.data, .dict){
	ordinal_dict <- .dict |> 
		filter(type == "ordinal", !is.na(levels)) |>
		mutate(levels_vec = map(levels, ~ unlist(str_split(.x, "<"))))

	ordinal_vars <- ordinal_dict$new
	.data |> mutate(across(all_of(ordinal_vars), 
		~ ordered(.x, 
	levels = ordinal_dict$levels_vec[[match(cur_column(), ordinal_vars)]])))
}
