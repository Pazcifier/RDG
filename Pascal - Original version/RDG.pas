uses
    crt;
Const
    MaxPociones = 5;
var
   Arquero, Caballero, Guerrero, Cartografo, Juego, EComerciante, TiendaAbierta, ArmaTienda, ArmaduraTienda, PocionTienda, BajarPrecio, Boss, TTienda, TLoot, TPocion, PCurativa, PVeneno, PMaxima : boolean;
   VidaJ, AtaqueJ, DefensaJ, Pantalla, Puntuacion, VidaJE, Pociones, PantallaN, LootD, TipoLoot, Dialogo, DanoJ, LootA, LootAr, LootP, OroJ, CostoA, CostoD, CostoP, CombateComerciante, ERep, TRep, LRep, PRep, BonusPuntuacion, CombateBoss, ContMejora, Mejora, TipoPocion : integer;
   Decision : char;
Procedure Cartografia (var Pantalla : integer);
   var
      DEspecial, PDerecha, PIzquierda : integer;
      Derecha, Izquierda : boolean;
   begin
      DEspecial := random(6)+1;
      If (DEspecial = 6) then
      begin
           TTienda := false;
           TPocion := false;
           TLoot := false;
           PantallaN := PantallaN - 1;
           ERep := 0;
           TRep := 0;
           LRep := 0;
           PRep := 0;
           Textcolor(14);
           Derecha := true;
           Izquierda := true;
           writeln('Observas tu mapa y te encuentras con una interseccion');
           Pantalla := random(5)+1;
           PDerecha := Pantalla;
           Pantalla := random(5)+1;
           PIzquierda := Pantalla;
           Pantalla := 0;
           LootD := random(10)+1;
           Textcolor(15);
           write('A la derecha tienes...');
           Delay(1000);
           while (Derecha) do
           begin
                Case PDerecha of
                     1 : begin
                              Textcolor(12);
                              writeln(' Un enemigo!');
                              Derecha := false;
                         end;
                     2 : begin
                              Textcolor(10);
                              writeln(' Una pocion!');
                              Derecha := false;
                         end;
                     3 : begin
                              Textcolor(14);
                              writeln(' Loot!');
                              Derecha := false;
                         end;
                     4 : begin
                              Textcolor(11);
                              writeln(' Una tienda!');
                              Derecha := false;
                         end;
                     5 : begin
                              If (Puntuacion >= 10) AND (LootD >= 10) then
                              begin
                                   Textcolor(13);
                                   writeln(' Un Boss!');
                                   Derecha := false;
                              end
                              else
                              PDerecha := random(5)+1;
                              end;
                         end;
           end;
           Delay(1000);
           Textcolor(15);
           write('A la izquierda tienes...');
           Delay(1000);
           while (Izquierda) do
           begin
                Case PIzquierda of
                     1 : begin
                              Textcolor(12);
                              writeln(' Un enemigo!');
                              Izquierda := false;
                         end;
                     2 : begin
                              Textcolor(10);
                              writeln(' Una pocion!');
                              Izquierda := false;
                         end;
                     3 : begin
                              Textcolor(14);
                              writeln(' Loot!');
                              Izquierda := false;
                         end;
                     4 : begin
                              Textcolor(11);
                              writeln(' Una tienda!');
                              Izquierda := false;
                         end;
                     5 : begin
                              If (Puntuacion >= 10) AND (LootD >= 10) then
                              begin
                                   Textcolor(13);
                                   writeln(' Un Boss!');
                                   Izquierda := false;
                              end
                              else
                              PIzquierda := random(5)+1;
                              end;
                         end;
           end;
           Delay(1000);
           Textcolor(14);
           writeln('A donde quieres ir?');
           write('D');
           Textcolor(15);
           writeln(' - Derecha');
           Textcolor(14);
           write('I');
           Textcolor(15);
           writeln(' - Izquierda');
           readln(Decision);
           If (Decision = 'D') then
           begin
                clrscr;
                Pantalla := PDerecha;
                Textcolor(14);
                writeln('Decidiste ir a la derecha!');
           end
           else
           begin
                clrscr;
                Pantalla := PIzquierda;
                Textcolor(14);
                writeln('Decidiste ir a la izquierda!');
           end;
           Textcolor(15);
           writeln('Presiona cualquier tecla para continuar');
           readkey;
           clrscr;
      end;
   end;
Procedure Estadisticas (Vida, Ataque, Defensa : integer);
begin
     Textcolor(10);
     write('Vida');
     Textcolor(15);
     writeln(' = ',Vida);
     Textcolor(12);
     write('Ataque');
     Textcolor(15);
     writeln(' = ',Ataque);
     Textcolor(11);
     write('Defensa');
     Textcolor(15);
     writeln(' = ',Defensa);
end;
Procedure Pocion (var VidaJ : integer);
     var
        Variacion : integer;
     begin
        TipoPocion := random(3)+1;
        Case TipoPocion of
                  1 : begin
                           If (PCurativa) then
                           begin
                                Textcolor(10);
                                writeln('Bebiste una pocion curativa!');
                                Delay(1000);
                                Variacion := ((random(50)+11) * Mejora) + PantallaN + Puntuacion;
                                Textcolor(14);
                                write('Esta pocion te curo un total de: ');
                                Delay(1000);
                                Textcolor(10);
                                writeln(Variacion,'!');
                                VidaJ := VidaJ + Variacion;
                                If (VidaJ >= VidaJE) then
                                   VidaJ := VidaJE;
                                If (VidaJ < VidaJE) then
                                begin
                                     Textcolor(15);
                                     write('Tu salud actual es de: ');
                                     Textcolor(10);
                                     writeln(VidaJ);
                                end
                                else
                                begin
                                     Textcolor(10);
                                     writeln('Tu salud esta al maximo');
                                end;
                                Textcolor(15);
                                Pociones := Pociones - 1;
                           end
                           else
                           begin
                                Textcolor(7);
                                writeln('La pocion no tuvo ningun efecto');
                                Pociones := Pociones - 1;
                                PCurativa := false;
                           end;
                      end;
                  2 : begin
                           If (PVeneno) then
                           begin
                                Textcolor(13);
                                writeln('Bebiste una pocion venenosa!');
                                Delay(1000);
                                Variacion := random(20) + 1;
                                Textcolor(14);
                                write('La pocion te quito un total de: ');
                                Delay(1000);
                                Textcolor(13);
                                write(Variacion);
                                Textcolor(14);
                                writeln(' de salud');
                                Textcolor(15);
                                VidaJ := VidaJ - Variacion;
                                If (VidaJ <= 0) then
                                begin
                                     Textcolor(13);
                                     writeln('El veneno detuvo tu corazon');
                                     Delay(1000);
                                     Textcolor(15);
                                     Juego := false;
                                end
                                else
                                begin
                                    write('Tu salud actual es de: ');
                                    Textcolor(10);
                                    writeln(VidaJ);
                                end;
                                Textcolor(15);
                                Pociones := Pociones - 1;
                           end
                           else
                           begin
                                Textcolor(7);
                                writeln('La pocion no tuvo ningun efecto');
                                Pociones := Pociones - 1;
                           end;
                      end;
                  3 : begin
                           If (PMaxima) then
                           begin
                                Textcolor(11);
                                writeln('Bebiste una pocion de curacion completa!');
                                VidaJ := VidaJE;
                                Delay(1000);
                                Textcolor(10);
                                writeln('Tu salud esta al maximo');
                                Pociones := Pociones - 1;
                           end
                           else
                           begin
                                Textcolor(7);
                                writeln('La pocion no tuvo ningun efecto');
                                Pociones := Pociones - 1;
                           end;
                      end;
             end;
             If (Pociones = 0) then
             begin
                  PCurativa := false;
                  PVeneno := false;
                  PMaxima := false;
             end;
             Textcolor(15);
     end;
Procedure PocionesPantalla (Var VidaJ : integer);
   var
      MenuPociones, AgarrarPocion : boolean;
   begin
        Dialogo := random(3)+1;
        Textcolor(14);
        Case Dialogo of
             1 : begin
                      writeln('Encontraste un recipiente de cristal con una nota adherida!');
                      Delay(1000);
                      Textcolor(11);
                      write('"Bebela bajo tu propio riesgo"');
                      Textcolor(14);
                      writeln(' leiste');
                 end;
             2 : begin
                      writeln('Encontraste una pocion a mitad de tu camino!');
                      Delay(1000);
                      Textcolor(13);
                      writeln('Tiene un color raro y olor bizarro');
                 end;
             3 : begin
                      writeln('Observaste que a alguien con prisa se le cayo algo por el camino');
                      Delay(1000);
                      Textcolor(10);
                      writeln('Parece ser una pocion con dotes desconocidos!');
                 end;
        end;
        AgarrarPocion := true;
        While (AgarrarPocion) do
        begin
             TipoPocion := random(3) + 1;
             Case TipoPocion of
                  1 : begin
                           If not(PCurativa) then
                              PCurativa := true;
                           AgarrarPocion := false;
                      end;
                      2 : begin
                          If not(PVeneno) then
                              PVeneno := true;
                          AgarrarPocion := false;
                      end;
                      3 : begin
                          If not(PMaxima) then
                             PMaxima := true;
                          AgarrarPocion := false;
                      end;
             end;
        end;
        Delay(1500);
        MenuPociones := true;
        While (MenuPociones) do
        begin
         Textcolor(15);
         writeln('Que haras con ella?');
         Textcolor(12);
         write('B');
         Textcolor(15);
         writeln(' - Beberla');
         If (Pociones <> MaxPociones) then
         begin
             Textcolor(10);
             write('G');
             Textcolor(15);
             writeln(' - Guardarla');
         end;
         Textcolor(15);
         writeln('S - Seguir tu camino');
         Textcolor(14);
         write('Pociones actuales: ');
         Textcolor(11);
         writeln(Pociones,'/',MaxPociones);
         Textcolor(15);
         readln(Decision);
         Case Decision of
             'B' : begin
                        clrscr;
                        Textcolor(14);
                        write('Tomaste la pocion, la alzaste al aire y dijiste: ');
                        Textcolor(11);
                        writeln('"Salud!"');
                        Delay(1000);
                        Textcolor(14);
                        writeln('Bebiste la pocion de un trago y esperaste lo mejor');
                        Delay(2000);
                        Pocion(VidaJ);
                        Pociones := Pociones + 1;
                        MenuPociones := false;
                   end;
             'G' : begin
                        If (Pociones <> MaxPociones) then
                        begin
                             clrscr;
                             Textcolor(14);
                             writeln('Decidiste guardar la pocion para un mejor momento');
                             Delay(1000);
                             Textcolor(14);
                             Pociones := Pociones + 1;
                             write('Cantidad de pociones actual: ');
                             Textcolor(11);
                             writeln(Pociones,'/',MaxPociones);
                             MenuPociones := false;
                        end
                        else
                        begin
                             clrscr;
                             Textcolor(14);
                             writeln('No puedes llevar mas pociones en tu inventario');
                             Textcolor(15);
                             writeln('Presiona cualquier tecla para continuar');
                             readkey;
                             clrscr;
                        end;
                   end;
             'S' : begin
                        clrscr;
                        Textcolor(14);
                        writeln('Decidiste continuar tu viaje sin tomar el riesgo de agarrar esa pocion');
                        MenuPociones := false
                   end;
         end;
        end;
   end;
Procedure Combate (var VidaJ, AtaqueJ, DefensaJ : integer);
   var
      VidaE, AtaqueE, DefensaE, Primero, DadoA, DadoD, DadoE, Loot : integer;
      Turno, Combate : boolean;
   begin
      VidaE := (random(25)+1 * PantallaN) * Mejora;
      AtaqueE := (2 + Mejora)  * Puntuacion;
      DefensaE := (VidaE div (10 - Mejora)) + Puntuacion;
      Primero := random(2)+1;
      If (Boss) then
      begin
           Case Dialogo of
           1 : begin
                    VidaE := 500 * CombateBoss;
                    AtaqueE := 50 * CombateBoss;
                    DefensaE := 50 * CombateBoss;
                    Primero := 2;
               end;
           2 : begin
                    VidaE := 600 * CombateBoss;
                    AtaqueE := 60 * CombateBoss;
                    DefensaE := 30 * CombateBoss;
                    Primero := 2;
               end;
           3 : begin
                    VidaE := 200 * CombateBoss;
                    AtaqueE := 40 * CombateBoss;
                    DefensaE := 40 * CombateBoss;
                    Primero := 2;
               end;
           end;
      end
      else
      If (EComerciante) then
      begin
           VidaE := (175 + PantallaN) * CombateComerciante;
           AtaqueE := ((4*CombateComerciante) * Puntuacion) - PantallaN;
           DefensaE := ((VidaE div 10) + (random(4)+1) * CombateComerciante);
           Primero := 2;
      end;
      If (PantallaN = 1) then
           Primero := 2;
      If (Primero = 1) then
      begin
           Textcolor(14);
           writeln('Fuiste emboscado por un enemigo!');
           Textcolor(7);
           Delay(1200);
           Turno := false;
      end
      else
      begin
           If (Boss) then
           begin
                Case Dialogo of
                     1 : begin
                              Textcolor(13);
                              writeln('El dragon magmatico vuela hacia ti!');
                              Textcolor(15);
                         end;
                    2 : begin
                             Textcolor(13);
                             writeln('El gigante del bosque se prepara para aplastarte!');
                             Textcolor(15);
                        end;
                    3 : begin
                             Textcolor(13);
                             writeln('El caballero azul se presenta ante ti!');
                             Textcolor(15);
                        end;
                end;
           end
           else
           If (EComerciante) then
           begin
                Textcolor(14);
                writeln('Te enfrentas al comerciante de la tienda!');
                Textcolor(15);
           end
           else
           begin
                Textcolor(14);
                writeln('Encontraste a un enemigo en tu camino!');
                Textcolor(7);
           end;
           Delay(1200);
           Turno := true;
      end;
      Combate := true;
      While (Combate) do
      begin
           If (Turno) then
           begin
                repeat
                     Textcolor(14);
                     writeln('Tu turno!');
                     Textcolor(15);
                     writeln('Elige comando');
                     Textcolor(12);
                     write('A');
                     Textcolor(15);
                     writeln(' - Atacar');
                     Textcolor(11);
                     write('E');
                     Textcolor(15);
                     writeln(' - Estadisticas');
                     Textcolor(10);
                     If (Pociones > 0) then
                     begin
                          write('P');
                          Textcolor(15);
                          write(' - Usar pocion');
                          Textcolor(11);
                          writeln(' ',Pociones,'/',MaxPociones);
                     end;
                     Textcolor(15);
                     readln(Decision);
                     If (Decision = 'E') then
                     begin
                          clrscr;
                          Textcolor(14);
                          writeln('Estadisticas del jugador');
                          Estadisticas(VidaJ, AtaqueJ, DefensaJ);
                          Textcolor(14);
                          writeln('Estadisticas del enemigo');
                          If (EComerciante) then
                          begin
                               Textcolor(13);
                               writeln('Comerciante enojado');
                               Textcolor(15);
                          end
                          else
                          If (Boss) AND (Dialogo = 1) then
                          begin
                               Textcolor(4);
                               writeln('El dragon magmatico');
                               Textcolor(15);
                          end
                          else
                          If (Boss) AND (Dialogo = 2) then
                          begin
                               Textcolor(4);
                               writeln('El gigante del bosque');
                               Textcolor(15);
                          end
                          else
                          If (Boss) AND (Dialogo = 3) then
                          begin
                               Textcolor(4);
                               writeln('El caballero azul');
                               Textcolor(15);
                          end;
                          Estadisticas(VidaE, AtaqueE, DefensaE);
                          Textcolor(15);
                          writeln('Presione cualquier tecla para regresar');
                          readkey;
                          clrscr;
                     end;
                     If (Decision = 'P') then
                     begin
                          clrscr;
                          If (Pociones > 0) then
                          begin
                             Textcolor(14);
                             write('Tomaste de un trago la botella y... ');
                             Delay(1000);
                             Textcolor(15);
                             Pocion(VidaJ);
                          end
                          else
                          begin
                             Textcolor(14);
                             writeln('No tienes ninguna pocion');
                             Textcolor(15);
                          end;
                          If (VidaJ <= 0) then
                             Combate := false;
                             Juego := false;
                          writeln('Presiona cualquier tecla para continuar');
                          readkey;
                     end;
                until (Decision = 'A') OR (Decision = 'P');
                clrscr;
                DadoA := random(11)+2;
                write('Los dados giran y caen en el numero: ');
                Delay(1200);
                Textcolor(12);
                writeln(DadoA,'!');
                Textcolor(15);
                If (DadoA = 12) then
                begin
                   DadoA := 12*2;
                   If (Guerrero) then
                      DadoA := 12*3;
                   Textcolor(12);
                   writeln('ATAQUE CRITICO');
                   Textcolor(15);
                end;
                Delay(250);
                DanoJ := (DadoA+AtaqueJ) - DefensaE;
                If (DanoJ <= 0) then
                begin
                    DanoJ := 0;
                    Textcolor(14);
                    writeln('Su armadura bloqueo tu ataque!');
                    Textcolor(15);
                end
                else
                begin
                    write('Hiciste un ataque de: ');
                    Textcolor(12);
                    writeln((DadoA+AtaqueJ) - DefensaE);
                    Textcolor(15);
                end;
                VidaE := VidaE - DanoJ;
                If (VidaE <= 0) then
                begin
                   Combate := false;
                   Textcolor(14);
                   writeln('Ganaste contra el enemigo!');
                   Textcolor(15);
                   write('Ganaste un total de: ');
                   Textcolor(14);
                   writeln((Puntuacion + PantallaN + ((AtaqueE + DefensaE) div 2)) * Mejora,' de oro!');
                   OroJ := OroJ + (Puntuacion + PantallaN + ((AtaqueE + DefensaE) div 2)) * Mejora;
                   Loot := random(10) + 1;
                   If (EComerciante) then
                   begin
                        Textcolor(13);
                        writeln('Me las pagaras hasta en la muerte!');
                        Delay(1000);
                        writeln('Las estadisticas y los precios en la tienda han aumentado!');
                        Delay(500);
                        writeln('Los comerciantes estaran mas preparados...');
                        Delay(1500);
                        Loot := 0;
                        TipoLoot := random(2)+1;
                        If (TipoLoot = 1) then
                        begin
                             LootD := (random(8)+3) * CombateComerciante;
                             Textcolor(14);
                             write('Robaste una mejor arma!');
                             Textcolor(12);
                             write(' +',LootD);
                             Textcolor(14);
                             writeln(' a tu ataque!');
                             AtaqueJ := AtaqueJ + LootD;
                        end
                        else
                        begin
                             LootD := (random(8)+3) * CombateComerciante;
                             Textcolor(14);
                             write('Robaste una mejor armadura!');
                             Textcolor(11);
                             write(' +', LootD);
                             Textcolor(14);
                             writeln(' a tu defensa!');
                             Textcolor(15);
                             DefensaJ := DefensaJ + LootD;
                        end;
                        Textcolor(14);
                        write('Encontraste una pocion de curacion completa!');
                        Textcolor(10);
                        writeln(' Salud al maximo!');
                        Textcolor(15);
                        VidaJ := VidaJE;
                        EComerciante := False;
                        CombateComerciante := CombateComerciante + 1;
                   end;
                   If (Boss) then
                   begin
                        Textcolor(13);
                        Case Dialogo of
                             1 : begin
                                      writeln('Ya nunca jamas esta criatura aterrorara estas tierras...');
                                      Delay(2000);
                                 end;
                             2 : begin
                                      writeln('Terminaste con los temblores en estas tierras...');
                                      Delay(2000);
                                 end;
                             3 : begin
                                      writeln('Con tu accion, el caballero azul sera el olvidado...');
                                      Delay(2000);
                                 end;
                        end;
                        Textcolor(13);
                        writeln('Los jefes estaran mas preparados para tu regreso!');
                        Delay(1000);
                        Textcolor(14);
                        Loot := 0;
                        LootD := (random(20)+11) * CombateBoss;
                        write('Obtuviste del cadaver una mejor arma!');
                        Textcolor(12);
                        write(' +',LootD);
                        Textcolor(14);
                        writeln(' de ataque!');
                        AtaqueJ := AtaqueJ + LootD;
                        LootD := (random(20)+11) * CombateBoss;
                        write('Obtuviste del cadaver una mejor armadura!');
                        Textcolor(11);
                        write(' +',LootD);
                        Textcolor(14);
                        writeln(' de defensa!');
                        DefensaJ := DefensaJ + LootD;
                        write('Recogiste una pocion de curacion completa!');
                        Textcolor(10);
                        writeln(' Salud al maximo!');
                        Textcolor(15);
                        VidaJ := VidaJE;
                        CombateBoss := CombateBoss + 1;
                        Boss := False;
                   end;
                   If (Loot = 10) then
                   begin
                        LootD := (random(6)+2) * Mejora;
                        TipoLoot := random(2)+1;
                        If (TipoLoot = 1) then
                        begin
                           Textcolor(14);
                           write('Encontraste una mejor arma!');
                           Textcolor(12);
                           write(' +', LootD);
                           Textcolor(14);
                           writeln(' a tu ataque!');
                           Textcolor(15);
                           AtaqueJ := AtaqueJ + LootD;
                        end
                        else
                        begin
                           Textcolor(14);
                           write('Encontraste una mejor armadura!');
                           Textcolor(11);
                           write(' +', LootD);
                           Textcolor(14);
                           writeln(' a tu defensa!');
                           Textcolor(15);
                           DefensaJ := DefensaJ + LootD;
                        end;
                   end;
                   Puntuacion := Puntuacion + 1;
                   PantallaN := PantallaN + 1;
                end
                else
                begin
                   Turno := false;
                   writeln('Presiona cualquier tecla para continuar');
                   readkey;
                   clrscr;
                end;
            end
            else
            begin
                Textcolor(14);
                writeln('Turno del enemigo!');
                Textcolor(15);
                DadoE := 1;
                DadoD := 0;
                DadoA := random(11)+2;
                write('Los dados giran y caen en el numero: ');
                Delay(1200);
                Textcolor(12);
                writeln(DadoA,'!');
                Textcolor(15);
                If (DadoA = 12) then
                begin
                   DadoA := 12*2;
                   Textcolor(12);
                   writeln('ATAQUE CRITICO');
                   Textcolor(15);
                end;
                Delay(250);
                If (Caballero) then
                begin
                     DadoD := random(6)+1;
                     write('Bonus de defensa: ');
                     Delay(700);
                     Textcolor(11);
                     writeln(DadoD,'!');
                     Textcolor(15);
                     Delay(250);
                end;
                If (Arquero) then
                begin
                     DadoE := random(6);
                     If (DadoE = 0) then
                     begin
                        Textcolor(10);
                        writeln('Esquivaste el ataque!');
                        Textcolor(15);
                     end
                     else
                        DadoE := 1;
                end;
                If (((DadoA+AtaqueE) - (DefensaJ+DadoD))*DadoE <= 0) then
                begin
                   DadoE := 0;
                   Textcolor(14);
                   writeln('No te hizo nada el ataque!');
                   Textcolor(15);
                end
                else
                begin
                    write('Te hizo un ataque de: ');
                    Textcolor(12);
                    writeln(((DadoA+AtaqueE) - (DefensaJ+DadoD))*DadoE);
                    Textcolor(15);
                end;
                VidaJ := VidaJ - (((DadoA+AtaqueE) - (DefensaJ+DadoD))*DadoE);
                If (VidaJ <= 0) then
                begin
                   Combate := false;
                   Juego := false;
                   If (EComerciante) then
                   begin
                        Dialogo := random(2)+1;
                        If (Dialogo = 1) then
                        begin
                             Textcolor(13);
                             writeln('Espero no volverte a ver por aqui');
                             Textcolor(15);
                        end
                        else
                        begin
                             Textcolor(13);
                             writeln('Ojala paguen bien por tu cadaver');
                             Textcolor(15);
                        end;
                   end;
                   If (Boss) then
                   begin
                        Textcolor(13);
                        Case Dialogo of
                             1 : begin
                                      writeln('Fallaste tu batalla contra el dragon y te convertiste en su alimento.');
                                      Delay(2000);
                                 end;
                             2 : begin
                                      writeln('El gigante te ha añadido a su coleccion de cadaveres');
                                      Delay(2000);
                                 end;
                             3 : begin
                                      writeln('"Me encargare de que no aparezcas en ninguna tumba..."');
                                      Delay(2000);
                                 end;
                        end;
                   end;
                        Textcolor(14);
                        writeln('Perdiste contra el enemigo!');
                        Textcolor(15);
                end
                else
                begin
                   Turno := true;
                   writeln('Presiona cualquier tecla para continuar');
                   readkey;
                   clrscr;
                end;
            end;
      end;
   end;
begin
     randomize;
     Pantalla := 0;
     Puntuacion := 0;
     ERep := 0;
     LRep := 0;
     PRep := 0;
     TRep := 0;
     Mejora := 1;
     Guerrero := false;
     Caballero := false;
     Arquero := false;
     Cartografo := false;
     Juego := true;
     EComerciante := false;
     Boss := false;
     TTienda := false;
     TPocion := false;
     TLoot := false;
     OroJ := 0;
     Pociones := 0;
     PantallaN := 1;
     CombateComerciante := 1;
     CombateBoss := 1;
     BonusPuntuacion := 0;
     ContMejora := 0;
     PCurativa := false;
     PVeneno := false;
     PMaxima := false;
     Textcolor(12);
     writeln('                                                       ANTES DE JUGAR');
     Textcolor(15);
     writeln;
     writeln('- Los comandos deben ser escritos exactamente como aparecen (mayusculas)');
     writeln('- El juego se basa completamente en un generador de numeros aleatorios');
     writeln('- La puntuacion se basa en la cantidad de enemigos que mates');
     writeln;
     Textcolor(14);
     writeln('                                             Presiona cualquier tecla para jugar');
     Textcolor(15);
     readkey;
     clrscr;
     while not(Guerrero) AND not(Caballero) AND not(Arquero) AND not(Cartografo) do
     begin
          Textcolor(14);
          writeln('Elige tu clase escribiendo cual deseas ser');
          Textcolor(12);
          write('G');
          Textcolor(15);
          writeln(' - Guerrero');
          Textcolor(11);
          write('C');
          Textcolor(15);
          writeln(' - Caballero');
          Textcolor(10);
          write('A');
          Textcolor(15);
          writeln(' - Arquero');
          Textcolor(14);
          write('M');
          Textcolor(15);
          writeln(' - Cartografo');
          readln(Decision);
          clrscr;
          Case Decision of
               'G' : begin
                          Textcolor(8);
                          write('Clase: ');
                          Textcolor(15);
                          writeln('GUERRERO');
                          Textcolor(10);
                          write('Vida: ');
                          Textcolor(15);
                          writeln('100');
                          Textcolor(12);
                          write('Ataque: ');
                          Textcolor(15);
                          writeln('8');
                          Textcolor(11);
                          write('Defensa: ');
                          Textcolor(15);
                          writeln('4');
                          Textcolor(14);
                          write('Especial: ');
                          Textcolor(15);
                          writeln('Criticos del 200%');
                          writeln('Desea usar esta clase? (S/N)');
                          readln(Decision);
                          clrscr;
                          If (Decision = 'S') then
                          begin
                             VidaJ := 100;
                             VidaJE := VidaJ;
                             AtaqueJ := 8;
                             DefensaJ := 4;
                             Guerrero := true;
                          end;
                      end;
               'C' : begin
                          Textcolor(8);
                          write('Clase: ');
                          Textcolor(15);
                          writeln('CABALLERO');
                          Textcolor(10);
                          write('Vida: ');
                          Textcolor(15);
                          writeln('150');
                          Textcolor(12);
                          write('Ataque: ');
                          Textcolor(15);
                          writeln('3');
                          Textcolor(11);
                          write('Defensa: ');
                          Textcolor(15);
                          writeln('10');
                          Textcolor(14);
                          write('Especial: ');
                          Textcolor(15);
                          writeln('Gira los dados para un bonus de defensa');
                          writeln('Desea usar esta clase? (S/N)');
                          readln(Decision);
                          clrscr;
                          If (Decision = 'S') then
                          begin
                             VidaJ := 150;
                             VidaJE := VidaJ;
                             AtaqueJ := 3;
                             DefensaJ := 10;
                             Caballero := true;
                          end;
                      end;
               'A' : begin
                          Textcolor(8);
                          write('Clase: ');
                          Textcolor(15);
                          writeln('ARQUERO');
                          Textcolor(10);
                          write('Vida: ');
                          Textcolor(15);
                          writeln('85');
                          Textcolor(12);
                          write('Ataque: ');
                          Textcolor(15);
                          writeln('6');
                          Textcolor(11);
                          write('Defensa: ');
                          Textcolor(15);
                          writeln('3');
                          Textcolor(14);
                          write('Especial: ');
                          Textcolor(15);
                          writeln('Probabilidad 1 a 6 de evasion');
                          writeln('Desea usar esta clase? (S/N)');
                          readln(Decision);
                          clrscr;
                          If (Decision = 'S') then
                          begin
                             VidaJ := 85;
                             VidaJE := VidaJ;
                             AtaqueJ := 6;
                             DefensaJ := 3;
                             Arquero := true;
                          end;
                     end;
               'M' : begin
                          Textcolor(7);
                          write('Clase: ');
                          Textcolor(15);
                          writeln('CARTOGRAFO');
                          Textcolor(10);
                          write('Vida: ');
                          Textcolor(15);
                          writeln('75');
                          Textcolor(12);
                          write('Ataque: ');
                          Textcolor(15);
                          writeln('5');
                          Textcolor(11);
                          write('Defensa: ');
                          Textcolor(15);
                          writeln('5');
                          Textcolor(14);
                          write('Especial: ');
                          Textcolor(15);
                          writeln('Probabilidad 1 a 6 de elegir un camino');
                          writeln('Desea usar esta clase? (S/N)');
                          readln(Decision);
                          clrscr;
                          If (Decision = 'S') then
                          begin
                             VidaJ := 75;
                             VidaJE := VidaJ;
                             AtaqueJ := 5;
                             DefensaJ := 5;
                             Cartografo := true;
                          end;
                      end;

          end;
     end;
     while (Juego) do
     begin
          LootD := random(10)+BonusPuntuacion;
           If (ContMejora = 10) then
           begin
                Textcolor(13);
                Mejora := Mejora + 1;
                writeln('Los enemigos ahora son mas fuertes');
                Delay(1000);
                writeln('Ahora obtienes mas oro y mejor loot!');
                Delay(2000);
                ContMejora := 0;
                clrscr;
                Textcolor(15);
           end;
           If (Pantalla = 0) then
              Pantalla := 1
           else
              Pantalla := random(5)+1;
           If (Pantalla <> 0) AND (Cartografo) then
                 Cartografia(Pantalla);
           Case Pantalla of
                1 : begin                                                                     //Pantalla Combate
                       If (ERep <> 2) then
                       begin
                            Combate(VidaJ, AtaqueJ, DefensaJ);
                            Textcolor(15);
                            writeln('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            TLoot := false;
                            TPocion := false;
                            TTienda := false;
                            ERep := ERep + 1;
                            LRep := 0;
                            TRep := 0;
                            PRep := 0;
                            If (Puntuacion > 9) then
                               ContMejora := ContMejora + 1;
                       end;
                    end;
                2 : begin                                                                     //Pantalla Pocion
                  If not(TPocion) AND (PRep <> 2) then
                  begin
                       LootD := random(10) + 1;
                       If (LootD = 10) then
                       begin
                          Textcolor(14);
                          writeln('Encontraste una pocion de aumento de vida!');
                          Delay(1200);
                          LootD := random(100)+1;
                          Textcolor(15);
                          write('Los dados giran... Tu aumento de vida es de ');
                          Delay(1200);
                          Textcolor(10);
                          writeln('+',LootD,'!');
                          Textcolor(15);
                          VidaJ := VidaJE + LootD;
                          VidaJE := VidaJ;
                       end
                       else
                       begin
                          PocionesPantalla(VidaJ);
                       end;
                       Textcolor(15);
                       writeln('Presiona cualquier tecla para continuar');
                       readkey;
                       clrscr;
                       TPocion := true;
                       PRep := PRep + 1;
                       ERep := 0;
                    end;
                   end;
                3 : begin                                                                        //Pantalla Loot aleatorio
                         If not(TLoot) AND (LRep <> 2) then
                         begin
                         Textcolor(14);
                         write('Mientras emprendias tu aventura encontraste una mejor ');
                         TipoLoot := random(2)+1;
                         If (TipoLoot = 1) then
                         begin
                              Textcolor(12);
                              writeln('arma!');
                              LootD := (random(3)+1)*Mejora;
                              Textcolor(14);
                              write('Decidiste equipartela de inmediato');
                              Textcolor(12);
                              write(' +',(LootD)*Mejora);
                              Textcolor(14);
                              writeln(' de ataque!');
                              AtaqueJ := AtaqueJ + LootD;
                         end
                         else
                         begin
                              Textcolor(11);
                              writeln('armadura!');
                              LootD := (random(3)+1)*Mejora;
                              Textcolor(14);
                              write('Decidiste equipartela de inmediato');
                              Textcolor(11);
                              write(' +',(LootD)*Mejora);
                              Textcolor(14);
                              writeln(' de defensa!');
                              DefensaJ := DefensaJ + LootD;
                         end;
                         Textcolor(15);
                         writeln('Presiona cualquier tecla para continuar');
                         readkey;
                         clrscr;
                         PantallaN := PantallaN+1;
                         TLoot := true;
                         TPocion := false;
                         TTienda := false;
                         LRep := LRep + 1;
                         ERep := 0;
                         end;
                    end;
                4 : begin                                                                          //Pantalla tienda
                         If not(TTienda) AND (TRep <> 2) then
                         begin
                         Textcolor(14);
                         writeln('Encontraste una tienda a mitad de tu camino!');
                         Textcolor(11);
                         Delay(1000);
                         write('"Todo lo que necesitas para tu aventura!"');
                         Textcolor(14);
                         writeln(' escuchaste');
                         Delay(1000);
                         Textcolor(15);
                         writeln('Elige comando');
                         Textcolor(10);
                         write('C');
                         Textcolor(15);
                         writeln(' - Comprar');
                         Textcolor(12);
                         write('A');
                         Textcolor(15);
                         writeln(' - Atacar');
                         writeln('S - Seguir tu camino');
                         readln(Decision);
                         clrscr;
                         If (Decision = 'A') then
                         begin
                              Dialogo := random(2)+1;
                              If (Dialogo = 1) then
                              begin
                                 Textcolor(13);
                                 writeln('No te llevaras nada tan facilmente!');
                                 Textcolor(15);
                              end
                              else
                              begin
                                 Textcolor(13);
                                 writeln('Mi vida depende de este trabajo, pasaras sobre mi cadaver!');
                                 Textcolor(15);
                              end;
                              Delay(1000);
                              EComerciante := true;
                              Combate(VidaJ, AtaqueJ, DefensaJ);
                              writeln('Presiona cualquier tecla para continuar');
                              Puntuacion := Puntuacion + 2;
                              If (Puntuacion > 9) then
                                 ContMejora := ContMejora + 1;
                              readkey;
                              clrscr;
                         end
                         else
                         If (Decision = 'C') then
                         begin
                              ArmaTienda := true;
                              ArmaduraTienda := true;
                              PocionTienda := true;
                              BajarPrecio := true;
                              TiendaAbierta := true;
                              Dialogo := random(2)+1;
                              If (Dialogo = 1) then
                              begin
                                 Textcolor(11);
                                 writeln('Bienvenido aventurero! En que te puedo ayudar hoy?');
                                 Textcolor(15);
                              end
                              else
                              begin
                                 Textcolor(11);
                                 writeln('Aprovecha! La mejor mercancia de los siete reinos!');
                                 Textcolor(15);
                              end;
                              Delay(1000);
                              LootA := (random(6)+3) * CombateComerciante;
                              CostoA := ((5+Puntuacion)*LootA) div 2;
                              LootAr := (random(6)+3) * CombateComerciante;
                              CostoD := ((5+Puntuacion)*LootAr) div 2;
                              LootP := (random(6)+3) * CombateComerciante;
                              CostoP := ((5*LootP)+Puntuacion) div 2;
                              While (TiendaAbierta) do
                              begin
                                   writeln('          TIENDA');
                                   If (ArmaTienda) then
                                   begin
                                        Textcolor(12);
                                        write('MEJOR ARMA');
                                        Textcolor(14);
                                        writeln('         ',CostoA,' Oro');
                                   end
                                   else
                                   begin
                                        Textcolor(4);
                                        writeln('AGOTADO');
                                   end;
                                   If (ArmaduraTienda) then
                                   begin
                                        Textcolor(11);
                                        write('MEJOR ARMADURA');
                                        Textcolor(14);
                                        writeln('     ',CostoD,' Oro');
                                   end
                                   else
                                   begin
                                        Textcolor(4);
                                        writeln('AGOTADO');
                                   end;
                                   If (PocionTienda) then
                                   begin
                                        Textcolor(10);
                                        write('POCION DESCONOCIDA');
                                        Textcolor(14);
                                        writeln(' ',CostoP,' Oro');
                                        Textcolor(15);
                                   end
                                   else
                                   begin
                                        Textcolor(4);
                                        writeln('AGOTADO');
                                   end;
                                   Textcolor(15);
                                   writeln('Elige comando');
                                   If (ArmaTienda) then
                                   begin
                                        Textcolor(12);
                                        write('A');
                                        Textcolor(15);
                                        writeln(' - Comprar Arma');
                                   end;
                                   If (ArmaduraTienda) then
                                   begin
                                        Textcolor(11);
                                        write('D');
                                        Textcolor(15);
                                        writeln(' - Comprar Armadura');
                                   end;
                                   If (PocionTienda) then
                                   begin
                                        Textcolor(10);
                                        write('P');
                                        Textcolor(15);
                                        writeln(' - Comprar Pocion');
                                   end;
                                   If (BajarPrecio) then
                                   begin
                                        Textcolor(8);
                                        write('E');
                                        Textcolor(15);
                                        writeln(' - Intentar bajar precios');
                                   end;
                                   writeln('S - Salir');
                                   write('Tu oro: ');
                                   Textcolor(14);
                                   writeln(OroJ);
                                   Textcolor(15);
                                   readln(Decision);
                                   Case Decision of
                                        'A' : begin
                                                  If not(ArmaTienda) then
                                                  begin
                                                      clrscr;
                                                      Textcolor(14);
                                                      writeln('Este producto no esta disponible');
                                                      Textcolor(15);
                                                  end
                                                  else
                                                  begin
                                                   clrscr;
                                                   If (OroJ >= CostoA) then
                                                   begin
                                                        Textcolor(14);
                                                        write('Compraste una mejor arma');
                                                        Textcolor(12);
                                                        write(' +',LootA);
                                                        Textcolor(14);
                                                        writeln(' a tu ataque!');
                                                        ArmaTienda := false;
                                                        OroJ := OroJ - CostoA;
                                                        AtaqueJ := AtaqueJ + LootA;
                                                   end
                                                   else
                                                   begin
                                                        Textcolor(14);
                                                        writeln('No tienes suficiente oro para comprar este objeto');
                                                   end;
                                                  end;
                                                   Textcolor(15);
                                                   writeln('Presiona cualquier tecla para regresar');
                                                   readkey;
                                                   clrscr;
                                              end;
                                        'D' : begin
                                                  If not(ArmaduraTienda) then
                                                  begin
                                                      clrscr;
                                                      Textcolor(14);
                                                      writeln('Este producto no esta disponible');
                                                      Textcolor(15);
                                                  end
                                                  else
                                                  begin
                                                   clrscr;
                                                   If (OroJ >= CostoD) then
                                                   begin
                                                        Textcolor(14);
                                                        write('Compraste una mejor armadura');
                                                        Textcolor(11);
                                                        write(' +',LootAr);
                                                        Textcolor(14);
                                                        writeln(' a tu defensa!');
                                                        ArmaduraTienda := false;
                                                        OroJ := OroJ - CostoD;
                                                        DefensaJ := DefensaJ + LootAr;
                                                   end
                                                   else
                                                   begin
                                                        Textcolor(14);
                                                        writeln('No tienes suficiente oro para comprar este objeto');
                                                   end;
                                                 end;
                                                   Textcolor(15);
                                                   writeln('Presiona cualquier tecla para regresar');
                                                   readkey;
                                                   clrscr;
                                              end;
                                        'P' : begin
                                                   If not(PocionTienda) then
                                                  begin
                                                      clrscr;
                                                      Textcolor(14);
                                                      writeln('Este producto no esta disponible');
                                                      Textcolor(15);
                                                  end
                                                  else
                                                  begin
                                                   clrscr;
                                                   If (OroJ >= CostoP) AND (Pociones <> MaxPociones) then
                                                   begin
                                                        Textcolor(14);
                                                        writeln('Compraste una pocion!');
                                                        Textcolor(14);
                                                        write('Cantidad de pociones actual: ');
                                                        Pociones := Pociones + 1;
                                                        Textcolor(11);
                                                        writeln(Pociones,'/',MaxPociones);
                                                        PocionTienda := false;
                                                        OroJ := OroJ - CostoP;
                                                        TipoPocion := random(3)+1;
                                                        Case TipoPocion of
                                                             1 : begin
                                                                      PCurativa := true;
                                                                 end;
                                                             2 : begin
                                                                      PVeneno := true;
                                                                 end;
                                                             3 : begin
                                                                      PMaxima := true;
                                                                 end;
                                                        end;
                                                   end
                                                   else
                                                   If (OroJ < CostoP) then
                                                   begin
                                                        Textcolor(14);
                                                        writeln('No tienes suficiente oro para comprar este objeto');
                                                   end
                                                   else
                                                   If (Pociones = MaxPociones) then
                                                   begin
                                                        Textcolor(14);
                                                        writeln('Llevas el maximo de pociones');
                                                   end;
                                                 end;
                                                   Textcolor(15);
                                                   writeln('Presiona cualquier tecla para regresar');
                                                   readkey;
                                                   clrscr;
                                              end;
                                        'E' : begin
                                                  If not(BajarPrecio) then
                                                  begin
                                                      clrscr;
                                                      Textcolor(14);
                                                      writeln('Ya no puedes bajar mas de precio');
                                                      Textcolor(15);
                                                  end
                                                  else
                                                  begin
                                                   clrscr;
                                                   Textcolor(14);
                                                   writeln('Tuviste una charla con el comerciante para intentar bajar los precios en tu compra');
                                                   Delay(1000);
                                                   LootD := random(6)+1;
                                                   If (LootD = 6) then
                                                   begin
                                                        Textcolor(11);
                                                        writeln('El comerciante te dio la razon y decidio bajar los precios a sus productos disponibles');
                                                        CostoA := CostoA div (random(5)+2);
                                                        CostoD := CostoD div (random(5)+2);
                                                        CostoP := CostoP div (random(5)+2);
                                                   end
                                                   else
                                                   begin
                                                        Textcolor(13);
                                                        writeln('El comerciante no accedio a tu propuesta y no hubo cambio en los precios');
                                                   end;
                                                 end;
                                                   BajarPrecio := false;
                                                   Textcolor(15);
                                                   writeln('Presiona cualquier tecla para regresar');
                                                   readkey;
                                                   clrscr;
                                              end;
                                        'S' : begin
                                                   clrscr;
                                                   Textcolor(14);
                                                   writeln('Decidiste continuar con tu aventura, escuchas a distancia');
                                                   Textcolor(11);
                                                   write('"Mucha suerte, aventurero!"');
                                                   Textcolor(14);
                                                   writeln(' de parte del comerciante');
                                                   Textcolor(15);
                                                   writeln('Presiona cualquier tecla para continuar');
                                                   readkey;
                                                   clrscr;
                                                   TiendaAbierta := false;
                                                   PantallaN := PantallaN + 1;
                                                   TTienda := true;
                                                   TLoot := false;
                                                   TPocion := false;
                                                   TRep := TRep + 1;
                                                   ERep := 0;
                                              end;
                                   end;
                              end;

                         end
                         else
                         begin
                                clrscr;
                                Textcolor(14);
                                writeln('Decidiste continuar con tu aventura, escuchas a distancia');
                                Textcolor(11);
                                write('"Mucha suerte, aventurero!"');
                                Textcolor(14);
                                writeln(' de parte del comerciante');
                                Textcolor(15);
                                writeln('Presiona cualquier tecla para continuar');
                                readkey;
                                clrscr;
                                PantallaN := PantallaN + 1;
                                TTienda := true;
                                TLoot := false;
                                TPocion := false;
                                TRep := TRep + 1;
                                ERep := 0;
                         end;
                         end;
                    end;
                5 : begin                                                                                 //Pantalla Boss
                          If (Puntuacion >= 13) then
                             BonusPuntuacion := BonusPuntuacion + 1;
                          If (Puntuacion >= 10) AND (LootD >= 10) then
                          begin
                               Dialogo := random(3)+1;
                               Case Dialogo of
                                            1 : begin
                                                     Textcolor(13);
                                                     writeln('Escuchas explosiones y gritos a tus espaldas...');
                                                     Delay(1500);
                                                     writeln('El cielo empieza a oscurecer...');
                                                     Delay(1500);
                                                     writeln('Una luz radiante color naranja brilla completamente en el horizonte...');
                                                     Delay(1500);
                                                     writeln('Las leyendas... Eran ciertas.');
                                                     Delay(3000);
                                                     clrscr;
                                                     Delay(1000);
                                                     Boss := true;
                                                     Textcolor(15);
                                                     Combate(VidaJ, AtaqueJ, DefensaJ);
                                                end;
                                            2 : begin
                                                     Textcolor(13);
                                                     writeln('Comienzas a sentir vibraciones en tus pies...');
                                                     Delay(1500);
                                                     writeln('Sonidos graves y fuertes vienen del bosque...');
                                                     Delay(1500);
                                                     writeln('Tanto es la magnitud de los pasos que caes a tus espaldas...');
                                                     Delay(1500);
                                                     writeln('Miras hacia arriba... Una sombra te cubre por completo.');
                                                     Delay(3000);
                                                     clrscr;
                                                     Delay(1000);
                                                     Boss := true;
                                                     Textcolor(15);
                                                     Combate(VidaJ, AtaqueJ, DefensaJ);
                                                end;
                                             3 : begin
                                                     Textcolor(13);
                                                     writeln('Escuchas un corcel a la distancia...');
                                                     Delay(1500);
                                                     writeln('Intentas desenfundar tu arma, pero ya esta frente a ti...');
                                                     Delay(1500);
                                                     writeln('La punta de su sable esta en tu cuello...');
                                                     Delay(1500);
                                                     writeln('"Cuando acabe contigo, nadie recordara tu nombre."');
                                                     Delay(3000);
                                                     clrscr;
                                                     Delay(1000);
                                                     Boss := true;
                                                     Textcolor(15);
                                                     Combate(VidaJ, AtaqueJ, DefensaJ);
                                                 end;
                               end;
                          Textcolor(15);
                          writeln('Presiona cualquier tecla para continuar');
                          readkey;
                          clrscr;
                          BonusPuntuacion := 0;
                          ERep := 0;
                          PantallaN := PantallaN + 1;
                          Puntuacion := Puntuacion + 4;
                          end;
                    end;
           end;
     end;
     writeln('Perdiste el juego, tu puntuacion final es de: ',Puntuacion);
     readln;
end.



