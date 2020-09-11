<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AmortizApp - Amortização Constante</title>
        <style>
            tr {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/bootstrap-head.jspf" %>
            <%@include file="WEB-INF/jspf/navbar.jspf" %>
            <%DecimalFormat formatador = new DecimalFormat("#.##");%>
            
        <form>
            <div style="width:200px; margin:auto; text-align: center">
                <label>Valor da Dívida</label><br>
                <input type="number" name="valorDivida" class="form-control"><br>
                <label>Quantidade de Parcelas</label><br>
                <input type="number" name="qtdParcelas" class="form-control"><br>
                <label>Taxa de Juros (%)</label><br>
                <input type="number" name="taxaJuros" class="form-control"><br>
                <input type="submit" value="Calcular" class="btn btn-primary">
            </div>
        </form>
            
            <% try {
                
                double amortizacao = 0, totalAmortizado = 0, totalJuros = 0, totalPrestacao = 0;
                double valorDivida = Double.parseDouble(request.getParameter("valorDivida"));
                double qtdParcelas = Double.parseDouble(request.getParameter("qtdParcelas"));
                double juros = Double.parseDouble(request.getParameter("taxaJuros"));
                double taxa = juros / 100;
                amortizacao = valorDivida / qtdParcelas; %>
                
            <%if((valorDivida > 0) && (qtdParcelas > 0) && (taxa > 0)){%>
               
                    <table class="table">
                        <tr>
                            <th>Mês</th>
                            <th>Valor da Parcela</th>
                            <th>Valor dos Juros</th>
                            <th>Valor de Amortização</th>
                            <th>Saldo Devedor Total</th>
                            
                           <tr>
                            <td>0</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td><%=formatador.format(valorDivida)%></td>
                           </tr>
                           
                           <%for (int i = 1; i <= qtdParcelas && valorDivida > 0; i++) {%>
                           <tr>
                               
                <td><%=i%></td>
                <%qtdParcelas = amortizacao + (valorDivida * taxa);%>
                <td><%=formatador.format(qtdParcelas)%></td>
                <%totalPrestacao = qtdParcelas + totalPrestacao;
                    juros = valorDivida * taxa;
                    totalJuros = juros + totalJuros;
                    totalAmortizado = amortizacao + totalAmortizado;%>
                    
                <td><%=formatador.format(juros)%></td>
                <td><%=formatador.format(amortizacao)%></td>
                <%valorDivida = valorDivida - amortizacao;%>
                <td><%=formatador.format(valorDivida)%></td>              
                </tr>
            <%}%>
            <tr>               
                <td> Total </td>
                <td><%=formatador.format(totalPrestacao)%></td>
                <td><%=formatador.format(totalJuros)%></td>
                <td><%=formatador.format(totalAmortizado)%></td>
                <td>  -  </td>
            </tr>
       </table>
               
            <%}

            else{
            out.println("Valor inválido ou não informado!");
            };


            }   catch(Exception ex) {;
            }
            %>
            <%@include file="WEB-INF/jspf/bootstrap-scripts.jspf" %>    
        </div>
    </body>
</html>

