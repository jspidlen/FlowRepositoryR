test_url_settings <- function() {
    myUrl = getFlowRepositoryURL()
    checkTrue(myUrl == "https://flowrepository.org/")
    setFlowRepositoryURL("http://localhost")
    ## The slash at the end should be added automatically
    checkTrue(getFlowRepositoryURL() == "http://localhost/")
    setFlowRepositoryURL("https://127.0.0.1/")
    ## Now the slash is already at the end and should not be added
    checkTrue(getFlowRepositoryURL() == "https://127.0.0.1/")
    ## Finally, let's set it back to the default
    setFlowRepositoryURL(myUrl)
}

test_credentials_settings <- function() {
    ## Setting and than forgetting credentials
    checkTrue(!FlowRepositoryR:::haveFlowRepositoryCredentials())
    setFlowRepositoryCredentials(email="boo@gmail.com", password="foo123456")
    checkTrue(FlowRepositoryR:::haveFlowRepositoryCredentials())
    forgetFlowRepositoryCredentials()
    checkTrue(!FlowRepositoryR:::haveFlowRepositoryCredentials())
}
