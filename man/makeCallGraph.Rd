\name{makeCallGraph}
\alias{makeCallGraph}
\alias{makeCallGraph,list-method}
\alias{makeCallGraph,character-method}
\title{Create a graph representing which functions call other functions}
\description{
  This function and its methods provide facilities for constructing
  a graph representing which functions call which other functions.
}
\usage{
makeCallGraph(obj, all = FALSE, ...)
}
\arguments{
  \item{obj}{a function, the name of a function, the name of a package,
    a character vector of function names,
  }
   \item{all}{a logical value that controls whether the graph includes
     all the functions called by any of the target functions. This will
     greatly expand the graph.}
  \item{\dots}{additional parameters for the methods}
}
\note{We may extend this to deal with global variables and methods}
\value{
 An object of class \code{\link[graph]{graphNEL-class}}
}
\author{Duncan Temple Lang}

\seealso{
  The \code{graph} and \code{Rgraphviz} packages.

  The \code{SVGAnnotation} package can be used to mae thee graphs interactive.
}
\examples{

  gg = makeCallGraph("package:CodeDepends")
  if(require(Rgraphviz)) {
     plot(gg, "twopi")

     ag = agopen(gg, layoutType = "circo", name = "bob")
     plot(ag)
  }

  if(require(Rgraphviz)) {
      # Bigger fonts.
    zz = layoutGraph(gg)
    graph.par(list(nodes = list(fontsize = 48)))
    renderGraph(zz)
  }
}
\keyword{hplot}
\keyword{programming}
