# Importation de modules préalablement installés
Import-Module Hyper-V
Import-Module Hyper-ConvertImage

# Attribution de valeurs à des variables
$VMName = "VM-WIN-S-AUTO" 
$VMPath = 'D:\VM'
$VHDPath = "D:\VM\vm-deploy\vm-deploy-auto.vhdx" 
$VHDSize = 32GB 
$VMMemory = 4096MB 
$Processor = 4
$VMSwitch = "Default Switch"
$ISOPath = "C:\Users\sebastien.jacquelin\Desktop\SERVER_EVAL_x64FRE_en-us.iso"

# Création d'une nouvelle machine virtuelle avec certains paramètres et leurs valeurs (valeurs attribuées à des variables ci-dessus)
# Attribuer un nombre de processeurs à la machine virtuelle venant d'être créée
New-VM -Name $VMName -Path $VMPath -MemoryStartupBytes $VMMemory -NewVHDPath $VHDPath -NewVHDSizeBytes $VHDSize -Generation 2 -BootDevice VHD -Switch $VMSwitch
Set-VM -Name $VMName -DynamicMemory -ProcessorCount $Processor

# Attribution des valeurs au différents paramètres pour l'utilisation du module Hyper-ConvertImage
$convertParamsModule = @{
    SourcePath = $ISOPath
    VhdFormat = "VHDX"
    Edition = "Windows Server 2022 Standard Evaluation (Desktop Experience)"
    SizeBytes = 32GB 
    DiskLayout = "UEFI" 
    VhdPath = "D:\VM\vm-deploy\vm-deploy-auto.vhdx"
    VhdType = "Dynamic"
    UnattendPath = "C:\Users\sebastien.jacquelin\Desktop\preseed.xml"
}

# Exécution du module Convert-WindowsImage en lui passant tous les paramètres ci-dessus
# Monte le vhdx et le change afin d'y attribuer les valeurs renseignées dans le preseed, généré sur le web (format xml)
Convert-WindowsImage @convertParamsModule

# Démarrage de la machine virtuelle venant d'être créée sur le vhdx modifié par le preseed
Start-VM -Name $VMName

$pass = "sebast!en73WS"

# 
Write-Verbose 'création vm sesion'
$sess = .\New-VMSession.ps1 -VMName $VMName -AdministratorPassword $pass
Write-Verbose 'activation remote management'
.\Enable-RemoteManagementViaSession.ps1 -Session $sess 

Invoke-Command -Session $sess { 
    # echo "Hello, world! (from $env:COMPUTERNAME)"

    # Install chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

    # Install 7-zip
    choco install 7zip -y

    # Install Mariadb 
    choco install mariadb.install -y
    choco install mariadb

    # Install iis
    choco install iis.administration -y

    # Install des dépendances web-deploy et urlrewrite
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment

    Enable-WindowsOptionalFeature -online -FeatureName NetFx4Extended-ASPNET45
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45

    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic

    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45

    choco install urlrewrite -y
    choco install webdeploy -y
    
    # Rechercher un package
    #choco search mariadb --exact
    #choco search iis --exact
}

Remove-PSSession -Session $sess