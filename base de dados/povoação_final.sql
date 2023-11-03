/*Povoar tabela especialidade */
Insert into mydb.especialidade (id_Especialidade, descricao) values (1, 'Cardiologia');
Insert into mydb.especialidade (id_Especialidade, descricao) values (2, 'Radiografia');
Insert into mydb.especialidade (id_Especialidade, descricao) values (3, 'Mamografia');
Insert into mydb.especialidade (id_Especialidade, descricao) values (4, 'Ultrassonografia');
Insert into mydb.especialidade (id_Especialidade, descricao) values (5, 'Tomografia Computadorizada');
Insert into mydb.especialidade (id_Especialidade, descricao) values (6, 'Ressonância Magnética');
Insert into mydb.especialidade (id_Especialidade, descricao) values (7, 'Radiologia');
Insert into mydb.especialidade (id_Especialidade, descricao) values (8, 'Intervencionista');
Insert into mydb.especialidade (id_Especialidade, descricao) values (9, 'Angiografia');
Insert into mydb.especialidade (id_Especialidade, descricao) values (10, 'Densitometria Óssea');
Insert into mydb.especialidade (id_Especialidade, descricao) values (11, 'Tomografia por Emissão de Positrões');

/*Povoar tabela  exames */
Insert into mydb.exames (id_Exames, tipo) values (001, 'Tomografia Computadorizada');
Insert into mydb.exames (id_Exames, tipo) values (002, 'Ressonância Magnética');
Insert into mydb.exames (id_Exames, tipo) values (003, 'Tomografia por Emissão de Pósitrons');
Insert into mydb.exames (id_Exames, tipo) values (004, 'Ultrassonografia');
Insert into mydb.exames (id_Exames, tipo) values (005, 'Raio-X');
Insert into mydb.exames (id_Exames, tipo) values (006, 'Radiografia');
Insert into mydb.exames (id_Exames, tipo) values (007, 'Fluoroscopia');
Insert into mydb.exames (id_Exames, tipo) values (008, 'Mamografia');
Insert into mydb.exames (id_Exames, tipo) values (009, 'Angiografia');
Insert into mydb.exames (id_Exames, tipo) values (010, 'Cintolografia');
Insert into mydb.exames (id_Exames, tipo) values (011, 'Ecografia');
Insert into mydb.exames (id_Exames, tipo) values (012, 'Ecocardiografia');
Insert into mydb.exames (id_Exames, tipo) values (013, 'Elastografia');
Insert into mydb.exames (id_Exames, tipo) values (014, 'Termografia');

/*Povoar tabela Codigo_Postal*/
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4820-435','Covas');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4800-465', 'Alverca');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4803-704', 'Lisboa');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4850-201', 'Porto');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4832-423', 'Braga');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4888-808', 'Faro');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4854-145', 'Ponta-delgada');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4843-953','Penafiel');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4876-875','Caminha');
Insert into mydb.codigo_postal(codigo_postal,localidade) values ('4821-764','Vila Real');

/*Povoar  técnicos*/
Insert into mydb.tecnicos (id_tecnicos,nome,data_entrada,data_nascimento,id_Especialidade, Codigo_Postal, morada) values(0001, 'José Andrade', '2018-10-09' , '1990-09-01',0001, '4843-953', 'Rua de São Mamede');
Insert into mydb.tecnicos (id_tecnicos,nome,data_entrada,data_nascimento,id_Especialidade, Codigo_Postal, morada)  values(0002, 'Antonio Fernandes', '2018-10-09', '1963-05-16',0002, '4820-435', 'Rua de São João');
Insert into mydb.tecnicos (id_tecnicos,nome,data_entrada,data_nascimento,id_Especialidade, Codigo_Postal, morada) values(0003, 'Maria Mendes', '2017-12-19', '1975-04-07',0003, '4800-465', 'Rua de São Simão');
Insert into mydb.tecnicos (id_tecnicos,nome,data_entrada,data_nascimento,id_Especialidade, Codigo_Postal, morada) values(0004, 'Tatiana Antonieta', '2018-10-09', '1994-09-27',0004, '4803-704', 'Rua de Camões');
Insert into mydb.tecnicos (id_tecnicos,nome,data_entrada,data_nascimento,id_Especialidade, Codigo_Postal, morada)  values (0005, 'Joana Gonçalves', '2017-12-19', '1980-07-21',0005, '4850-201', 'Rua das Flores');

/*Povoar tabela  Paciente*/
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0001, 'José Almeida', '1945-05-29', 'M', '4820-435', 'Rua da Andorinha', 14252487, 123456789, 231365457);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0002, 'Catarina Ferreira', '1950-11-03', 'F', '4800-465', 'Rua Sésamo', 12345678, 873420231, 745896231);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0003, 'Diogo Peixoto', '1970-09-13', 'M', '4803-704', 'Rua Vasco da Gama', 35647219, 753159824, 75319482);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0004, 'Maria Gomes', '1980-04-30', 'F', '4850-201', 'Rua Carvalhinho', 45678912, 314526476, 987654321);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0005, 'Filipe Lopes', '1990-02-17', 'M', '4832-423', 'Rua D.Joao IV', 65478912, 921354952, 258764913);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0006, 'Liliana Castro', '1988-08-08', 'F', '4888-808', 'Rua das Flores', 08534529, 712893456, 962587431);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0007, 'Francisco Ribeiro', '1974-06-22', 'M', '4854-145', 'Rua das Docas', 99999999, 999999999, 154245782);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0008, 'Mariana Fonseca', '1981-04-05','F', '4843-953', 'Rua de São Mamede', 11111111, 111111111, 451232007);
Insert into mydb.paciente (id_Paciente, nome, data_nascimento, sexo,  Codigo_Postal, morada,  CC, n_utente, NIF) values (0009, 'Matilde Branco', '1966-03-15', 'F', '4876-875', 'Rua do Gaiato', 22222222, 222222222, 741258967);

/*Povoar tabela  Salas*/
Insert into mydb.salas (id_Salas, localizacao, telefone) values (2,'00.04',253543655);
Insert into mydb.salas (id_Salas, localizacao, telefone) values (1,'00.03',253543654);
Insert into mydb.salas (id_Salas, localizacao, telefone) values (4,'00.06',253543657);
Insert into mydb.salas (id_Salas, localizacao, telefone) values (3,'00.05',253543656);

/*Povoar tabela paciente_contacto*/
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0001,'email','acds@gmail.com');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0001,'telefone','965432197');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0002,'email','hphp@gmail.com');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0003,'email','qwerty@gmail.com');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0003,'telefone','967788991');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0004,'email','asdf@gmail.com');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0004,'telefone','923456677');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0005,'email','pllp @gmail.com');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0006,'telefone','912345345');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0007,'email','zxcv@gmail.com');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0007,'telefone','932123123');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0008,'telefone','934563234');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0009,'email','ritor@gmail.com');
Insert into mydb.paciente_contacto(id_Paciente,tipo,valor) values (0009,'telefone','912345123');

/*Povoar tabela  secretariado*/
Insert into mydb.secretariado (id_Secretariado, nome) values (0011,'Carlos Sampaio');
Insert into mydb.secretariado (id_Secretariado, nome) values (0012,'Ana Castro');
Insert into mydb.secretariado (id_Secretariado, nome) values (0013,'Carmo Andrade');

/*Povoar tabela fornecedores*/
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0001,'SONOSCANNER');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0002, 'TEAMALEX MEDICAL');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0003, 'VIMS-VIDEO INTERVENTIONNELLE');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0004, 'KIZLON LTD.');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0005, 'MEDIAN TECHNOLOGIES');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0006, 'IMAGE & MEDICAL SYSTEMES - IMEDSYS');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0007, 'BIMEDIS');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0008, 'COGNIMED GMBH');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0009, 'CANON LUXEMBOURG');
Insert into mydb.fornecedor (id_Fornecedor,nome) values(0010, 'IDETEC MEDICAL IMAGING');

/*Povoar dispositivos*/
Insert into mydb.dispositivos (id_Dispositivos,nome) values (0001, 'Siemens Multix Select DR');
Insert into mydb.dispositivos (id_Dispositivos,nome) values (0002, 'Symbol (3-15 kW) – GMM');
Insert into mydb.dispositivos (id_Dispositivos,nome) values (0003, 'Telecomandada Swing – GMM');
Insert into mydb.dispositivos (id_Dispositivos,nome) values (0004, 'Siemens MAGNETOM Avanto');
Insert into mydb.dispositivos (id_Dispositivos,nome) values (0005, 'Siemens Emotion 16');

/*Povoar exames_paciente*/
Insert into mydb.exames_paciente(id_Exames,id_Paciente) values (0001,0001);
Insert into mydb.exames_paciente(id_Exames,id_Paciente) values (0002,0002);
Insert into mydb.exames_paciente(id_Exames,id_Paciente) values (0003,0003);
Insert into mydb.exames_paciente(id_Exames,id_Paciente) values (0004,0004);
Insert into mydb.exames_paciente(id_Exames,id_Paciente) values (0005,0005);

/*Povoar dispositivos_fornecedor*/
Insert into mydb.dispositivos_fornecedor(id_dispositivos,id_Fornecedor) values (0001,0001);
Insert into mydb.dispositivos_fornecedor(id_dispositivos,id_Fornecedor) values (0002,0002);
Insert into mydb.dispositivos_fornecedor(id_dispositivos,id_Fornecedor) values (0003,0003);
Insert into mydb.dispositivos_fornecedor(id_dispositivos,id_Fornecedor) values (0004,0004);
Insert into mydb.dispositivos_fornecedor(id_dispositivos,id_Fornecedor) values (0005,0005);

/*Povoar exames_secretariado*/
Insert into mydb.exames_secretariado(id_Secretariado,id_Exames,Data_Hora,id_Dispositivos,id_Tecnicos,id_Paciente) values(0011,0001, '2019-01-10 09:30:00', 0004, 0004, 0004);
Insert into mydb.exames_secretariado(id_Secretariado,id_Exames,Data_Hora,id_Dispositivos,id_Tecnicos,id_Paciente) values(0012,0003, '2019-07-07 16:00:00', 0001, 0001, 0001);
Insert into mydb.exames_secretariado(id_Secretariado,id_Exames,Data_Hora,id_Dispositivos,id_Tecnicos,id_Paciente) values(0013,0002, '2019-05-24 11:45:00', 0002, 0002, 0002);

/*Povoar manutenção*/
Insert into mydb.manutencao(id_Manutencao,tipo_avaria) values(0001,'botão encravado');
Insert into mydb.manutencao(id_Manutencao,tipo_avaria) values(0002,'não da imagem');
Insert into mydb.manutencao(id_Manutencao,tipo_avaria) values(0003,'demasiado barulho');

/*Povoar dispositivos_manutenção*/
Insert into mydb.dispositivos_manutencao(id_Dispositivos,id_Manutencao,data_manutencao,data_conserto) values(0001, 0001, '2019-10-10 09:00:00', '2019-11-11 15:30:00');
Insert into mydb.dispositivos_manutencao(id_Dispositivos,id_Manutencao,data_manutencao,data_conserto) values(0002, 0002, '2019-02-10 11:45:00', '2019-02-14 14:20:00');
Insert into mydb.dispositivos_manutencao(id_Dispositivos,id_Manutencao,data_manutencao,data_conserto) values(0003, 0003, '2019-03-10 17:50:00','2019-05-19 08:10:00');

/*Povoar dispositivos_salas*/
Insert into mydb.dispositivos_salas(id_Dispositivos,id_Salas) values(0001,1);
Insert into mydb.dispositivos_salas(id_Dispositivos,id_Salas) values(0002,2);
Insert into mydb.dispositivos_salas(id_Dispositivos,id_Salas) values(0003,3);
Insert into mydb.dispositivos_salas(id_Dispositivos,id_Salas) values(0004,4);

