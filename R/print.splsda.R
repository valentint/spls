
# print fit

"print.splsda" <-
function( x, ... )
{
    xmat <- x$x
    p <- ncol(xmat)
    A <- x$A
    xAnames <- colnames(xmat)[A]  
    q <- length(unique(x$y))    
    eta <- x$eta
    K <- x$K
    kappa <- x$kappa
    select <- x$select
    fit <- x$fit
    classifier <- x$classifier
    
    
    # define classifier name
    
    switch( classifier,
        logistic = {
            if ( q == 2 ) { cname <- "Logistic regression" }
            if ( q > 2 ) { cname <- "Multinomial regression" }
        },
        lda = {
            cname <- "Linear Discriminant Analysis (LDA)"
        }
    )
    
    
    # print out
    
    cat( "\nSparse Partial Least Squares Discriminant Analysis\n" )
    cat( "----\n")
    if ( q == 2 )
    {
        cat( paste("Parameters: eta = ",eta,", K = ",K,"\n",sep="") )
    }
    if ( q > 2 )
    {
        cat( paste("Parameters: eta = ",eta,", K = ",K,", kappa = ",kappa,"\n",sep="") )
    }
    
    cat( paste("Classifier: ",cname,"\n\n",sep="") )
    
    cat( paste("SPLSDA chose ",length(A)," variables among ",p," variables\n\n",sep='') )
    cat( "Selected variables: \n" )
    if ( !is.null(xAnames) )
    {
        for (i in 1:length(A))
        {
            cat( paste(xAnames[i],'\t',sep='') )
            if ( i%%5==0 ) { cat('\n') }
        }
    } else
    {
        for (i in 1:length(A))
        {
            cat( paste(A[i],'\t',sep='') )
            if ( i%%5==0 ) { cat('\n') }
        }
    }
    cat('\n')
}
