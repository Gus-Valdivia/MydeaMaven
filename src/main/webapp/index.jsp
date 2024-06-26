<%-- 
    Document   : index
    Created on : 2 nov 2023, 16:19:47
    Author     : altro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.Persona"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, charset=UTF-8">
        <jsp:include page="templates/Referencias/Todas_Ref.jsp"/>
        <title>Difunde tú negocio con Mydea</title>
    </head>
    <body class="index">
        <jsp:include page="templates/Navegadores/Navegador_SC.jsp"/>
        <%
            HttpSession session1 = request.getSession(false);
            session1.invalidate();

        %>
        <%            Conexion con;
            Connection c;
            Statement stmt;
            ResultSet rs;
            ResultSet r;

            int neid;
            int i = 0;

        %>
        <%            con = new Conexion();
            con.setCon();
            c = con.getCon();
            stmt = c.createStatement();

            r = stmt.executeQuery("Select * From Negocio where neg_activo=true LIMIT 3");
            int k = 0;

            String[] nombreg = new String[3];
            String[] dd = new String[3];
            String[] imgg = new String[3];
            String[] img2 = new String[3];
            int[] idg = new int[7];

            while (r.next()) {

                nombreg[k] = r.getString("neg_nombre");
                dd[k] = r.getString("neg_descripcion");
                imgg[k] = r.getString("neg_logo");
                idg[k] = r.getInt("neg_id");
                img2[k] = r.getString("neg_imagen1");
                k = k + 1;
            }
        %>
        <!--CARROUSEL PRINCIPAL-->
        <div id="carouselExampleInterval" class="carousel slide carousel_neg" data-bs-ride="carousel">
            <div class="carousel-inner h-100">
                <div class="carousel-item active h-100" data-bs-interval="10000">
                    <img src="<%=img2[0]%>" class="d-block w-100 h-100 imgn" alt="...">
                    <div class="neg d-flex justify-content-center align-items-center">
                        <section class="w-100 h-100 d-flex flex-column justify-content-center section_neg">
                            <section class="Nom_neg_indx_sect">
                                <span class="Nom_neg_indx d-flex align-items-center"><%=nombreg[0]%>.</span>
                                <hr>
                            </section>
                            <section class="d-flex flex-column desc justify-content-between">
                                <span class="Des_neg_indx"><%=dd[0]%></span>
                                <form action="NegocioSC.jsp">
                                    <input type="hidden" name="idn" value="<%=idg[0]%>"/>
                                    <button type="submit" class="btn btn_exp">Explorar <i class="bi bi-caret-right"></i></button>
                                </form>
                            </section>
                        </section>
                        <section class="w-50 h-100 d-flex justify-content-center align-items-center section_imagen_neg">
                            <img src="<%=imgg[0]%>" alt="" class="img_lg_crrs">
                        </section>
                    </div>
                </div>
                <div class="carousel-item h-100" data-bs-interval="2000">
                    <img src="<%=img2[1]%>" class="d-block w-100 h-100 imgn" alt="...">
                    <div class="neg d-flex justify-content-center align-items-center">
                        <section class="w-100 h-100 d-flex flex-column justify-content-center section_neg">
                            <section class="Nom_neg_indx_sect">
                                <span class="Nom_neg_indx d-flex align-items-center"><%=nombreg[1]%>.</span>
                                <hr>
                            </section>
                            <section class="d-flex flex-column desc justify-content-between">
                                <span class="Des_neg_indx"><%=dd[1]%></span>
                                <form action="NegocioSC.jsp">
                                    <input type="hidden" name="idn" value="<%=idg[1]%>"/>
                                    <button type="submit" class="btn btn_exp">Explorar <i class="bi bi-caret-right"></i></button>
                                </form>
                            </section>
                        </section>
                        <section class="w-50 h-100 d-flex justify-content-center align-items-center section_imagen_neg">
                            <img src="<%=imgg[1]%>" alt="" class="img_lg_crrs">
                        </section>
                    </div>
                </div>
                <div class="carousel-item h-100">
                    <img src="<%=img2[2]%>" class="d-block w-100 h-100 imgn" alt="...">
                    <div class="neg d-flex justify-content-center align-items-center">
                        <section class="w-100 h-100 d-flex flex-column justify-content-center section_neg">
                            <section class="Nom_neg_indx_sect">
                                <span class="Nom_neg_indx d-flex align-items-center"><%=nombreg[2]%>.</span>
                                <hr>
                            </section>
                            <section class="d-flex flex-column desc justify-content-between">
                                <span class="Des_neg_indx"><%=dd[2]%></span>
                                <form action="NegocioSC.jsp">
                                    <input type="hidden" name="idn" value="<%=idg[2]%>"/>
                                    <button type="submit" class="btn btn_exp">Explorar <i class="bi bi-caret-right"></i></button>
                                </form>
                            </section>
                        </section>
                        <section class="w-50 h-100 d-flex justify-content-center align-items-center section_imagen_neg">
                            <img src="<%=imgg[2]%>" alt="" class="img_lg_crrs">
                        </section>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev btn_crr" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next btn_crr" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!--INFORMACIÓN-->
        <div class="information_index justify-content-around">
            <section class="card_info_in card_qs d-flex justify-content-between">
                <section class=" section_img w-100 p-2">
                    <img src="assets/logo_mydea_comida.png" alt="" class="w-100 mydea_letras_img">
                    <img src="assets/Myde.png" alt="" class="w-100 myde_card_in">
                </section>
                <section class="d-flex flex-column text-white text_qs_card p-2 justify-content-evenly align-items-center Inria">
                    <span class="w-100 text_qs_card_tt justify-content-center">¿Quiénes somos?</span>
                    <span class="text_qs_card_ds">Somos Ethev, una empresa dedicada a desarrollar soluciones tecnológicas mediante la implementación del desarrollo de Software para resolver problemas en la Ciudad de México. Este proyecto, Mydea, está enfocado en impulsar y promover pequeños negocios en la alcaldía de Xochimilco, brindándoles visibilidad y apoyo para aumentar su reconocimiento y crecimiento en la comunidad.</span>
                </section>
            </section>
            <section class="card_info_in card_cmn d-flex justify-content-end">
                <img class="img_card_cm" src="assets/cmn.png" alt="">
                <section class="d-flex flex-column text-white justify-content-evenly align-items-center text_qs_card Inria">
                    <span class="w-100 text_qs_card_tt justify-content-center">Consulta miles de negocios.</span>
                    <span class="text_qs_card_ds">Descubre miles de opciones para satisfacer tu hambre o antojitos. Desde restaurantes acogedores hasta panaderías innovadoras, nuestra plataforma te ofrece acceso a una diversidad de negocios locales de comida o snacks. Encuentra lo que buscas y explora nuevas oportunidades en nuestra extensa red de emprendimientos.</span>
                </section>
            </section>
            <section class="card_info_in card_eib d-flex justify-content-end">
                <img class="img_card_cm" src="assets/eib.png" alt="" id="img_card_eib">
                <section class="d-flex flex-column text-white justify-content-evenly align-items-center text_qs_card Inria">
                    <span class="w-100 text_qs_card_tt justify-content-center">Encuentra los insumos que buscas.</span>
                    <span class="text_qs_card_ds">Explora una gran variedad de insumos al alcance de un clic. Desde ingredientes frescos hasta utensilios de cocina especializados, nuestra plataforma te conecta con proveedores locales de restaurantes, panaderías, abarrotes y más. Encuentra los productos esenciales para tus creaciones culinarias.</span>
                </section>
            </section>
        </div>

        <div class="information_index_mobile justify-content-around">
            <section class="card_info_in_mobile card_qs d-flex justify-content-between">
                <section class="d-flex flex-column text-white text_qs_card p-2 justify-content-evenly align-items-center Inria">
                    <span class="w-100 text_qs_card_tt justify-content-center">¿Quiénes somos?</span>
                    <span class="text_qs_card_ds_mobile">Somos Ethev, una empresa dedicada a desarrollar soluciones tecnológicas mediante la implementación del desarrollo de Software para resolver problemas en la Ciudad de México. Este proyecto, Mydea, está enfocado en impulsar y promover pequeños negocios en la alcaldía de Xochimilco, brindándoles visibilidad y apoyo para aumentar su reconocimiento y crecimiento en la comunidad.</span>
                </section>
            </section>
            <section class="card_info_in_mobile card_cmn d-flex justify-content-between">
                <section class="d-flex flex-column text-white text_qs_card p-2 justify-content-evenly align-items-center text_qs_card Inria">
                    <span class="w-100 text_qs_card_tt justify-content-center">Consulta miles de negocios.</span>
                    <span class="text_qs_card_ds_mobile">Descubre miles de opciones para satisfacer tu hambre o antojitos. Desde restaurantes acogedores hasta panaderías innovadoras, nuestra plataforma te ofrece acceso a una diversidad de negocios locales de comida o snacks. Encuentra lo que buscas y explora nuevas oportunidades en nuestra extensa red de emprendimientos.</span>
                </section>
            </section>
            <section class="card_info_in_mobile card_eib d-flex justify-content-between">
                <section class="d-flex flex-column text-white text_qs_card p-2 justify-content-evenly align-items-center text_qs_card Inria">
                    <span class="w-100 text_qs_card_tt justify-content-center">Encuentra los insumos que buscas.</span>
                    <span class="text_qs_card_ds_mobile">Explora una gran variedad de insumos al alcance de un clic. Desde ingredientes frescos hasta utensilios de cocina especializados, nuestra plataforma te conecta con proveedores locales de restaurantes, panaderías, abarrotes y más. Encuentra los productos esenciales para tus creaciones culinarias.</span>
                </section>
            </section>
        </div>
        <!--LOS MEJORES NEGOCIOS-->
        <!--Luego se borra-->

        <button onclick="location.href = 'Asistente.jsp';">asistente</button>
        <div class="padd_lds">
            <svg class="svg_ft_lmn" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 186 186" preserveAspectRatio="none" width="100%" height="100%">
            <path d="M91.3318 0.770388C91.9372 -0.256794 93.4229 -0.256797 94.0283 0.770386L103.476 16.8012C103.975 17.6488 105.124 17.8307 105.861 17.1789L119.799 4.85214C120.693 4.06229 122.106 4.52142 122.364 5.68539L126.395 23.851C126.608 24.8114 127.644 25.3393 128.547 24.9472L145.612 17.5311C146.706 17.0559 147.908 17.9292 147.794 19.116L146.014 37.6383C145.92 38.6176 146.743 39.4398 147.722 39.3457L166.244 37.5662C167.431 37.4521 168.304 38.6541 167.829 39.7476L160.413 56.8134C160.021 57.7157 160.549 58.7518 161.509 58.9649L179.675 62.9962C180.839 63.2545 181.298 64.6675 180.508 65.5606L168.181 79.4995C167.529 80.2364 167.711 81.3849 168.559 81.8844L184.59 91.3318C185.617 91.9372 185.617 93.4229 184.59 94.0283L168.559 103.476C167.711 103.975 167.529 105.124 168.181 105.861L180.508 119.799C181.298 120.693 180.839 122.106 179.675 122.364L161.509 126.395C160.549 126.608 160.021 127.644 160.413 128.547L167.829 145.612C168.304 146.706 167.431 147.908 166.244 147.794L147.722 146.014C146.743 145.92 145.92 146.743 146.014 147.722L147.794 166.244C147.908 167.431 146.706 168.304 145.612 167.829L128.547 160.413C127.644 160.021 126.608 160.549 126.395 161.509L122.364 179.675C122.106 180.839 120.693 181.298 119.799 180.508L105.861 168.181C105.124 167.529 103.975 167.711 103.476 168.559L94.0283 184.59C93.4229 185.617 91.9372 185.617 91.3318 184.59L81.8844 168.559C81.3849 167.711 80.2364 167.529 79.4995 168.181L65.5606 180.508C64.6675 181.298 63.2545 180.839 62.9962 179.675L58.9649 161.509C58.7518 160.549 57.7157 160.021 56.8134 160.413L39.7476 167.829C38.6541 168.304 37.4521 167.431 37.5662 166.244L39.3457 147.722C39.4398 146.743 38.6176 145.92 37.6383 146.014L19.116 147.794C17.9292 147.908 17.0559 146.706 17.5311 145.612L24.9472 128.547C25.3393 127.644 24.8114 126.608 23.851 126.395L5.68539 122.364C4.52141 122.106 4.06229 120.693 4.85214 119.799L17.1789 105.861C17.8307 105.124 17.6488 103.975 16.8012 103.476L0.770388 94.0283C-0.256794 93.4229 -0.256797 91.9372 0.770386 91.3318L16.8012 81.8844C17.6488 81.3849 17.8307 80.2364 17.1789 79.4995L4.85214 65.5606C4.06229 64.6675 4.52142 63.2545 5.68539 62.9962L23.851 58.9649C24.8114 58.7518 25.3393 57.7157 24.9472 56.8134L17.5311 39.7476C17.0559 38.6541 17.9292 37.4521 19.116 37.5662L37.6383 39.3457C38.6176 39.4398 39.4398 38.6176 39.3457 37.6383L37.5662 19.116C37.4521 17.9292 38.6541 17.0559 39.7476 17.5311L56.8134 24.9472C57.7157 25.3393 58.7518 24.8114 58.9649 23.851L62.9962 5.68539C63.2545 4.52141 64.6675 4.06229 65.5606 4.85214L79.4995 17.1789C80.2364 17.8307 81.3849 17.6488 81.8844 16.8012L91.3318 0.770388Z" fill="#FFCC18"/>
            </svg>
            <svg class="svg_lt_lmn" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 186 186" preserveAspectRatio="none" width="100%" height="100%">
            <path d="M91.3318 0.770388C91.9372 -0.256794 93.4229 -0.256797 94.0283 0.770386L103.476 16.8012C103.975 17.6488 105.124 17.8307 105.861 17.1789L119.799 4.85214C120.693 4.06229 122.106 4.52142 122.364 5.68539L126.395 23.851C126.608 24.8114 127.644 25.3393 128.547 24.9472L145.612 17.5311C146.706 17.0559 147.908 17.9292 147.794 19.116L146.014 37.6383C145.92 38.6176 146.743 39.4398 147.722 39.3457L166.244 37.5662C167.431 37.4521 168.304 38.6541 167.829 39.7476L160.413 56.8134C160.021 57.7157 160.549 58.7518 161.509 58.9649L179.675 62.9962C180.839 63.2545 181.298 64.6675 180.508 65.5606L168.181 79.4995C167.529 80.2364 167.711 81.3849 168.559 81.8844L184.59 91.3318C185.617 91.9372 185.617 93.4229 184.59 94.0283L168.559 103.476C167.711 103.975 167.529 105.124 168.181 105.861L180.508 119.799C181.298 120.693 180.839 122.106 179.675 122.364L161.509 126.395C160.549 126.608 160.021 127.644 160.413 128.547L167.829 145.612C168.304 146.706 167.431 147.908 166.244 147.794L147.722 146.014C146.743 145.92 145.92 146.743 146.014 147.722L147.794 166.244C147.908 167.431 146.706 168.304 145.612 167.829L128.547 160.413C127.644 160.021 126.608 160.549 126.395 161.509L122.364 179.675C122.106 180.839 120.693 181.298 119.799 180.508L105.861 168.181C105.124 167.529 103.975 167.711 103.476 168.559L94.0283 184.59C93.4229 185.617 91.9372 185.617 91.3318 184.59L81.8844 168.559C81.3849 167.711 80.2364 167.529 79.4995 168.181L65.5606 180.508C64.6675 181.298 63.2545 180.839 62.9962 179.675L58.9649 161.509C58.7518 160.549 57.7157 160.021 56.8134 160.413L39.7476 167.829C38.6541 168.304 37.4521 167.431 37.5662 166.244L39.3457 147.722C39.4398 146.743 38.6176 145.92 37.6383 146.014L19.116 147.794C17.9292 147.908 17.0559 146.706 17.5311 145.612L24.9472 128.547C25.3393 127.644 24.8114 126.608 23.851 126.395L5.68539 122.364C4.52141 122.106 4.06229 120.693 4.85214 119.799L17.1789 105.861C17.8307 105.124 17.6488 103.975 16.8012 103.476L0.770388 94.0283C-0.256794 93.4229 -0.256797 91.9372 0.770386 91.3318L16.8012 81.8844C17.6488 81.3849 17.8307 80.2364 17.1789 79.4995L4.85214 65.5606C4.06229 64.6675 4.52142 63.2545 5.68539 62.9962L23.851 58.9649C24.8114 58.7518 25.3393 57.7157 24.9472 56.8134L17.5311 39.7476C17.0559 38.6541 17.9292 37.4521 19.116 37.5662L37.6383 39.3457C38.6176 39.4398 39.4398 38.6176 39.3457 37.6383L37.5662 19.116C37.4521 17.9292 38.6541 17.0559 39.7476 17.5311L56.8134 24.9472C57.7157 25.3393 58.7518 24.8114 58.9649 23.851L62.9962 5.68539C63.2545 4.52141 64.6675 4.06229 65.5606 4.85214L79.4995 17.1789C80.2364 17.8307 81.3849 17.6488 81.8844 16.8012L91.3318 0.770388Z" fill="#FFCC18"/>
            </svg>
            <div class="slid_neg d-flex flex-column">
                <span class="tt_lmn">Los Mejores Negocios <i class="bi bi-shop"></i></span>                
                <span class="texto">Encuentra y apoya a los mejores negocios de nuestra comunidad en un solo lugar.
                    Descubre joyas ocultas y favoritos de la comunidad, cuidadosamente seleccionados por su calidad, servicio excepcional o propuestas únicas. Disfruta de experiencias gastronómicas y servicios que sobresalen, avalados por la satisfacción de sus clientes.
                </span>
                <button id="prev_lmn" class="btn prev"><i class="bi bi-caret-left"></i></button>
                <button id="next_lmn" class="btn next"><i class="bi bi-caret-right"></i></button>
                <div class="slider_i" id="slider_lmn">
                    <!-- Las tarjetas se agregarán aquí -->
                    <%

                        rs = stmt.executeQuery("select d.*, n.*, p.usu_id, u.usu_nombre from Direccion d inner join Negocio n on d.dir_id=n.dir_id inner join Persona "
                                + "p on n.per_id = p.per_id inner join Usuario u on p.usu_id = u.usu_id where n.neg_activo=true;");

                        while (rs.next()) {

                            String nombre = rs.getString("neg_nombre");
                            String nombreu = rs.getString("usu_nombre");
                            String img = rs.getString("neg_logo");
                            String desc = rs.getString("neg_descripcion");
                            String colonia = rs.getString("dir_colonia");
                            String calle = rs.getString("dir_calle");
                            int numero = rs.getInt("dir_numero");
                            int id = rs.getInt("neg_id");
                            String direccion = colonia + ", " + calle + ", " + numero;
                    %>
                    <form action="NegocioSC.jsp" class="NegocioSC">  
                        <section class="card_i">

                            <section class="hover_infn">
                                <button type="submit" class="Exp_neg" id="Exp_neg"></button>

                            </section>

                            <div class="dts_sli_n">
                                <span class="nn_sli_n" id="nn_sli_n"><%=nombre%></span>
                                <span class="nv_sli_n" id="nv_sli_n"><%=nombreu%></span>
                                <section class="d-flex w-100 justify-content-around cf_sli_n">
                                    <span class="nv_sli_n" id="nv_sli_n"><%=desc%></span>
                                </section>
                                <section class="d-flex w-100 justify-content-around align-items-center dir_sli_n">
                                    <i class="bi bi-geo-alt-fill"></i>
                                    <span class="w-75 direccion"><%=direccion%></span>

                                </section>

                            </div>
                            <img src="<%=img%>" alt="" class="img_sli_n">
                            <input type="hidden" name="idn" value="<%=id%>"/>
                        </section>
                    </form> 
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!--DE TODO UN POCO-->
        <div class="slid_pro d-flex flex-column" id="slid_pro_dtup">
            <span class="w-100 dtp_tt">De Todo un Poco <i class="bi bi-basket2-fill"></i></span>
            <span class="dtup texto dtup_txt">Aquí encontrarás una mezcla fascinante de contenido variado que enriquecerá tu experiencia. 
                Sumérgete en artículos, recomendaciones, actualizaciones y mucho más. Explora, aprende y descubre un mundo de posibilidades en este espacio lleno de sorpresas.
            </span>
            <button id="prev_dtp" class="btn prev"><i class="bi bi-caret-left"></i></button>
            <button id="next_dtp" class="btn next"><i class="bi bi-caret-right"></i></button>
            <div class="slider_i slider_ip" id="slider_dtp">

                <%
                    ResultSet pr;

                    String sl = "select p.*, d.dis_nombre, n.neg_id from Producto p inner join Disponibilidad d on p.dis_id=d.dis_id inner join Negocio n on p.neg_id = n.neg_id where"
                            + " n.neg_activo=true;";

                    pr = stmt.executeQuery(sl);

                    while (pr.next()) {

                        String np = pr.getString("pro_nombre");
                        int pre = pr.getInt("pro_precio");
                        String pi = pr.getString("pro_imagen");
                        String dis = pr.getString("dis_nombre");
                        String pd = pr.getString("pro_descripcion");
                        int id =  pr.getInt("neg_id");
                %>
                <section class="card_pro_most card_pro_most_active">
                    <span class="pre_sl">$<div class="pre_most_pro" id="pre_most_pro"><%=pre%>
                        </div>
                    </span>
                    <span class="card-title tt_pro_most" id="tt_pro_most"><%=np%></span>
                    <img src="<%=pi%>" class="card-img-top img_most" alt="..." id="card-img-top">
                    <input type="text" class="dis_most_pro" value="<%=dis%>" disabled>
                    <input type="hidden"  id="id_neg_pro_most" value="<%=id%>" disabled>
                    <span class="card-text dis_most_pro" id="desc_com_pro"><%=pd%></span>
                </section>
                <%
                    }
                %>
            </div>
        </div>

        <div class="slid_pro d-flex flex-column">
            <img class="img_novinx nov1" src="assets/novedad.png" alt="alt"/>
            <img class="img_novinx nov2" src="assets/novedad.png" alt="alt"/>
            <span class="w-100 dtp_tt dtp_tt_nov_mg"><span class="dtp_tt_nov">Novedades</span> <i class="bi bi-megaphone-fill"></i></span>
            <button id="prev_dtp" class="btn prev"><i class="bi bi-caret-left"></i></button>
            <button id="next_dtp" class="btn next"><i class="bi bi-caret-right"></i></button>
            <div class="slider_i" id="slider_dtp">

                <%
                    ResultSet pr2;

                    String sl2 = "select n.neg_nombre, n.neg_logo, n.neg_id, v.* from Negocio n inner join Novedad v on n.neg_id=v.neg_id where n.neg_activo=true and v.nov_activo=true;";

                    String pi2 = "";

                    pr2 = stmt.executeQuery(sl2);

                    while (pr2.next()) {

                        String np = pr2.getString("nov_nombre");
                        int pre = pr2.getInt("neg_id");
                        pi2 = pr2.getString("nov_foto");
                        String nnn = pr2.getString("neg_logo");
                        String dis = pr2.getString("neg_nombre");
                        String pd = pr2.getString("nov_descripcion");
                %>

                <form action="NegocioSC.jsp" method="post" class="card_pro_most card_pro_most_active" id="slid_pro_nov">
                    <div class="log_nov_cont">
                        <img src="<%=nnn%>" class="log_nov" alt="...">
                    </div>
                    <div class="nov_img_cont">
                        <img src="<%=pi2%>" class="nov_img" alt="...">
                    </div>
                    <div class="card-body d-flex flex-column">
                        <span class="card-text tt_pro_most" id="desc_com_pro"><%=np%></span>
                        <span class="card-title" id="tt_pro_most">Novedad del Negocio: <br><%=dis%></span>
                        <span class="card-text"><%=pd%></span>
                        <button type="submit" id="vis_nov">Visitar Negocio</button>
                    </div>
                    <input type="hidden" value="<%=pre%>" name="idn" />

                </form>

                <%
                    }
                %>
            </div>
        </div>

        <!--FOOTER-->
        <footer class="footeri">
            <div class="contacts-section">
                <section class="contacts-section1">
                    <section class="line-footer"></section>
                    <div class="contacts-footer">
                        <section class="facebook-contact">
                            <a href="https://www.facebook.com/profile.php?id=61557767525442&is_tour_completed=true" target="_blank">
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" class="facebook-footer"
                                     id="facebook-footer"
                                     viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path
                                    d="M504 256C504 119 393 8 256 8S8 119 8 256c0 123.78 90.69 226.38 209.25 245V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.28c-30.8 0-40.41 19.12-40.41 38.73V256h68.78l-11 71.69h-57.78V501C413.31 482.38 504 379.78 504 256z" />
                                </svg>
                            </a>
                        </section>
                        <section class="instragram-contact">
                            <a href="https://www.instagram.com/mydea_ethevs/" target="_blank">
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" class="instagram-footer"
                                     id="instagram-footer"
                                     viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path
                                    d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z" />
                                </svg>
                            </a>
                        </section>
                        <section class="youtube-contact">
                            <a href="https://www.youtube.com/@Mydeaethev_S" target="_blanl">
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" class="youtube-footer"
                                     id="youtube-footer"
                                     viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path
                                    d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z" />
                                </svg>
                            </a>
                        </section>
                        <section class="link-contact" id="link-contact" data-bs-title="www.mydea.pro">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" class="link-footer"
                                 id="link-footer"
                                 viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                            <path
                                d="M579.8 267.7c56.5-56.5 56.5-148 0-204.5c-50-50-128.8-56.5-186.3-15.4l-1.6 1.1c-14.4 10.3-17.7 30.3-7.4 44.6s30.3 17.7 44.6 7.4l1.6-1.1c32.1-22.9 76-19.3 103.8 8.6c31.5 31.5 31.5 82.5 0 114L422.3 334.8c-31.5 31.5-82.5 31.5-114 0c-27.9-27.9-31.5-71.8-8.6-103.8l1.1-1.6c10.3-14.4 6.9-34.4-7.4-44.6s-34.4-6.9-44.6 7.4l-1.1 1.6C206.5 251.2 213 330 263 380c56.5 56.5 148 56.5 204.5 0L579.8 267.7zM60.2 244.3c-56.5 56.5-56.5 148 0 204.5c50 50 128.8 56.5 186.3 15.4l1.6-1.1c14.4-10.3 17.7-30.3 7.4-44.6s-30.3-17.7-44.6-7.4l-1.6 1.1c-32.1 22.9-76 19.3-103.8-8.6C74 372 74 321 105.5 289.5L217.7 177.2c31.5-31.5 82.5-31.5 114 0c27.9 27.9 31.5 71.8 8.6 103.9l-1.1 1.6c-10.3 14.4-6.9 34.4 7.4 44.6s34.4 6.9 44.6-7.4l1.1-1.6C433.5 260.8 427 182 377 132c-56.5-56.5-148-56.5-204.5 0L60.2 244.3z" />
                            </svg>
                        </section>
                    </div>
                    <section class="line-footer"></section>
                </section>
            </div>
            <div class="footer-section">
                <img src="assets/mydea_com.png" alt="logo-footer" class="logo-footer">
                <span class="ethev">Todos los derechos de uso son exclusivos de ETHEV</span>
                <section class="line-footer2"></section>
                <div class="more-footer">
                    <a href="index.jsp">Regresar al Inicio</a>
                    <a href="Registro.jsp">Regístrate</a>
                    <a href="Iniciar_Sesion.jsp">Inicia Sesión</a>
                    <a href="Terminos_Condiciones.jsp">Términos y Condiciones</a>
                    <a href="Aviso_Privacidad.jsp">Aviso de Privacidad</a>
                </div>
            </div>
        </footer>
    </div>

    <!--Producto-->
    <div class="Prod_most_espe align-items-center justify-content-center h-100 w-100 flex-column"
         id="producto_epecifico">
        <div class="producto_epecifico_contenedor">
            <section class="btns_pro_most_esp_res">
                <section class="btn btns_pro_most bpmer_active" id="IDP">Información del producto</section>
            </section>
            <div class="Prod_most_espe_cont justify-content-around">
                <div class="w-100 h-100 sep_dis_pro">
                    <div class="Prod_most_espe_cont1 w-100 h-100" id="Prod_most_espe_cont1">
                        <section class="d-flex flex-column secc_pro_most_espe">
                            <span id="npv_pro_esp">Nombre del Producto Vendido</span>
                            <span id="des_pro_esp">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Placeat eum
                                distinctio ipsum nostrum
                                labore veritatis id quia reiciendis animi at odio sunt maxime eaque ipsa natus iusto,
                                possimus
                                facere vitae.</span>
                            <span id="pre_pro_esp">$000000.00</span>
                            <span id="dis_pro_esp">Disponibilidad</span>
                            <form action="NegocioSC.jsp" method="post">
                                <input type="hidden" id="neg_id_viz" name="idn" value=""/>
                                <button type="submit" id="vis_neg_btn">Visitar Negocio que lo ofrece</button>
                            </form>
                        </section>
                    </div>
                </div>
                <section class="img_pro_mosr_espe">
                    <img src="assets/neg1.jpg" alt="" id="img_pro_mosr_espe">
                </section>
            </div>
        </div>
        <span class="text_inst_pro_espe">Si desea salir dé click fuera de esta ventana emergente</span>
    </div>
    <%
        c.close();
    %>
    <script>
        // Activar todos los tooltips
        var tooltips = new bootstrap.Tooltip(document.body, {
            selector: '[data-bs-toggle="tooltip"]',
        });
    </script>
    <script src="js/Nav.js"></script>
    <script src="js/index.js"></script>
</body>
</html>