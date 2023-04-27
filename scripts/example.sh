
# Function Example with params
# function get_names() {
#     echo "Parameter is $@"
# }

# get_names wil, jane, kifeet, juja, nai, carlifornia, munchen, , just anything

# echo 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
# git remote set-url origin https://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@github.com/Qodestackr/BashLabs.git
echo -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
# function add_numbers() {
#     _add_numbers=$@
#     local total=$((${1} + ${2}))
#     echo $total
# }

# add_numbers 10 10

# Operators 
# -z : -z for not zero(- means not)
# -n : not empty
# -gt : greater than
# -lt : less than
# -eq : equal to
# -ne : Not equal to
# -le : less than or equal to
# -ge : greater than or equal to
# =, !=, <, >, -z, &&, ||, !(Not)

# str1='.'

# if [[ -z $str1 ]]; then
#     echo "string is empty"
# else
#     echo "$str1 is not empty. Length > 0"
# fi

# str2='...'
# if [[ -n $str2 ]]; then
#     echo "string is not empty. Value: $str2"
# else
#     echo "string is empty. Value: $str2"
#     return 0
# fi

# The -z option allows me to terminate early, my prefered way due to guard clauses

function print_hello() {
    return "hello"
}

# I cannot try return statements? :: ! This did not work
# hello_msg=print_hello
# echo $hello_msg

read -p "Enter two numbers  " num1 num2

    if [[ $num1 -gt $num2 ]]; then

        echo "$num1 is greater than $num2"
    if [[ $num1 -eq $num2 ]]; then 
        echo "they are equal"
    fi

    else
        echo "$num1 is less than $num2"
    fi

