q=0;
while q~=1
IN = menu('arlimin', 'Carregar Dados','Efetuar C�lculos', 'Mostrar a ALM',...
    'Gravar ALM', ' Sair do programa');
  switch IN
    
    
    
    case  1
        
        Carregar  = input('Nome do ficheiro: ','s');
        
        v = fopen(Carregar);
        linhanomes=fgetl(v);
        celnomes=[];
        if  v == -1
            disp('Tem que ser um nome de um ficheiro que exista');
            Carregar  = input('Nome do ficheiro: ','s');
        else
            disp('ficheiro e texto abertos com sucesso')
        end
        
        for i=1:length(linhanomes)
            while ~isempty(linhanomes)
                [nomes,linhanomes]=strtok(linhanomes,',');
                celnomes=[celnomes,{nomes}];          % coloca os nomes num vetor de c�lulas
            end
        end
        
        
        
        
        
        matriz=[];
        while ~feof(v)
            B=str2num(fgetl(v));
            matriz=[matriz;B];
        end
        fclose(v);
        
        [linh,col]=size(matriz);
        for i=1:linh
            for j=1:col
                if matriz(i,j)==0
                    matriz(i,j)=inf;
                elseif i==j
                    matriz(i,j)=0;
                end
            end
        end
    case 2
        trocos=kruskal(matriz);
        disp('C�lculos efetuados com sucesso');
        
    case 3
        origem=input('Escreva numero da povoa�ao ou o seu nome :','s');
        if  isempty(str2num(origem))                              %ha 2 op�oes se o utilizador coloca nome(varios chars)ou se coloca numero
            y=0;                                                               %  escolheu nome
            while y==0
                
                origem=input('Escreva o nome s� mais uma vez :','s');
                
                for i=1:length(celnomes)
                    yy=celnomes{i};
                    if (strcmp(origem,yy(2:end)) || strcmp(origem,yy) )  % compara a existencia da variavel origem com espa�o no inicio ou sem espa�o no inicio com a variavel celnomes que contem os nomes das povoa�oes
                        origem=i;
                        y=y+1;
                        
                        
                    end
                    
                    
                end
                
            end
        else                                                                       %escolheu n�mero
            origem=str2num(origem);
            while ~(origem>0 && origem<=length(celnomes) && origem==fix(origem))
                
                disp('numero de povoa�ao n�o existente');
                origem=str2num(input('Escolha numero da povoa�ao :','s'));
                
            end
        end
        
        
        ALM=resultados(origem,trocos);
        [nome,extens]=strtok(Carregar,'.');
        [linhass,colunass]=size(ALM);
        fprintf('Caso %s\n\n',nome);
        
        
        fprintf('�rvore de liga��es m�nima com origem em %s  \n',celnomes{origem});
        
        fprintf('-----------------------------------------------------------------------\n')
        for i=1:linhass
            fprintf('%s  ',celnomes{ALM(i,1)});         %1a localidade(numero)� sempre copiada
            for j=2:3:colunass-1                               % ex 1 2 3 3 4 5 5 6 7
                if ALM(i,j)~=0                                       % ex  1 2 3 0 4 5 0 6 7
                                                                              % copiar distancias seguidas de numero da localidade,apartir da coluna 2 de 3 em 3 colunas ate a penultima coluna
                    fprintf('(%d  km)  %s ',ALM(i,j),celnomes{ALM(i,j+1)});
                    
                    
                end
            end
            fprintf('\n')
        end
        
        
        fprintf('\n\n')
        fprintf('Comprimento total da ALM = %d  km \n',sum(trocos(:,3)));
        
        
    case 4
        
        origem=input('Escreva numero da povoa�ao ou o seu nome:','s');
        
        if  isempty(str2num(origem))                              %ha 2 op�oes se o utilizador coloca nome(varios chars)ou se coloca numero
            y=0;                                                            %colocou nome
            while y==0
                
                origem=input('Escreva o nome s� mais uma vez :','s');
                
                for i=1:length(celnomes)
                    yy=celnomes{i};
                    if (strcmp(origem,yy(2:end)) || strcmp(origem,yy) )   % compara a existencia da variavel origem com espa�o no inicio ou sem espa�o no inicio
                        origem=i;
                        y=y+1;
                        
                    end
                    
                    
                end
                
            end
        else
            origem=str2num(origem);                                 %colocou n�mero
            while ~(origem>0 && origem<=length(celnomes) && origem==fix(origem))
                
                disp('numero de povoa�ao n�o existente');
                origem=str2num(input('Escolha numero da povoa�ao :','s'));
                
            end
        end
        
        
        ALM=resultados(origem,trocos);
        [linhass,colunass]=size(ALM);
        
        file=fopen([nome,'_ALM',extens],'w');
        fprintf(file,'Caso %s\n\n',nome);
        
        
        fprintf(file,'�rvore de liga��es m�nima com origem em %s  \n',celnomes{origem});
        
        fprintf(file,'-----------------------------------------------------------------------\n');
        for i=1:linhass
            fprintf(file,'%s  ',celnomes{ALM(i,1)});   % o primeiro n�mero da matriz ALM de cada linha e sempre copiado para file,esse numero corresponde a uma povoa�ao
            for j=2:3:colunass-1                                % ex  [ 1 2 3 0 4 5 0 6 7]
                if ALM(i,j)~=0                                       % o primeiro n�mero do vetor ja foi copiado,agora j vai da coluna 2  ,3 em 3 ,se nao encontrar nenhum 0 copia o valor (i,j)e o seguinte.
                    
     fprintf(file,'(%d  km)  %s ',ALM(i,j),celnomes{ALM(i,j+1)});   % colocano ficheiro a distancia seguida do nome,o primeiro valor ja la esta que sera sempre uma povoa�ao.
   
                end
            end
            fprintf(file,'\n');
        end
        
        
        fprintf(file,'\n\n');
        fprintf(file,'Comprimento total da ALM = %d  km \n',sum(trocos(:,3)));
        disp('Guardado com exito')
    case 5
        
        Sair  = menu('Tem a certeza que pretende fechar arlimin?','Sim', 'N�o');
        if Sair  == 1
           disp( 'arlimin fechado');
            break
        end
   end
end