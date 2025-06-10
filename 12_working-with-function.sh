#!/bin/bash


addition(){
	let sum=$num1+$num2
	echo "Sum is $sum"
}

substraction(){
	let sub=$num1-$num2
	echo "Difference is $sub"
}

multiplication(){
	let mul=$num1*$num2
	echo "Multiplication is $mul"
}

division(){
	let div=$(( num1/num2 ))
	echo "division is $div"
}

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2


echo "What you want to do: "
echo "a - addition"
echo "b - substraction"
echo "c - multiplication"
echo "d - division"

read -p  "Choose an option: " choice


case ${choice,,} in
	a)addition;;
	b)substraction;;
	c)multiplication;;
	d)division;;
	*)echo "Invalid Value!!!!!";;		

esac
