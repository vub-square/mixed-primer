#show: article.with(
  $if(title)$
    title: "$title$",
  $endif$
  $if(date-modified)$
    date: "$date-modified$",
  $endif$
  $if(author)$
    author: "$author$",
  $endif$
  $if(params.student)$
    student: "$params.student$",
  $endif$
  $if(params.naam)$
    naam: "$params.naam$",
  $endif$
  $if(params.voornaam)$
    voornaam: "$params.voornaam$",
  $endif$
)