# instantiate a function
function my_function
    {
    param ($input_1, $input_2)
    Write-Host "This is input 1" $input_1
    Write-Host "This is input 2" $input_2
    return ,@($input_1, $input_2)
    }

# call the function and store the results
$result = my_function -input_1 "bacon" -input_2 "cheeseburger"

# output the results
Write-Host "`nThe result of the function is:" $result
