# Exercício 7 — Gatilho de CEP (Respostas Teóricas)

a. 
    *Campo (Domínio):* É o campo disparador da ação (no nosso caso, `A1_CEP`). É o campo onde o usuário digita a informação e aciona o evento ao teclar *Tab* ou *Enter*.
    *Contra-domínio:* É o campo destino que receberá o valor gerado pelo gatilho (ex: `A1_BAIRRO`, `A1_MUN`, `A1_EST`).
    *Regra:* É a fórmula ou função (ex: `U_STCEP(...)`) executada no momento do disparo. O resultado retornado por essa regra é o valor que preencherá o contra-domínio.

b. 
    *`M->A1_CEP` (Variável de Memória):* Representa o valor que está sendo digitado na tela pelo usuário naquele exato momento (antes de salvar o formulário).
    *`SA1->A1_CEP` (Campo da Tabela):* Representa o valor que já está gravado fisicamente no banco de dados.

- Como o gatilho dispara durante a edição do formulário, o novo CEP ainda não foi gravado no banco de dados. Se usássemos `SA1->A1_CEP`, o gatilho leria o dado antigo ou um valor em branco.

c. 
    1. Problemas:
        Manutenibilidade Ruim: Qualquer mudança de CEP ou adição de uma nova rua exige alterar o código-fonte `.prw` e recompilar o RPO do sistema.
        Inviabilidade Escalar: É impossível cadastrar manualmente no código os mais de 1 milhão de CEPs existentes no Brasil.

    2. Como resolver em um projeto real:
        Uso de Tabela do Dicionário: Consultar uma tabela interna de CEPs/Municípios do próprio Protheus (como a `CC2` ou uma tabela customizada) usando `DbSeek()` ou `POSICIONE()`.
        Serviço Externo (API REST - Recomendado): Fazer a função consumir uma API pública ou privada (ex: ViaCEP) via requisição HTTP (`FWRest`). A função envia o CEP digitado e a API devolve o endereço atualizado em formato JSON.

d. 
    1. Criaria uma nova sequência de gatilho (`004`) no campo `A1_CEP`.
    2. Definiria o Contra-domínio como `A1_COD_MUN`.
    3. Ajustaria a função `U_STCEP` para tratar o parâmetro `"COD_MUN"` (retornando o código IBGE do município) e configuraria a **Regra** como:
   ```advpl
   U_STCEP(M->A1_CEP, "COD_MUN")