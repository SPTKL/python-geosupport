if ($isWindows AND $env:GEO_BIT -eq '64'){
    # download and install for windows x64 here
    Write-Host "Downloading $env:GEO_BIT bit Geosuport version $env:GEO_VERSION for Windows..."
    curl https://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gde64_$env:GEO_VERSION.zip -O -sL
    Write-Host "Extracting..."
    unzip gde64_$env:GEO_VERSION.zip  -d geosupport
    rm gde64_$env:GEO_VERSION.zip
    cd geosupport
    Write-Host "Installing..."
    setup.exe
    Write-Host "Install complete."
}
elseif ($isWindows AND $env:GEO_BIT -eq '32') {
    # download and install for windows x64 here
    Write-Host "Downloading $env:GEO_BIT bit Geosuport version $env:GEO_VERSION for Windows..."
    curl https://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gde_$env:GEO_VERSION.zip -O -sL
    Write-Host "Extracting..."
    unzip gde_$env:GEO_VERSION.zip  -d geosupport
    rm gde_$env:GEO_VERSION.zip
    cd geosupport
    Write-Host "Installing..."
    setup.exe
    Write-Host "Install complete."
}
elseif ($isLinux) {
    # linux here ?
    Write-Host "Downloading Geosuport version $env:GEO_VERSION for Linux..."
    curl https://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gdelx_$env:GEO_VERSION.zip -O -sL
    Write-Host "Extracting..."
    unzip gde_$env:GEO_VERSION.zip  -d geosupport
    rm gde_$env:GEO_VERSION.zip
    cd geosupport
    Write-Host "Installing..."

    # get the first directory name and CD into that thing
    $GEO_DIR = ls -Name
    cd $GEO_DIR

    Write-Host "PWD: $pwd"

    $env.GEOFILES="$pwd/fls/"
    $env.LD_LIBRARY_PATH="$pwd/lib/$env.LD_LIBRARY_PATH"
    Write-Host "Environment Path: $env.PATH"
    Write-Host "Environment GEOFILES: $env.GEOFILES"
    Write-Host "Environment LD_LIBRARY_PATH: $env.LD_LIBRARY_PATH"
    Write-Host "Install complete."
}