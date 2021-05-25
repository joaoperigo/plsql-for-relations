SET SERVEROUTPUT ON;    

--ex 1
DECLARE 
    num_habitantes_A NUMBER DEFAULT 5000000;
    num_habitantes_B NUMBER DEFAULT 7000000;
    perc_nat_A NUMBER DEFAULT 0.03;
    perc_nat_B NUMBER DEFAULT 0.02;
    qtde_anos NUMBER DEFAULT 0;
BEGIN
    WHILE num_habitantes_A <= num_habitantes_B LOOP
        qtde_anos := qtde_anos + 1;
        num_habitantes_A := num_habitantes_A + num_habitantes_A * perc_nat_A;
        num_habitantes_B := num_habitantes_B + num_habitantes_B * perc_nat_B;
    END LOOP;
    dbms_output.put_line('Quantidade de anos: ' || qtde_anos);
END;



--ex 2
DECLARE 
    alt_Chico NUMBER DEFAULT 1.50;
    alt_Juca NUMBER DEFAULT 1.00;
    cresc_Chico NUMBER DEFAULT 0.01;
    cresc_Juca NUMBER DEFAULT 0.03;
    qtde_anos NUMBER DEFAULT 0;
BEGIN
    WHILE alt_Juca <= alt_Chico LOOP
        qtde_anos := qtde_anos + 1;
        alt_Chico := alt_Chico + alt_Chico * cresc_Chico;
        alt_Juca := alt_Juca + alt_Juca * cresc_Juca;
        dbms_output.put_line('Quantidade de anos: ' || qtde_anos || ' Altura de Chico:  ' || ROUND(alt_chico,2) || ' Altura de Juca: ' || ROUND(alt_juca,2));
    END LOOP;
    dbms_output.put_line('Para terem alturas iguais serão: ' || qtde_anos || ' anos');
END;



--ex 3
ACCEPT in_n NUMBER PROMPT 'DIGITE UM NUMERO INTEIRO MAIOR QUE ZERO: '
DECLARE
    x NUMBER;
    fat NUMBER :=1;
   
BEGIN
    x := &in_n;
    
    IF x<1 THEN
        dbms_output.put_line('Não é possivel Calcular o Fatorial de zero');
    ELSE
        WHILE x>0 LOOP
            fat := fat * x;
            x := x-1;
        END LOOP;
        dbms_output.put_line('O Fatorial de ' || &in_n || '! é: ' || fat);
    END IF;
        
END;
 
 
    
--ex 4
ACCEPT in_valor NUMBER PROMPT 'Digite um valor';

DECLARE
    valor NUMBER;
    conta_divisores NUMBER DEFAULT 0;
    
BEGIN
    valor := &in_valor;
    FOR  i IN 2..valor - 1 LOOP
        IF MOD(valor, i) = 0 THEN
            conta_dividores := conta_divisores + 1;
        END IF;
    END LOOP;
    
    dbms_output.put_line(
        CASE
            WHEN conta_divisores = 0 THEN 'É primo'
            ELSE 'Não é primo'
        END
    );
END;



--ex 5
ACCEPT in_x NUMBER PROMPT 'Numero: '

DECLARE 
    n NUMBER;
    x NUMBER;
    y NUMBER;
BEGIN
    n := &in_x;
    y:=1;
    x:= y * y+1;
    WHILE x<n LOOP
        y:= y+1;
        x:=y+ y+1;
    END LOOP;
    IF x != n THEN
        dbms_output.put_line(n||' é triangular.');  
    ELSE
        dbms_output.put_line(n||' não é triangular.');
    END IF;
END;







-- ex 3
CREATE TABLE tb_departamento(
    cod_departamento INT PRIMARY KEY,
    nome VARCHAR2(200)
);

CREATE TABLE tb_disciplina (
    cod_disciplina INT PRIMARY KEY,
    nome VARCHAR2 (50),
    descricao VARCHAR2 (300),
    cod_departamento INT NOT NULL,
    CONSTRAINT fk_departamento FOREIGN KEY (cod_departamento) REFERENCES tb_departamento (cod_departamento)
);

CREATE TABLE tb_pre_requisito (
    cod_liberada INT PRIMARY KEY,
    cod_liberadora INT PRIMARY KEY,
    CONSTRAINT fk_liberada FOREIGN KEY (cod_liberada) REFERENCES tb_disciplina (cod_disciplina),
    CONSTRAINT fk_liberadora FOREIGN KEY (cod_liberadora) REFERENCES tb_disciplina (cod_disciplina)
);

CREATE TABLE tb_curso (
    cod_curso INT PRIMARY KEY,
    nome VARCHAR2 (200) NOT NULL
);

CREATE TABLE tb_disciplina_curso(
    cod_disciplina INT PRIMARY KEY,
    cod_curso INT PRIMARY KEY,
    CONSTRAINT fk_disciplina FOREIGN KEY (cod_disciplina) REFERENCES tb_disciplina (cod_disciplina),
    CONSTRAINT fk_curso  FOREIGN KEY (cod_curso) REFERENCES tb_curso (cod_curso)
);

CREATE TABLE tb_aluno (
    cod_aluno INT PRIMARY KEY,
    nome VARCHAR2 (200),
    cod_curso INT NOT NULL,
    CONSTRAINT fk_curso FOREIGN KEY (cod_curso) REFERENCES tb_curso (cod_curso)
);