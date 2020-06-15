/*
	1. Creating the Database
*/
create database library;


/*
	2. Creating the Tables
*/
create table author(
author_id int not null auto_increment,
name varchar(255) not null ,
country varchar(255),
primary key(author_id)
);

create table book(
book_id int not null auto_increment,
ISBN varchar(255) not null ,
name varchar(255) not null,
type varchar(255) not null,
author_id int not null,
copies int not null,
primary key(book_id),
CONSTRAINT FK_author_iD foreign key (author_id) references author(author_id),
CONSTRAINT UC_book unique (ISBN)
);

create table Librarians(
librarian_id int not null auto_increment ,
name varchar(255) not null,
phone int not null,
salary int not null,
primary key(librarian_id)
);

create table buyer(
buyer_id int not null auto_increment,
buyer_job varchar(255) not null,
name varchar(255) not null,
phone int not null,
books_number int not null,
primary key(buyer_id)
);

create table buying_process(
buying_id int not null auto_increment,
buying_date date not null,
buyer_id int not null,
ISBN varchar(255) not null,
librarian_id int not null,
primary key(buying_id),
CONSTRAINT FK_buyer_iD foreign key (buyer_id) references buyer(buyer_id),
CONSTRAINT FK_bookISBN foreign key (ISBN) references book(ISBN),
CONSTRAINT FK_librarian_iD foreign key (librarian_id) references Librarians(librarian_id)
);


/*
	3. Filling the Tables
*/

/* Filling the Author */

insert into author (Name, country)
values ('Charles Dickens', 'England');

insert into  author (Name, country)
values ('Victor Hugo', 'France');

insert into author (Name, country)
values ('John Ronald Reuel Tolkien', 'South Africa');

insert into author (Name, country)
values ('agatha christie', 'England');

/* Showing the 4 Authors*/

select * from author;

/* Filling the book table*/

insert into book (ISBN, name,type,Author_Id,copies)
values ('9789747597547','The Lord of the Rings','Novel',3,4);

insert into book (ISBN, name,type,Author_Id,copies)
values ('9789747597548','Great Expectations','Novel',1,10);

insert into book (ISBN, name,type,Author_Id,copies)
values ('9789747597556','David Copperfield','Novel',1,5);

insert into book (ISBN, name,type,Author_Id,copies)
values ('9789747597124','The Hobbit','Novel',3,12);

insert into book (ISBN, name,type,Author_Id,copies)
values ('9789747591245','Les Misérables','Novel',2,8);

insert into book (ISBN, name,type,Author_Id,copies)
values ('9789747591254','Death on the Nile','Novel',4,20);

insert into book (ISBN, name,type,Author_Id,copies)
values ('9789747591248','Murder on the Orient Express','Novel',4,15);

/* Showing the 7 Books*/

select * from Book;

/* Filling the buyer */

insert into buyer (buyer_job,name,phone,books_number)
values('teacher','mostafa helmy',01061144521,2);

insert into buyer (buyer_job,name,phone,books_number)
values('student','assem agoa',01062415474,1);

insert into buyer (buyer_job,name,phone,books_number)
values('farmer','mohamed albana',01010721156,3);

insert into buyer (buyer_job,name,phone,books_number)
values('student','mohamed sadek',01061155789,1);

/* Showing the 4 buyers*/

select * from buyer;

/* Filling the Librarian */

insert into Librarians(Name, phone, Salary)
values ('ayman nafea', 01052894642, 1900);

insert into Librarians(Name, phone, Salary)
values ('hassan abdeldaym', 01294781100, 2000);

/* Showing the 2 Librarians*/

select * from Librarians;

/* Filling the buying_process */

insert into buying_process (buying_date, buyer_id,ISBN,librarian_id)
values ('2020-5-21',1,'9789747597547',1);

insert into buying_process (buying_date, buyer_id,ISBN,librarian_id)
values ('2020-5-22',2,'9789747591248',2);

insert into buying_process (buying_date, buyer_id,ISBN,librarian_id)
values ('2020-5-25',1,'9789747597548',1);

insert into buying_process (buying_date, buyer_id,ISBN,librarian_id)
values ('2020-5-7',3,'9789747591248',2);

insert into buying_process (buying_date, buyer_id,ISBN,librarian_id)
values ('2020-5-9',4,'9789747591245',1);

insert into buying_process (buying_date, buyer_id,ISBN,librarian_id)
values ('2020-5-12',3,'9789747597124',2);

insert into buying_process (buying_date, buyer_id,ISBN,librarian_id)
values ('2020-5-20',3,'9789747591248',1);

/* Showing the 7 buying Processes*/

select * from buying_process;

/*
	4. Select Statements for Different Functions
*/

/* 1. how to make librarians names all in upper case */

select upper (Librarians.name)as librarians_names_as_lower_case from librarians;

/* 2. how to make books names all come in lower case*/

select lower (book.name) as books_names_as_lower_case from book;

/* 3. how to get the max salary for the librarians*/

select max(librarians.salary) as the_max_salay_for_librarian from librarians;

/* 4. how to get the min salary for the librarians*/

select min(librarians.salary) as the_min_salay_for_librarian from librarians;

/* 5. how to know how many books do you have*/

select sum(book.copies) as bookcopies from book;

/* 6.How to Count number of buying processes? */
    
select COUNT(*) as buyingprocess from buying_process;

/* 7.how to konw which book you have max copies*/

select max(book.copies) as themaxbookcopies from book ;

/* 8.how to konw which book you have min copies*/

select min (book.copies) as theminbookcopies from book;

/* 9. how to know the number of books you have */

select COUNT(book_id) as NumberOfbooks FROM book;

/* 10. how to know the day of each buying process*/

select day (buying_process.buying_date) as the_day_of_all_buying_process from buying_process;

/* 11. how to know the mounth of each buying process*/

select month (buying_process,buying_date) as the_month_of_all_buying_process from buying_process;

/* 12. how to know the mounth of each buying process*/
 
select year(buying_process.buying_date) as the_year_of_all_buying_process from buying_process;
 
 /* 13. how to know the buyer that has the max books bought*/
 
select max(buyer.books_number) as the_buyer_who_but_max_numberof_books from buyer;
 
  /* 14. how to know the buyer that has the min books bought*/

select min(buyer.books_number) as the_buyer_who_but_min_numberof_books from buyer;

 /* 15. how to know if the book_id is null or not*/
 
select isnull(book.book_id) from book;

/* 16. how to reverse librarians names*/

select reverse(librarians.name)FROM librarians;

/* 17. How to replace the space between the librarians names with "*"? */

select replace(librarians.Name,' ', '-')from librarians;

/* 18. How to combine the author country after its name? */

select concat(author.name,' is from ',author.country)from author;

/* 19. How to get the Length of the librarians number */

select length(librarians.phone) from librarians;

/* 20. how to Find the average number of the books? */

select avg(book_id) from book; 

/*
	5. Select Statements using Sub Query
*/

/* 1. select all buyers that done more than one buying process*/

select* from buying_process where buyer_id in(select buyer_id from buyer where books_number>1);

/* 2.select al books that the copies are more than 15*/

select * from book where book_id in (select book_id from Book where copies > 15) ;

/* 3. select the librarian thet have more salary than 1800*/

select* from buying_process where librarian_id in (select librarian_id from librarians where salary>1900 );

/*
	6. Select Statements using Count and Group Functions
*/

/*
 Group by function: selecting the first buying that every buyer has done 
*/

select buyer_id, min(buying_date) from buying_process group by buyer_id;

/*
Count function: selecting how many books that we have for agatha christie
*/

select COUNT(author_id) from book WHERE Author_Id = 4;


/*
	7. Select Statements using different joins
*/

/* Right Join the infromation for every book into author information  */

select author.name,author.country,book.name
from book
right join author
on book.author_id=author.author_id;

/* Left Join the author information into every book  */	

select book.name,author.name,author.country
from author
left join book
on author.author_id=book.author_id;

/* anthor right join*/
select buying_process.buying_date, librarians.phone,librarians.name
from buying_process
right join librarians
ON buying_process.librarian_id = librarians.librarian_id;

/*inner Join*/

select librarians.librarian_id, buying_process.buying_id
from librarians
inner join buying_process 
on librarians.librarian_id = buying_process.buying_id
order by buying_process.buying_id;

/*full join*/
SELECT * FROM librarians 
LEFT JOIN buying_process ON librarians.librarian_id = buying_process.buyer_id
UNION
SELECT * FROM librarians
RIGHT JOIN buying_process ON librarians.librarian_id = buying_process.buyer_id;

/*
	8.Update Statments
*/
/* 1. Updating the type of the book of ID = 5 */

update book set type='horror'where book_id=5;

/* 2. Updating the salary of librarian*/

update librarians set salary=2000 where librarian_id=1;

/* 3. Updating the book name of the book that id =6 */

update book set name='The Hound of Death' where book_id=6;

/* 4. Updating the  copies of book that its id=5 to be 50 */

update book set copies=50 where book_id=5;

/* 5. Updating the phone of librarian of id 2*/

update librarians set phone=0106552418 where librarian_id=2;

/*
		9.Delete Statements 
*/

/* 1. Deleting The buying process of mostafa helmy */

delete from buying_process where buyer_id=1;

/* 2. Deleting The selling process that the librarian of id = 1 has done*/

delete from buying_process where librarian_id = 1;

/* 3. Deleting The Librarian of the librarian ayman nafea*/

delete from librarians where name = 'ayman nafea';

/* 4. Deleting The Books of the author that have id=2*/

delete from book where author_id = 2;

/* 5. Deleting The buying process of agatha christie book*/

delete from buying_process where ISBN = '9789747591248';


