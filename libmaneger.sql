create database libmaneger;
\c libmaneger;
CREATE TABLE IF NOT EXISTS user_info(
    userinfo_id SERIAL NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255)UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(255)UNIQUE NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY(userinfo_id)
);
CREATE TABLE IF NOT EXISTS nhanvien(
    nhanvien_id SERIAL NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL ,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255)UNIQUE NOT NULL,
    address VARCHAR(255)NOT NULL,
    phone VARCHAR(255)UNIQUE NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY(nhanvien_id)
);

CREATE TABLE IF NOT EXISTS book(
    book_id SERIAL NOT NULL,
    book_name VARCHAR(255)UNIQUE NOT NULL,
    type VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    available INTEGER NOT NULL,
    description TEXT NULL,
    PRIMARY KEY(book_id)
);
CREATE TABLE IF NOT EXISTS transaction(
    transaction_id SERIAL NOT NULL,
    userinfo_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    status BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY(transaction_id),
    FOREIGN KEY(userinfo_id) REFERENCES user_info(userinfo_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id)
);

CREATE TABLE IF NOT EXISTS transaction_info(
    transaction_id INTEGER NOT NULL,
    borrowdate DATE NOT NULL DEFAULT CURRENT_DATE,
    duedate DATE NOT NULL DEFAULT CURRENT_DATE + 7,
    PRIMARY KEY(transaction_id),
    FOREIGN KEY(transaction_id) REFERENCES transaction(transaction_id)
);
CREATE TABLE IF NOT EXISTS returnbooks(
    transaction_id INTEGER NOT NULL,
    nhanvien_id INTEGER NOT NULL,
    returndate DATE NOT NULL DEFAULT CURRENT_DATE,
    fines INTEGER NOT NULL DEFAULT 0,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY(transaction_id),
    FOREIGN KEY(transaction_id) REFERENCES transaction(transaction_id),
    FOREIGN KEY(nhanvien_id) REFERENCES nhanvien(nhanvien_id)
);
CREATE TABLE IF NOT EXISTS fines(
    fines_id SERIAL NOT NULL,
    userinfo_id INTEGER NOT NULL,
    nhanvien_id INTEGER NOT NULL,
    money INTEGER NOT NULL,
    finesdate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY(fines_id),
    FOREIGN KEY(userinfo_id) REFERENCES user_info(userinfo_id),
    FOREIGN KEY(nhanvien_id) REFERENCES nhanvien(nhanvien_id)
);

INSERT INTO user_info(first_name,last_name,username,password,email,address,phone) values('Thanh','Duong','katanashi03','okebae123','katanashi03@gmail.com','78 197 Ho??ng Mai','0329980119');

INSERT INTO user_info(first_name,last_name,username,password,email,address,phone) values('V??n','Th???','hthe1010','vanthe','hthe1010@gmail.com','Hai B?? Tr??ng, H?? N???i','0388019282');

INSERT INTO user_info(first_name,last_name,username,password,email,address,phone) values('Anh','Th??i','anhthaingd','anhthai','anhthaingd@gmail.com','C???u Gi???y, H?? N???i','0622882279');

INSERT INTO nhanvien(first_name,last_name,username,password,email,address,phone) values('Th??nh','Ti???n','ThanhDuong3103','okebae123','thanhtien31032002@gmail.com','78 197 Ho??ng Mai','0329980119');

INSERT INTO book(book_name,type,author,available,description) 
values('T??i t??i gi???i, b???n c??ng th???','Psychology','Adam Khoo',8,'???????c s??ng t??c b???i m???t doanh nh??n ng?????i Singapore t??n Adam Khoo. N???i dung c???a cu???n s??ch l?? nh???ng chia s??? v??? c??c c??u chuy???n c??ng nh?? ph????ng ph??p h???c t???p. Do ch??nh t??c gi??? ???? tr???i nghi???m khi m???i ??? ????? tu???i c???p 2. Ch??nh v?? th??? cu???n s??ch gi??p cho ng?????i ?????c c?? ???????c s??? t??? tin c??ng nh?? ?? th???c t??? l???p t???t. ?????ng th???i l??m ch??? cho cu???c s???ng c???a ch??nh m??nh. ????y ???????c xem l?? m???t trong nh???ng cu???n s??ch n??n ?????c b???i n?? ???? ???????c d???ch ra v???i nhi???u ng??n ng??? kh??c nhau v?? ???????c truy???n b?? r???ng r??i tr??n kh???p th??? gi???i.');

INSERT INTO book(book_name,type,author,available,description) 
values('?????c nh??n t??m','Psychology','Dale Carnegie',10,'S??ch c?? n???i dung ????a ra nh???ng l???i khuy??n r???t b??? ??ch trong c??ch ???ng x???. C??ch ?????i nh??n x??? th??? trong cu???c s???ng h??ng ng??y gi??p cho ng?????i ?????c ho??n thi???n v?? v????n t???i th??nh c??ng. Ch??nh v?? th??? b???n th??n m???i ng?????i n??n trang b??? cho m??nh m???t cu???n s??ch. Th???t s???, ?????c nh??n t??m ch??nh l?? ngh??? thu???t ????? thu h??t l??ng ng?????i c??ng nh?? thu ph???c ???????c l??ng ng?????i, b???i ch??nh s??? ch??n th??nh c???a ?????c gi??? qua l???i v??n v?? ng??n ng??? c???a t??c gi???.');


INSERT INTO book(book_name,type,author,available,description) 
values('T???i ??c v?? tr???ng ph???t','Psychology','Dostoevsky',8,'????y l?? cu???n s??ch t???ng ???????c b??nh ch???n l?? cu???n s??ch v?? ?????i nh???t m???i th???i ?????i, m???t trong nh???ng cu???n s??ch hay n??n ?????c. T???i ??c v?? tr???ng tr??? c?? n???i dung n??i v??? lu???t nh??n qu??? trong cu???c s???ng l?? m???t ki???t t??c v??? t??nh y??u th????ng gi???a con ng?????i v???i nhau. Trong cu???c s???ng ????? c?? th??? h??a nh???p, th??n thi???n v???i nhau. G???t v??? m???i th?? h???n, v?? n??i v??? c??c t???i ??c n???u ???? th???c hi???n.');


INSERT INTO book(book_name,type,author,available,description) 
values('Nh?? gi??? kim','Psychology','Paulo Coelho',18,'Nh?? gi??? kim nh?? l?? ??ang t??? thu???t tr?? chuy???n v???i ch??nh b???n th??n m??nh. S??ch ???? ch??? ra ???????c nh???ng th??? ????n gi???n m?? s??u s???c nh???t trong ?????i, khi ?????c s??ch m???i c?? th??? ng??? ra ???????c. B???i r???t ??t ai c?? th??? t??? m??nh nh???n ra ???????c ??i???u ????. Trong t??c ph???m ??em ?????n cho ?????c gi??? s??? l???c quan, nh???ng ??i???u m?? ?????c m?? con ng?????i ????i khi c??ng ch??? bi???t m?? v?? kh??ng d??m th???c hi???n. Qu??? th???t nh?? gi??? kim ???? ???????c bi???t ?????n tr??n kh???p c??c n?????c tr??n th??? gi???i. ?????c bi???t c??n ???????c h???u h???t c??c ?????c gi??? ??? m???i l???a tu???i y??u th??ch v?? l???a ch???n.');

INSERT INTO book(book_name,type,author,available,description) 
values('M???i l???n v???p ng?? l?? m???t l???n Tr?????ng Th??nh','Psychology','Li??u Tr?? Phong',7,'Ng?????i ta v???n th?????ng hay n??i m???i l???n v???p ng?? l?? m???t l???n ??au v?? sau m???i c?? ng?? ???y, ch??ng ta s??? tr??? n??n m???nh m??? v?? tr?????ng th??nh h??n bao gi??? h???t. Cu???c s???ng ????i khi c??ng c?? nh???ng ng??y nh?? th??? ????. Th??? nh??ng, khi s??? v???p ng?? ???? tr??? th??nh th??i quen v???i m???t th??n m??nh ch???ng ch???t v???t tr???y x?????c, ???? ch??nh l?? khi t??m h???n d???n d???n h??nh th??nh s??? v?? c???m v?? chai s???m tr?????c nh???ng n???i ??au.');

INSERT INTO book(book_name,type,author,available,description) 
values('Tu???i Tr??? ????ng Gi?? Bao Nhi??u?','Psychology','Rosie Nguy???n',7,'B???n c?? ch???t m??n n??i x?? t?????ng v???i nh???ng ?????c m?? dang d???, ???? kh??ng ph???i l?? vi???c c???a h???. Suy cho c??ng, quy???t ?????nh l?? ??? b???n. Mu???n c?? ??i???u g?? hay kh??ng l?? t??y b???n. N??n h??y l??m nh???ng ??i???u b???n th??ch. H??y ??i theo ti???ng n??i tr??i tim. H??y s???ng theo c??ch b???n cho l?? m??nh n??n s???ng.');

INSERT INTO book(book_name,type,author,available,description) 
values('?????i thay ?????i khi ch??ng ta thay ?????i','Psychology','Andrew Matthews',17,'????????i thay ?????i khi ch??ng ta thay ?????i??? (Being A Happy Teenager) ??em l???i cho ?????c gi??? nh???ng t??nh hu???ng v?? c??ng th???c t???, th???m ch?? l?? c??c c??u chuy???n v???a ???nh??? nh???t??? l???i v???a ???quan tr???ng??? v???i c??ch ???ng x??? kh??n ngoan, th?? v??? v?? h??i h?????c??? ?????ng th???i, ?????c gi??? nh?? b???t g???p ch??nh m??nh trong ????, c?? nh???ng c???nh tranh, th???t b???i, v?? c?? nh???ng t??nh hu???ng giao ti???p v???a ch??n th???t l???i v???a b??? ??ch.');

INSERT INTO book(book_name,type,author,available,description) 
values('D???y Con L??m Gi??u','Psychology','Robert Kiyosaki',17,'Cu???n s??ch D???y Con L??m Gi??u n??i v??? c??ch l??m sinh ra ?????ng ti???n v?? quan ??i???m r???t hay v??? ?????ng ti???n., kh??i d???y kh??? n??ng ki???m ti???n c???a m???i c?? nh??n.
Hai quan ??i???m kh??c nhau ???? l??: Tham ti???n l?? m???t t???i ??c, c??n ng?????i kia l???i b???o Ngh??o h??n l?? ngu???n g???c c???a m???i t???i ??c. B??i h???c m?? b???n ?????c nh???n ???????c t??? cu???n s??ch n??y ???? l??: Ng?????i gi??u kh??ng l??m vi???c v?? ti???n, b???t ti???n l??m vi???c cho m??nh. Hai n???a l?? n???u nh?? b???n muon l??m gi??u ph???i c?? v???n ki???n th???c n???n t???ng cho m??nh nh?? t??i ch??nh, th??? tr?????ng, cung c???u??? N???u b???n hi???u ???????c nh???ng v???n ????? n??y, n???i dung c???a s??ch s??? ???????c h???p thu d??? d??ng v?? s??u s???c h??n.');

INSERT INTO book(book_name,type,author,available,description) 
values('Zen and the Art of Motorcycle Maintenance','Psychology','Robert M. Pirsig',12,'Vi???t v??? m???t h??nh tr??nh ??i kh???p n?????c M??? trong m??a h?? c???a m???t ng?????i cha v?? c???u con trai, cu???n s??ch Zen And The Art Of Motorcycle Maintenance c??n l?? m???t h??nh tr??nh tri???t h???c v???i ?????y nh???ng c??u h???i c?? b???n v??? cu???c s???ng v?? c??ch s???ng tr??n ?????i.

');



CREATE OR REPLACE FUNCTION getinfo_allacuser() RETURNS TABLE(userinfo_id INTEGER, name text, username varchar(255),email varchar(255), password varchar(255),address varchar(255),phone varchar(255))
AS $$
BEGIN
RETURN QUERY SELECT user_info.userinfo_id, user_info.first_name || ' '|| user_info.last_name as name, user_info.username, user_info.email, user_info.password, user_info.address, user_info.phone 
FROM user_info
WHERE status = TRUE;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION getinfo_acuser(in usernameinput varchar(255)) RETURNS TABLE(userinfo_id INTEGER, name text,email varchar(255),password varchar(255),address varchar(255),phone varchar(255))
AS $$
BEGIN
RETURN QUERY SELECT user_info.userinfo_id, user_info.first_name || ' '|| user_info.last_name as name, user_info.email,user_info.password, user_info.address, user_info.phone 
FROM user_info
WHERE status = TRUE AND user_info.username = usernameinput;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION getinfo_allnhanvien() RETURNS TABLE(nhanvien_id INTEGER, name text,username varchar(255), email varchar(255), password varchar(255), address varchar(255),phone varchar(255))
AS $$
BEGIN
RETURN QUERY SELECT nhanvien.nhanvien_id, nhanvien.first_name || ' '|| nhanvien.last_name as name,nhanvien.username , nhanvien.email, nhanvien.phone, nhanvien.address, nhanvien.phone 
FROM nhanvien
WHERE status = TRUE ;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getinfo_nhanvien(in usernameinput varchar(255)) RETURNS TABLE(nhanvien_id INTEGER, name text,email varchar(255),password varchar(255),address varchar(255),phone varchar(255))
AS $$
BEGIN
RETURN QUERY SELECT nhanvien.nhanvien_id, nhanvien.first_name || ' '|| nhanvien.last_name as name, nhanvien.email, nhanvien.password, nhanvien.address, nhanvien.phone 
FROM nhanvien
WHERE status = TRUE AND nhanvien.username = usernameinput; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getinfo_availablebook() RETURNS TABLE(book_id INTEGER, name varchar(255),type varchar(255), author varchar(255),available INTEGER)
AS $$
BEGIN
RETURN QUERY SELECT book.book_id, book.book_name, book.type, book.author, book.available 
FROM book
WHERE book.available > 0;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_availablebookByname(input_name varchar(255)) RETURNS TABLE(book_id INTEGER, name varchar(255),type varchar(255), author varchar(255),available INTEGER)
AS $$
BEGIN
RETURN QUERY SELECT book.book_id, book.book_name , book.type, book.author, book.available
FROM book
WHERE book.available > 0 AND (SELECT POSITION(input_name IN book.book_name) > 0);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_availablebookBytype(input_type varchar(255)) RETURNS TABLE(book_id INTEGER, name varchar(255),type varchar(255), author varchar(255),available INTEGER)
AS $$
BEGIN
RETURN QUERY SELECT book.book_id, book.book_name , book.type, book.author, book.available
FROM book
WHERE book.available > 0 AND (SELECT POSITION(input_type IN book.type) > 0);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_availablebookByauthor(input_author varchar(255)) RETURNS TABLE(book_id INTEGER, name varchar(255),type varchar(255), author varchar(255),available INTEGER)
AS $$
BEGIN
RETURN QUERY SELECT book.book_id, book.book_name , book.type, book.author, book.available
FROM book
WHERE book.available > 0 AND (SELECT POSITION(input_author IN book.author) > 0);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_transactionbyId(id INTEGER) RETURNS TABLE(name text,book_name varchar(255),borrowdate date,duedate date)
AS $$
BEGIN
RETURN QUERY SELECT user_info.first_name || ' ' || user_info.last_name as name, book.book_name, transaction_info.borrowDate, transaction_info.dueDate 
FROM ((transaction inner join transaction_info on transaction_info.transaction_id = transaction.transaction_id) inner join user_info on transaction.userinfo_id = user_info.userinfo_id) inner join book on book.book_id = transaction.book_id 
WHERE user_info.status = TRUE AND transaction.status = FALSE AND id = transaction.userinfo_id; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION findall_actransaction() RETURNS TABLE(transaction_id INTEGER,name text,book_name varchar(255),borrowdate date,duedate date)
AS $$
BEGIN
RETURN QUERY SELECT transaction.transaction_id, user_info.first_name || ' ' || user_info.last_name as name, book.book_name, transaction_info.borrowDate, transaction_info.dueDate 
FROM ((transaction inner join transaction_info on transaction_info.transaction_id = transaction.transaction_id) inner join user_info on transaction.userinfo_id = user_info.userinfo_id) inner join book on book.book_id = transaction.book_id 
WHERE user_info.status = TRUE AND transaction.status = FALSE ;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION findall_actransaction() RETURNS TABLE(transaction_id INTEGER,name text,book_name varchar(255),borrowdate date,duedate date)
AS $$
BEGIN
RETURN QUERY SELECT transaction.transaction_id, user_info.first_name || ' ' || user_info.last_name as name, book.book_name, transaction_info.borrowDate, transaction_info.dueDate 
FROM ((transaction inner join transaction_info on transaction_info.transaction_id = transaction.transaction_id) inner join user_info on transaction.userinfo_id = user_info.userinfo_id) inner join book on book.book_id = transaction.book_id 
WHERE user_info.status = TRUE AND transaction.status = FALSE ;
END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION findallreturned() RETURNS TABLE(transaction_id INTEGER, userinfo_id INTEGER, name text,book_name varchar(255),returndate date,fines INTEGER,username varchar(255),status BOOLEAN)
AS $$
BEGIN
RETURN QUERY SELECT transaction.transaction_id,user_info.userinfo_id, user_info.first_name || ' ' || user_info.last_name as name, book.book_name, returnbooks.returndate, returnbooks.fines, nhanvien.username, returnbooks.status
FROM (((transaction inner join returnbooks on returnbooks.transaction_id = transaction.transaction_id) inner join user_info on transaction.userinfo_id = user_info.userinfo_id) inner join book on book.book_id = transaction.book_id ) inner join nhanvien on nhanvien.nhanvien_id = returnbooks.nhanvien_id
WHERE transaction.status = TRUE
ORDER BY returndate DESC ;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION findallfined() RETURNS TABLE(name text, username varchar(255), nhanvienusername varchar(255),money INTEGER, finesdate date)
AS $$
BEGIN
RETURN QUERY select user_info.first_name || ' ' || user_info.last_name as name, user_info.username, nhanvien.username , fines.money,fines.finesdate from (fines inner join user_info on fines.userinfo_id = user_info.userinfo_id )inner join nhanvien on fines.nhanvien_id = nhanvien.nhanvien_id
ORDER BY finesdate DESC ;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_transactions() RETURNS TRIGGER
AS $$
BEGIN
        IF 
            (SELECT available from book where book.book_id = NEW.book_id) > 0 AND (select count(transaction_id) from (select user_info.userinfo_id,transaction_id,transaction.status from user_info LEFT JOIN transaction ON user_info.userinfo_id = transaction.userinfo_id WHERE user_info.status = true) as foo WHERE (foo.status = false or foo.status is null) group by userinfo_id having userinfo_id = NEW.userinfo_id ) < 5
        THEN 
           UPDATE book SET available = available - 1 WHERE book.book_id = NEW.book_id;
           
           RETURN NEW;
        ELSE
            RETURN NULL;
        END IF;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE TRIGGER add_transactionb BEFORE INSERT ON transaction
FOR EACH ROW
EXECUTE PROCEDURE add_transactions();

CREATE OR REPLACE FUNCTION add_transactionsa() RETURNS TRIGGER
AS $$
BEGIN   
        IF 
            (SELECT available from book where book.book_id = NEW.book_id) > 0 AND (select status from user_info where NEW.userinfo_id = user_info.userinfo_id) = TRUE 
        THEN 
           INSERT INTO transaction_info(transaction_id) values (NEW.transaction_id);
           RETURN NEW;    
        END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER add_transactiona AFTER INSERT ON transaction
FOR EACH ROW
EXECUTE PROCEDURE add_transactionsa();

CREATE OR REPLACE FUNCTION return_book() RETURNS TRIGGER
AS $$
BEGIN   
        IF (NEW.returndate - (select duedate from transaction_info WHERE NEW.transaction_id = transaction_info.transaction_id )) > 0 
        THEN 
        NEW.fines =  (NEW.returndate - (select duedate from transaction_info WHERE NEW.transaction_id = transaction_info.transaction_id ))*3000;
        UPDATE user_info SET status = FALSE WHERE user_info.userinfo_id =  (select userinfo_id from transaction where NEW.transaction_id = transaction.transaction_id );
        NEW.status = FALSE;
        END IF;
        UPDATE transaction SET status = TRUE WHERE transaction.transaction_id = NEW.transaction_id;
        UPDATE book SET available = available + 1 WHERE book.book_id = (select book_id from transaction where NEW.transaction_id = transaction.transaction_id);
        RETURN NEW; 

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER return_books BEFORE INSERT ON returnbooks
FOR EACH ROW
EXECUTE PROCEDURE return_book();

CREATE OR REPLACE FUNCTION check_fines() RETURNS TRIGGER
AS $$
BEGIN   
        IF ((SELECT sum(money) from fines group by userinfo_id having fines.userinfo_id = NEW.userinfo_id) >= (SELECT sum(fines) from returnbooks inner join transaction on returnbooks.transaction_id = transaction.transaction_id GROUP BY transaction.userinfo_id HAVING transaction.userinfo_id = NEW.userinfo_id))
        THEN 
            UPDATE user_info SET status = TRUE WHERE user_info.userinfo_id = NEW.userinfo_id;
        END IF;
        RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_fine AFTER INSERT ON fines
FOR EACH ROW
EXECUTE PROCEDURE check_fines();

-- test of insert a transaction
-- INSERT INTO transaction(userinfo_id,book_id) values (1,1);
-- INSERT INTO transaction(userinfo_id,book_id) values (2,3);
-- INSERT INTO transaction(userinfo_id,book_id) values (2,2);
-- test returnbooks 
-- INSERT INTO returnbooks(transaction_id,nhanvien_id) values (1,1);
-- check fines 
-- INSERT INTO returnbooks(transaction_id,nhanvien_id,returndate) values (39,1,'2022-08-06');
-- CHECK pay the fines to active account INSERT INTO fines(nhanvien_id,userinfo_id,money) values (1,12,48000);
