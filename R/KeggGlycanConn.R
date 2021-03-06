#' The connector class to KEGG Glycan database.
#'
#' This is a concrete connector class. It must never be instantiated directly,
#' but instead be instantiated through the factory \code{BiodbFactory}.
#' Only specific methods are described here. See super classes for the
#' description of inherited methods.
#'
#' @seealso \code{\link{KeggConn}}.
#'
#' @examples
#' # Create an instance with default settings:
#' mybiodb <- biodb::newInst()
#'
#' # Create a connector to KEGG Glycan
#' conn <- mybiodb$getFactory()$createConn('kegg.glycan')
#'
#' # Terminate instance.
#' mybiodb$terminate()
#'
#' @include KeggConn.R
#' @import R6
#' @import chk
#' @export
KeggGlycanConn <- R6::R6Class("KeggGlycanConn",
inherit=KeggConn,


public=list(

initialize=function(...) {
    super$initialize(db.name='glycan', db.abbrev='gl', accession.prefix='G', ...)
},

getEntryImageUrl=function(id) {
    # Overrides super class' method.

    fct <- function(x) {
        bu <- self$getPropValSlot('urls', 'base.url')
        u <- c(bu, 'Fig', 'glycan', paste(x, 'gif', sep='.'))
        BiodbUrl$new(url=u)$toString()
    }

    return(vapply(id, fct, FUN.VALUE=''))
}
),

private=list(
))
