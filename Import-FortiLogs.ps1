param ( [ValidateScript({Test-Path $_})][string]$File )

$data = Get-Content "${file}"
$objects = @()

foreach ($line in $data) {
    $fields = $line.Split("=")
    
    $data = foreach ($field in $fields) {
        if ($fields[-1] -ne $field) {
             $field = $field.ToCharArray()
	     [Array]::Reverse($field)
             $field = [String]::Join("", $field)
             $sub_fields = $field.Split(" ",2)
             [Array]::Reverse($sub_fields)

            foreach ($sub_field in $sub_fields) {
                 $sub_field = $sub_field.ToCharArray()
	         [Array]::Reverse($sub_field)
                 [String]::Join("", $sub_field).Trim("`"")
            }
        }
        else {
	    $field
        }
    }

    $hash = @{}

    for ($i=0; $i -lt $data.Count; $i+=2) {
         $hash.Add($data[$i], $data[$i+1])
    }

    $objects += [pscustomobject]$hash
}

$objects
