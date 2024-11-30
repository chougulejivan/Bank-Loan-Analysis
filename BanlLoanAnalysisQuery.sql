create database financeloan;

#KPI-1 Year Wise Loam Amount Stats
select year(issue_d) As "Years",
concat(format(sum(loan_amnt)/1000,0),"K") As Total_Loan from finance_1
group by year(issue_d)
order by 1;

#KPI-2 Grade and Sub_Grade Wise Revol Balance

select grade, sub_grade, 
concat(format(sum(revol_bal)/1000,0),"K")As "Total Revol Balance" from finance_1
inner join finance_2
using (id)
group by grade,sub_grade
order by 1;

#KPI-3 Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status,
concat(format(sum(total_pymnt)/1000,0),"K") As "Payment" from finance_1
inner join finance_2
using(id)
group by verification_status;

#KPI-4 State wise and last_credit_pull_d wise loan status

select addr_state, last_credit_pull_d,
count(loan_status)As "Loan Status" from finance_1
inner join finance_2
using (id)
group by addr_state,last_credit_pull_d;


#KPI-5 Home ownership Vs last payment date stats

select home_ownership,last_pymnt_d,
count(total_pymnt)As "Payment Count" from finance_1
inner join finance_2
using (id)
group by home_ownership, last_pymnt_d
order by count(total_pymnt) desc; 

#which state has highest no of loan taker
select addr_state As State, sum(total_acc) As "Total Open Accounts" from finance_1
inner join finance_2
using (id)
group by addr_state 
order by sum(total_acc) desc limit 5;

#which state has taken maximun loan amount

select addr_state As State,
concat(format(sum(recoveries)/1000,0),"K") As "Overall Recoverie" from finance_1
inner join finance_2
using (id)
group by addr_state
order by sum(recoveries) desc limit 3;


#Which is the most tranding Purpose People have taken loan for it

select purpose,
concat(format(sum(total_pymnt)/1000,0),"K") As HighestLoan
from finance_1
inner join finance_2
using (id)
group by purpose
order by sum(loan_amnt) desc;

#Which state has max customer who take loan

select count(member_id) AS customers from finance_1;
select distinct(emp_title) from finance_1;

