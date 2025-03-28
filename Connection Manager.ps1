# Define the folder path containing the .dtsx files
$folderPath = "\project 4\dtsx"
$outputCsv = "\project 4\dtsx\output.csv"


# Initialize an empty array to store results
$output = @()

# Get all .dtsx files in the folder and subfolders
$files = Get-ChildItem -Path $folderPath -Filter "*.dtsx" -Recurse

foreach ($file in $files) {
    [xml]$xml = Get-Content $file.FullName    

    # Define XML namespace (important for proper parsing)
    $ns = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
    $ns.AddNamespace("DTS", "www.microsoft.com/SqlServer/Dts")

    # Extract Connection Managers
    $data = $xml.SelectNodes("//DTS:ConnectionManager", $ns)

    foreach ($conn in $data) {
        $name = $conn.GetAttribute("DTS:ObjectName")

        # Navigate to ObjectData > ConnectionManager and get the ConnectionString
        $connManager = $conn.SelectSingleNode("DTS:ObjectData/DTS:ConnectionManager", $ns)
        $connString = if ($connManager) { $connManager.GetAttribute("DTS:ConnectionString") } else { "N/A" }

        # Store extracted data
        $output += [PSCustomObject]@{
            FileName         = $file.Name
            FilePath         = $file.FullName
            ConnectionName   = $name
            ConnectionString = $connString
        }
    }
}

# Export all results to CSV
$output | Export-Csv -Path $outputCsv -NoTypeInformation

Write-Host "CSV file generated: $outputCsv"
