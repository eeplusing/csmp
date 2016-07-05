
select * from csmp_user_info;

select * from csmp_image_info;

select * from csmp_car_info;

select * from csmp_buy_good_info;

select * from csmp_good_info;

insert into csmp_car_info values( 1,'69');


select * from csmp_address_info;

insert into csmp_address_info values(2,'陕西西安','000000','admin','12365487541','69');




select * from CSMP_ORDER_INFO;
select * from CSMP_ORDER_DETAIL_INFO;
select * from CSMP_IMAGE_INFO;
select * from CSMP_GOOD_INFO;
select * from CSMP_GRADE_INFO;
select * from CSMP_USER_INFO;

update CSMP_ORDER_DETAIL_INFO od 
    set od.specification='俗称白煤或红煤。是煤化程度最大的煤。无烟煤固定碳含量高，挥发分产率低，密度大，硬度大，燃点高，燃烧时不冒烟。黑色坚硬，有金属光泽。以脂摩擦不致染污，断口成贝壳状，燃烧时火焰短而少烟。不结焦。',
        od.head_value='破碎率+磨损率/% ≤ 3 密度/g·㎝31.4~1.6 挥发分﹤10% 含泥量/% ≤ 4 盐酸可容率/% ≤ 3.5';
        
update CSMP_ORDER_INFO o set o.order_state = '1' where o.order_state = '9';
update CSMP_ORDER_INFO o set o.order_carriage = '600.0' where o.order_state > '0';