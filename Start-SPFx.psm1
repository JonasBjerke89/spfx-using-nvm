Function Start-SPFx()
{
    Param(  
    [Parameter(Mandatory=$True)]
    [String]$version
    )

    $nodeJSVersion = ""
    $generator = ""

    switch ($version)
    {
        "1.9.1"
        {
            $nodeJSVersion = "10.16.0"
            $generator = "@microsoft/generator-sharepoint@1.9.1"   
        }
        "1.8.2"
        {
            $nodeJSVersion = "10.15.3"
            $generator = "@microsoft/generator-sharepoint@1.8.2"            
        }
        "1.8.1"
        {
            $nodeJSVersion = "10.15.0"
            $generator = "@microsoft/generator-sharepoint@1.8.1"
        }
        "1.8.0" 
        {
            $nodeJSVersion = "10.13.0"
            $generator = "@microsoft/generator-sharepoint@1.8.0"
        }   
        "1.7.1" 
        {
            $nodeJSVersion = "8.12.0"
            $generator = "@microsoft/generator-sharepoint@1.7.1"
        }
        "1.7.0" 
        {
            $nodeJSVersion = "8.12.0"
            $generator = "@microsoft/generator-sharepoint@1.7.0"           
        }   
        "1.6.0"
        {
            $nodeJSVersion = "8.11.3"
            $generator = "@microsoft/generator-sharepoint@1.6.0"

        }
        "1.5.1"
        {
            $nodeJSVersion = "8.11.3"
            $generator = "@microsoft/generator-sharepoint@1.5.1"

        }
        "1.5.0"
        {
            $nodeJSVersion = "8.11.3"
            $generator = "@microsoft/generator-sharepoint@1.5.0"

        }
        "1.4.1"
        {
            $nodeJSVersion = "8.9.4"
            $generator = "@microsoft/generator-sharepoint@1.4.1"

        }    
        "1.4.0"
        {
            $nodeJSVersion = "6.12.1"
            $generator = "@microsoft/generator-sharepoint@1.4.0"

        }
        "1.3.4"
        {
            $nodeJSVersion = "6.11.5"
            $generator = "@microsoft/generator-sharepoint@1.3.4"

        }   
    }
    
    nvm install $nodeJSVersion
    nvm use $nodeJSVersion

    if(!(Test-Path -Path ".\node_modules" ))
    {
        Start-Sleep -s 2

        npm install -g yo gulp $generator

	if((Test-Path -Path ".\package.json" ))
    	{
            npm install # PROJECT SPECIFIC PACKAGES IF IT IS AN EXISTING PROJECT
    	}     
    }    

    Write-Host "Go Develop using SPFx!" -ForegroundColor Green
}