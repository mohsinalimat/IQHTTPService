<?php
    
    $local_file_path = "uploads";
    $target_dir = getcwd()."/".$local_file_path;
    
    if (!file_exists($target_dir))
    {
        mkdir($target_dir,0777, true);
    }
    
    foreach ($_FILES as $file_description) {

        $target_file = $target_dir ."/" . basename($file_description["name"]);
        
        $tempFile = $file_description["tmp_name"];
        
        if (move_uploaded_file($tempFile, $target_file))
        {

            $file = array(
                          "name" => $file_description["name"],
                          "type" => $file_description["type"],
                          "size" => $file_description["size"],
                          "path" => $_SERVER[REQUEST_SCHEME].'://'.$_SERVER['HTTP_HOST'].$_SERVER[REQUEST_URI].$local_file_path. "/" . basename($file_description["name"]),
                          );
            
            $files[] = $file;
        }
    }
    
    $response = array("parameters" => $_POST,"files" => $files);
    echo json_encode ($response);
?>
