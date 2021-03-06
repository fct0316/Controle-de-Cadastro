<%-- 
    Document   : home
    Created on : 18/04/2018, 02:43:28
    Author     : Fernando
--%>
<!--Agora é hora dos ajustes...-->

<%@page import="br.com.fatecpg.controlcadastro.BdCliente"%>
<%@page import="br.com.fatecpg.controlcadastro.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int index = 0;
    Cliente c = new Cliente();
    c.setNome("");
    c.setCpf("");
    c.setRg("");
    c.setEmail("");
    c.setTelefone("");
    c.setEndereco("");
    if(request.getParameter("add") != null)
    {
        //Cliente c = new Cliente();
        c.setNome(request.getParameter("nome"));
        c.setCpf(request.getParameter("cpf"));
        c.setRg(request.getParameter("rg"));
        c.setEmail(request.getParameter("email"));
        c.setTelefone(request.getParameter("telefone"));
        c.setEndereco(request.getParameter("endereco"));
        BdCliente.getClienteList().add(c);
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("del") != null)
    {
        BdCliente.getClienteList().remove(Integer.parseInt(request.getParameter("i")));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("alt") !=null)
    {
        //Cliente d = new Cliente();
        c.setNome(BdCliente.getClienteList().get(Integer.parseInt(request.getParameter("i"))).getNome());
        c.setCpf(BdCliente.getClienteList().get(Integer.parseInt(request.getParameter("i"))).getCpf());
        c.setRg(BdCliente.getClienteList().get(Integer.parseInt(request.getParameter("i"))).getRg());
        c.setEmail(BdCliente.getClienteList().get(Integer.parseInt(request.getParameter("i"))).getEmail());
        c.setTelefone(BdCliente.getClienteList().get(Integer.parseInt(request.getParameter("i"))).getTelefone());
        c.setEndereco(BdCliente.getClienteList().get(Integer.parseInt(request.getParameter("i"))).getEndereco());
        index = Integer.parseInt(request.getParameter("i"));
    }
    if(request.getParameter("sal") != null)
    {
        //Cliente c = new Cliente();
        c.setNome(request.getParameter("nome"));
        c.setCpf(request.getParameter("cpf"));
        c.setRg(request.getParameter("rg"));
        c.setEmail(request.getParameter("email"));
        c.setTelefone(request.getParameter("telefone"));
        c.setEndereco(request.getParameter("endereco"));
        BdCliente.clienteList.set(Integer.parseInt(request.getParameter("index")), c);
        response.sendRedirect(request.getRequestURI());
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro cliente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Clean responsive bootstrap website template">
        <meta name="author" content="">
  <!-- styles -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/docs.css" rel="stylesheet">
        <link href="assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
        <link href="assets/css/flexslider.css" rel="stylesheet">
        <link href="assets/css/refineslide.css" rel="stylesheet">
        <link href="assets/css/font-awesome.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">

        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/color/default.css" rel="stylesheet">
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <br><br>
        <br><br><br>
        <br>
        <section main="content">
        <div style = "max-width: 880px; margin: 0 auto; background-color: rgb(227, 252, 225); height: 100%; padding: 60px 90px; text-align: center;">        

        <center>
            
            
                     
        <h1>CADASTRO DE CLIENTE</h1>
        <fieldset>
            <%
                      if(request.getParameter("alt") != null)
                      {
                    %>
                        <lengend>Alterar Contato</lengend>
                    <%
                      }
                      else
                      {
                    %>
                        <lengend>Incluir Contato</lengend>
                    <%
                      }
                    %>
            <form>
                <br>
                <table align="center">
                    <tr><th>Nome:</th><td><input type="text" style = "border: 1px solid #00ff00;" name="nome" value="<%= c.getNome() %>"/></td></tr>
                    <tr><th>Cpf:</th><td><input type="text" style = "border: 1px solid #00ff00;" name="cpf" value="<%= c.getCpf()%>"/></td></tr>
                    <tr><th>Rg:</th><td><input type="text" style = "border: 1px solid #00ff00;" name="rg" value="<%= c.getRg() %>"/></td></tr>
                    <tr><th>Email:</th><td><input type="email" style = "border: 1px solid #00ff00;" name="email" value="<%= c.getEmail() %>"/></td></tr>
                    <tr><th>Telefone:</th><td><input type="text" style = "border: 1px solid #00ff00;" name="telefone" value="<%= c.getTelefone() %>"/></td></tr>
                    <tr><th>Endereço:</th><td><input type="text" style = "border: 1px solid #00ff00;" name="endereco" value="<%= c.getEndereco() %>"/></td></tr>
                    <%
                      if(request.getParameter("alt") != null)
                      {
                    %>
                        <tr align="center"><td colspan="2">
                                <input type="submit" name="sal" value="Salvar"/>
                                <input type="hidden" name="index" value="<%=index%>">
                            </td></tr>
                    <%
                      }
                      else
                      {
                    %>
                        <tr align="center"><td colspan="2"><input type="submit" name="add" value="Adicionar"/></td></tr>
                    <%
                      }
                    %>
                </table>
            </form>
        </fieldset>
        
        <hr>
        <form>
            Pesquisar
            <br>
            <input type="text" style = "border: 1px solid #00ff00;" name="parametro"/><br>
            <input type="submit" name="bus" value="Buscar"/>
        </form>
        <hr>
        <table border="2">
            <tr><th>Indice</th><th>Nome</th><th>Cpf</th><th>Rg</th><th>Email</th><th>Telefone</th><th>Endereço</th><th>-</th></tr>
            <%
                if(request.getParameter("bus") != null && request.getParameter("parametro") != null){
                for(int i = 0; i < BdCliente.getClienteList().size(); i++){
                    if(request.getParameter("parametro").equals(BdCliente.getClienteList().get(i).getNome())||
                       request.getParameter("parametro").equals(BdCliente.getClienteList().get(i).getCpf())||
                       request.getParameter("parametro").equals(BdCliente.getClienteList().get(i).getRg())||
                       request.getParameter("parametro").equals(BdCliente.getClienteList().get(i).getEmail())||
                       request.getParameter("parametro").equals(BdCliente.getClienteList().get(i).getTelefone())||
                       request.getParameter("parametro").equals(BdCliente.getClienteList().get(i).getEndereco())
                      ){
            %>
            <tr>
                <td><%=i+1%></td>
                
                <td><%=BdCliente.getClienteList().get(i).getNome()%></td>
                <td><%=BdCliente.getClienteList().get(i).getCpf()%></td>
                <td><%=BdCliente.getClienteList().get(i).getRg()%></td>
                <td><%=BdCliente.getClienteList().get(i).getEmail()%></td>
                <td><%=BdCliente.getClienteList().get(i).getTelefone()%></td>
                <td><%=BdCliente.getClienteList().get(i).getEndereco()%></td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>">
                        <input type="submit" name="alt" value="Alterar">
                        <input type="submit" name="del" value="Excluir">
                    </form>
                </td>
            </tr>
            <%      } }
                }
                else
                {
                    for(int i = 0; i < BdCliente.getClienteList().size(); i++){%>
                <tr>
                    <td><%=i+1%></td>
                
                    <td><%=BdCliente.getClienteList().get(i).getNome()%></td>
                    <td><%=BdCliente.getClienteList().get(i).getCpf()%></td>
                    <td><%=BdCliente.getClienteList().get(i).getRg()%></td>
                    <td><%=BdCliente.getClienteList().get(i).getEmail()%></td>
                    <td><%=BdCliente.getClienteList().get(i).getTelefone()%></td>
                    <td><%=BdCliente.getClienteList().get(i).getEndereco()%></td>
                    <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>">
                        <input type="submit" name="alt" value="Alterar">
                        <input type="submit" name="del" value="Excluir">
                    </form>
                </td>
                </tr>
                 <%   }
            }%>
        </table>
        
        <br>
        </center>
        </div>
        <br>
        </section>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
  <script src="assets/js/jquery.js"></script>
  <script src="assets/js/modernizr.js"></script>
  <script src="assets/js/jquery.easing.1.3.js"></script>
  <script src="assets/js/google-code-prettify/prettify.js"></script>
  <script src="assets/js/bootstrap.js"></script>
  <script src="assets/js/jquery.prettyPhoto.js"></script>
  <script src="assets/js/portfolio/jquery.quicksand.js"></script>
  <script src="assets/js/portfolio/setting.js"></script>
  <script src="assets/js/hover/jquery-hover-effect.js"></script>
  <script src="assets/js/jquery.flexslider.js"></script>
  <script src="assets/js/classie.js"></script>
  <script src="assets/js/cbpAnimatedHeader.min.js"></script>
  <script src="assets/js/jquery.refineslide.js"></script>
  <script src="assets/js/jquery.ui.totop.js"></script>
  <!-- Template Custom Javascript File -->
  <script src="assets/js/custom.js"></script>
</html>
