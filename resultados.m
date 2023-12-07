function D=resultados(or,m)                               %or=numero escolhido
                                                                              % m=matriz 

k=0;
[nlinhas,ncolunas]=size(m);
z=0;


while sum(m)~=0                                                  %estrategia usada para começar o loop,enquanto nao houver uma coluna toda de zeros
    
    b=or;
    V=[];
    
    for i=1:nlinhas
        N=b;
        for j=1:ncolunas-1                                       %vai-se avaliar a matriz elemento a elemento sem contar com a 3 coluna ,que sao as distâncias
            
            
            if  (m(i,j)==N   &&  j==1)                          %se o numero escolhido existir na matriz na 1a coluna copia esse valor ,o da coluna 3 ,e o da coluna 2
                
                
                V=[V,m(i,j) m(i,j+2) m(i,j+1)];                   %o proximo valor a ser avaliado na matriz é o seguinte
                b=m(i,j+1);                                                %a linha do N e colocada com zeros,pois quando o j for avaliar o seguinte N que agora é o b ,nao considerar esse valor 
                m(i,:)=0;                                                 % pois nao queremos esse valor a ser avaliado nessa linha mas sim numa outra qualquer
            elseif (m(i,j)==N   &&  j==2)                      
                                                                                 %se o número se encontrar na 2a coluna copia se a ele,ao seguinte que sao as distanicas,e ao anterior
                V=[V ,m(i,j) m(i,j+1),m(i,j-1) ];
                b=m(i,j-1);                                              
                m(i,:)=0;                                                  
            end
            
        end
        
        
    end
    
    k=k+1;
    
    l(k).arlm=V;                                                      %o vetor linha V vai para uma estrutura com indice k ,indice que avalia quantos caminhos ja foram descobertos no loop acima
    R=l(k).arlm;
    
    if isempty(R)                                                    %como uma coluna completa de m,nunca chega a ser 0 ,o while está num loop infinito
        break                                                               %na 1a vez que ele tenha [] o loop para
    end
    
    if z==0                                                               % cria uma matriz de zeros com comprimento máximo possivel que seriam todos os valores da matriz num vetor linha (1,:)
        GG=zeros(nlinhas.*ncolunas);
        z=z+1;
    end
  
    
    for i=k                                                               %copia os valores da estrutura 1 a 1 e poe na matriz zeros GG
        for j=1:length(R)
            GG(i,j)=R(1,j);
        end
    end
end

                                                                                  %raciocinio igual ao de cima mas agora o m é a matriz restante,aquela com os numeros que nao chegaram a ser avaliados e com as linhas dos usados iguais a 0
k=0;
z=0;

while sum(m)~=0
    [xx,~]=size(m);
    o=[];
    for i=1:xx
        if sum(m(i,:))==0
            o=[o,i];
        end
    end
    m(o,:)=[];
    
    b= randi([min(m(:,2)),max(m(:,2))]);                 %valor de uma povoaçao escolhido aleatoriamente da matriz restante da coluna 2
    V=[];                                                                            
    [nlinhas1,ncolunas1]=size(m);
    
    for i=1:nlinhas1
        N=b;
        for j=1:ncolunas1-1                                
            
            
            if  (m(i,j)==N   &&  j==1)               
                
                
                V=[V,m(i,j) m(i,j+2) m(i,j+1)];               
                b=m(i,j+1);                                             
                m(i,:)=0;                                           
            elseif (m(i,j)==N   &&  j==2) 
                
                V=[V ,m(i,j) m(i,j+1),m(i,j-1) ];
                b=m(i,j-1);                                               
                m(i,:)=0;                                                  
            end
            
        end
        
        
        
        
    end
    k=k+1;
    l(k).arlm=V;
    
    R= l(k).arlm;
    if isempty(R)
        break
    end
    
       if  z==0
        BB=zeros(length(GG));
        z=z+1;
       end
        
        
    
    
    for i=k
        for j=1:length(R)
            BB(i,j)=R(1,j);
        end
    end
    
end

AA=[GG;BB];
[xxx,~]=size(AA);
o=[];
for i=1:xxx
    if sum(AA(i,:))==0                                               %coloca na variavel 0 os indices das linhas que so têm zeros
        o=[o,i];
    end
end
AA(o,:)=[];                                                                %apaga as linhas de zeros


[lin,col]=size(AA);
                                                            
    for i=1:lin
        for j=3:col-1                                                   % valor minimo para nao se eliminar origens repetidas ou seja as primeiras 3 colunas nunca terão zeros
            if AA(i,j)==AA(i,j+1)                                  %numero repete-se,o seguinte ficará 0 na matriz
                AA(i,j+1)=0;                                          %número de zeros sera igual (numero de colunas que nao tem 0,apartir da quarta coluna, a dividir por 3)-1,isto por cada linha
            end                                                            %ex: 1 (3km) 3  3 (4km) 5 =1 (3km) 3  0  4(km)  5  (6colunas = 1 zero)
                                                                              %se for matriz [n,3] nao tera zeros,todos números serão mantidos na matriz
        end                                                                %ex: 1 (3) 3 = 1 (3) 3
    end

D=AA;
end

