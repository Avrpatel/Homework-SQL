select ch.id as cardholder, t.date as hour, amount as amount
from transaction t
left join credit_card as cc on t.card = cc.card
left join card_holder as ch on cc.cardholder_id = ch.id
where amount >= '$2.00'
AND date_part ('hour', t.date)<8
AND date_part ('hour', t.date)>23 
AND ch.id = '2' or ch.id = '18'
group by ch.id, hour, t.amount
