/* użytkownicy admin/admin i user/pass */
INSERT INTO user (username, email, registration_date, password)
VALUES ('admin', 'admin@example.com', '2022-11-30 09:37:22',
        '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'),
       ('user', 'user@example.com', '2022-11-30 10:37:22',
        'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1');

INSERT INTO user_role (username, role_name)
VALUES ('admin', 'ADMIN'),
       ('user', 'USER');

INSERT INTO category (name, description)
VALUES ('Rozrywka',
        'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue'),
       ('Biznes',
        'erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede'),
       ('Polityka',
        'ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla');

INSERT INTO discovery (title, url, description, date_added, category_id, user_id)
VALUES ('molestie lorem quisque', 'http://ow.ly/odio/curabitur/convallis.js',
        'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim',
        '2020-04-09 13:45:51', 3, 1),
       ('hac', 'http://yahoo.co.jp/aliquam/non/mauris/morbi.xml',
        'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi',
        '2020-01-22 11:55:54', 3, 2),
       ('blandit lacinia', 'http://washington.edu/velit/id/pretium/iaculis/diam/erat.png',
        'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in',
        '2020-07-05 13:02:27', 1, 1),
       ('ipsum primis in', 'http://pinterest.com/platea/dictumst/morbi/vestibulum/velit/id.json',
        'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac',
        '2020-11-18 14:13:53', 1, 2),
       ('ipsum primis in', 'http://arizona.edu/amet/nulla/quisque/arcu/libero/rutrum/ac.js',
        'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce',
        '2020-01-30 23:36:48', 3, 1),
       ('id massa id', 'https://yelp.com/vel/enim/sit/amet/nunc.jsp',
        'blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit',
        '2020-01-30 16:58:09', 2, 2),
       ('ac', 'http://cmu.edu/nulla/integer/pede/justo.png',
        'accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim',
        '2020-02-04 07:16:18', 2, 1),
       ('pretium quis lectus', 'https://businessweek.com/nisi/vulputate/nonummy.xml',
        'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce',
        '2020-09-05 06:09:55', 1, 2),
       ('venenatis turpis', 'https://w3.org/diam/in/magna.aspx',
        'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod', '2020-02-18 15:15:44', 1, 1),
       ('at velit', 'https://1688.com/porttitor/lacus/at/turpis/donec/posuere.html',
        'magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui',
        '2020-08-29 11:54:58', 3, 2);
