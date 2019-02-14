function Vetor = featuresbyfrequencyweight(dirwav, timestart, timeend)

 %Lendo o arquivo .wav
            [X,Fs]=audioread(dirwav);

 % para cada arquivo wav, gerar espectrograma
            WINDOW=512;
            NOVERLAP=WINDOW/2;
            NFFT=WINDOW;
            [S [, f [, t]]] = specgram(X [, NOVERLAP [, Fs [, WINDOW [, overlap]]]]) 
            %[S,F,T,Y] =specgram(X,WINDOW,NOVERLAP,NFFT,Fs,'yaxis');
            
 %Salvando a matrix numa varíavel
            Spectrograma = abs(S);
            
 %Para cada espectrograma gerar o vetor de características  
     
     trecho = Spectrograma(1:end, timestart:timeend); %definindo a área de interesse
     numberofRows = size(trecho,1); %Pegando o número de linhas do trecho
	 pesos = (1 : numberofRows); %Criando o vetor de pesos sequencial 
     Vetor = sum(bsxfun(@times, pesos', trecho)); %Multiplicando as linhas pelos pesos e somando
     
 %Salvando o vetor em um arquivo .csv
 %      dirVET= strcat(dirVET,'.csv');
 %     xlswrite(dirVET, Vetor);
       
       return 

end