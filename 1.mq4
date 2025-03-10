 // EA
#property copyright "A"
#property link      "A"
#property version   "1.00"
#property strict

#define EDIT_WIDTH        100
#define EDIT_HEIGHT        30

 enum  ENUM_Stratigy_Type {Stratigy_A_=0, Stratigy_B_=1};
input ENUM_Stratigy_Type Stratigy_Type_List=0;

input color  High_Color=clrRed;
input color  Low_Color=clrLimeGreen;
input double Minimum_Points_between_High_Low_=10;
input double Maximum_Points_between_High_Low_=20;
 double Minimum_Points_between_High_Low=Minimum_Points_between_High_Low_;
 double Maximum_Points_between_High_Low=Maximum_Points_between_High_Low_;
input bool   Auto_M_Points_between_High_Low_TF=true;
input int    GPT_ADR_Number=5;
input bool   GPT_ExcludeSundayData=true;  // set to "false" to INCLUDE Sunday bar in the calculation
input double Minimum_Divide=3;
input double Maximum_Multiply=3;

input color  Fibo_Color=clrYellow;
input double Levels_0_=0;
input double Levels_1_=0.382;
input double Levels_2_=0.618;
input double Levels_3_=1;
input double Levels_4_=1.382;
input double Levels_5_=1.618;
input double Levels_6_=2;
input double Levels_7_=-0.382;
input double Levels_8_=-0.618;
input double Levels_9_=-1;
input double Levels_10_=-1.382;
input double Levels_11_=-1.618;
input double Levels_12_=-2;
input double Fibo_Level_to_Enter_Buy=0.382;
input double Fibo_Level_Buy_SL=0;
input double Buy_SL_Extra_Points=3;
input double Fibo_Level_Buy_TP=1;
input double Fibo_Level_to_Enter_Sell=0.618;
input double Fibo_Level_Sell_SL=1;
input double Fibo_Level_Sell_TP=0;
input double Sell_SL_Extra_Points=3;
input bool   Disable_Lines_and_Fibo_TF=false;
input bool   Buy_and_sell_in_Same_Time_TF=true;
input double Fibo_Temp_Up_Level=0.8;
input double Fibo_Temp_Down_Level=0.2;
input double Minimum_Stop_Loss_Points=0;
input double MAXimum_Stop_Loss_Points=0;
input double Minimum_Lots=0;
input double Maximum_Lots=0;
input bool   Show_SL_TP_TF=true;

input int    Fibo_History_Candle=5;

input bool   Restart_High_Low_when_open_order_TF=true;

input string MA_Filter_Note="--------------------------------------------------------------------------------------------------------";
input bool   MA_Filter_TF=true;
input int    MA_Filter_Period=21;
input int    MA_Filter_Shift=2;
input ENUM_MA_METHOD MA_Filter_Method=MODE_SMMA;
input ENUM_APPLIED_PRICE MA_Filter_Apply_to=PRICE_CLOSE;
 ENUM_TIMEFRAMES MA_Filter_Time_Frame=PERIOD_CURRENT;

input string ZZ_Filter_Note="-------------------------------------------------------------------------------------------------------";
input bool   ZZ_Filter_TF=true;
input int    ZZ_Depth=12;
input int    ZZ_Deviation=5;
input int    ZZ_Backstep=3;
 ENUM_TIMEFRAMES ZZ_Time_Frame=PERIOD_CURRENT;

input string Stochastic_Filter_Note="-------------------------------------------------------------------------------------------------------";
input bool   Stochastic_Filter_TF=true;
input int    Stochastic_K_Period=5;
input int    Stochastic_Slowing=3;
input int    Stochastic_D_Period=3;
input ENUM_STO_PRICE Stochastic_Price_Field=STO_LOWHIGH;
input ENUM_MA_METHOD Stochastic_MA_Method=MODE_SMA;
 ENUM_TIMEFRAMES Stochastic_Time_Frame=PERIOD_CURRENT;
input double Stochastic_High_Level=80;
input double Stochastic_Sell_Level=60;
input double Stochastic_Buy_Level=40;
input double Stochastic_Low_Level=20;

input string MTF_BBands_Stops_note="------------------------------------------------------------------------------------------";
input bool   MTF_BBands_Stops_TF=true;
input int    BBS_Length=20;      // Bollinger Bands Period
input int    BBS_Deviation=2;    // Deviation
input double BBS_MoneyRisk=1.00; // Offset Factor
input int    BBS_Signal=1;       // Display signals mode: 1-Signals & Stops; 0-only Stops; 2-only Signals;
input int    BBS_Line=1;         // Display line mode: 0-no,1-yes  
input int    BBS_Nbars=5000;
input ENUM_TIMEFRAMES BBS_TimeFrame=PERIOD_CURRENT;

input string Disable_Trades_Friday_note="--------------------------------------------------------------------------------------------";
input double Disable_Trades_before_close_Market_at_Friday_by_Hours=3;

input string Open_Time_Monday_note="--------------------------------------------------------------------------------------------";
input double Open_by_Hours_Monday=3;

input string Lots_Note="------------------------------------";
 string Lots_note="اللوت";
input double First_Lots=0.02;
input bool   Auto_Lots_TF=false;
input double Variable_A_for_Lot=2;
input double Variable_B_for_Lot_=2500;
 double Variable_B_for_Lot=Variable_B_for_Lot_;
input double Variable_C_for_Lot=0.75;
 double Divide_Number=2;
input int    Max_Lot_Group=0;
 enum  ENUM_Max_Lot_Group {Stop_Working=0, Start_from_0=1};
input  ENUM_Max_Lot_Group Max_Lot_Group_List=0;

input double TP_Ratio_from_SL=1;

input double Max_Spread=EMPTY_VALUE;

 int    Stop_Loss=0;
 double Take_Profit_Ratio_from_SL=1;

input string Magic_Number_Note="-----------------------------------------------------------------------------------------------";
 string Magic_Number_note="Magic Number";
input int    Magic_Number=112233;

input int    TP_Point_Multiply=1;

input bool   Show_Details_TF=true;
input int    XDISTANCE=100;
input int    YDISTANCE=0;

input int    Minimum_Bars=0;
   
 bool   Close_at_Reverse_TF=true;

 enum  ENUM_Buy_Sell_Both {Buy_only=0, Sell_Only=1, Buy_and_Sell=2};
 ENUM_Buy_Sell_Both Buy_Sell_Both_List=2;

input string Custom_Comment="@A";

input bool   Reverse_Orders_onlY_when_Loss_TF=true;

input int    Stop_Back_Test_at_Order_Count=0;

 bool HideTestIndicators_TF=false;

 bool   Repainting_Indicator_TF=false;

 bool   Button_TF=false;
 string Button_Note;
 int    X_Size=160;
 int    Y_Size=30;
 int    X_Side=20;
 int    Y_Side=40;
 int    Extra_X_=180;
 int    Extra_Y_=35;
 int    Font_Size=12;
 color  Font_Color=clrWhite;
 datetime D_S_Time;
 datetime D_E_Time;
 bool     Continue_after_close_TF_=true;
      bool    Continue_after_close_TF=Continue_after_close_TF_;
 double Required_Percent_Loss=0;
 double Required_step_to_close=0;

enum   ENUM_Special_Symbols_Or_All {Current_Symbol=0 , All_Symbols=1};
  ENUM_Special_Symbols_Or_All Current_Symbols_Or_All=0;
 string Symbol__Name="";

 int Time_Frame=Period();
 int    Max_Orders=EMPTY_VALUE;

 int    Start_Order_From=0;

 string Settings_End="---------------------------------------------------------------------";

 color  Arrow_Buy_Color=clrGreen;
 color  Arrow_Sell_Color=clrRed;
 bool   Wrong_Alert=false;
 double Max_Lots=EMPTY_VALUE;
 double Double_Vaue=2;

 int    ot,ticket,Button_X,Button_Y=0,Frame_MagicNumber,BuySL,BuyTP,SellSL,SellTP,LimitStep,Extra_Pips_2_=10,Temp_OTY
       ,Y_DISTANCE2,Buy_Ticket,Sell_Ticket,F_M_C_2_I_,Open_Type,Digits_,Obj__I,Obj__T_S=14,LRBOTIMC2,LRSOTIMC2
       ,BuyTicket1,SellTicket1,LROTMH,Temp_Levels,Last_Way,Group_Lot,Series_Count,S__L,Last_Profit_Ticket,Double_Lots;
       
 long   lineColor,lineStyle;

 string lineName,lineDescr,buttonID,Symbol_Full,Object_Name_Buy,Object_Name_Sell,Buy_1_Comment
       ,Buy_2_Comment,Buy_3_Comment,Buy_4_Comment,Buy_5_Comment,Sell_1_Comment,Sell_2_Comment,Sell_3_Comment,Sell_4_Comment
       ,Sell_5_Comment,Line_Name_1,Line_Name_2,M_N_Comment,Temp_Comment,Symbol_Array[]
       ,Obj__S,Obj__F="Arial",Object_Name,Comment__;

 double   lineDesPrice,sl,tp,buyLotPrice,buyLot,buyProfit,buyPrice,sellLotPrice,sellLot,sellProfit,sellPrice,Final_Lots
         ,revBuyPrice,revSellPrice,Obj_Lots,Spread,linePrice,TP_Price,Sell_1_Best_Price,Sell_2_Best_Price,Sell_3_Best_Price
         ,Sell_4_Best_Price,Sell_5_Best_Price,Buy_1_Best_Price,Buy_2_Best_Price,Buy_3_Best_Price,Buy_4_Best_Price
         ,Buy_5_Best_Price,Buy_1_Profit,Buy_2_Profit,Buy_3_Profit,Buy_4_Profit,Buy_5_Profit,Sell_1_Profit,RPBDMH
         ,Sell_2_Profit,Sell_3_Profit,Sell_4_Profit,Sell_5_Profit,Buy_1_SL_,Buy_2_SL_,Buy_3_SL_,Buy_4_SL_,Buy_5_SL_,Sell_1_SL_
         ,Sell_2_SL_,Sell_3_SL_,Sell_4_SL_,Sell_5_SL_,Obj_Price,RBPips_C,RBPips_All,RSPips_C,RSPips_All,Buy__TP,Buy__SL,Sell__TP
         ,Sell__SL,Temp_Frame_Lots,Max_Loss_Dollars,Pips_Value,Pips_Total,ObjPrice,Object_TP,Price_,MISMMXL,OLOBT,Ask_,Bid_
         ,Pointt,Point_,FOOPM,IClose,IOpen,IHigh,ILow,IHigh2,ILow2,Buy_Price,Sell_Price,IHigh_ILow,IHigh_ILow_3,RS_Temp_V_
         ,Buy_Sign,Sell_Sign,RBLTM,RSLTM,Value_0_N_,Value_1_N_,Value_2_N_,Value_3_N_,Value_4_N_,Value_5_N_,Value_6_N_,Value_7_N_
         ,Value_8_N_,Value_9_N_,Value_10_N_,Value_11_N_,Value_12_N_,Value_13_N_,Value_14_N_,IClose_N_,Value_92_N_,Value_93_N_
         ,ADX_MAIN,ADX_PLUSDI,ADX_MINUSDI,Value_0_O_,Value_1_O_,Value_2_O_,Value_3_O_,Value_4_O_,Value_5_O_,Required_Lots
         ,TickValue,Take_Profit_Points,Buy_Enter_Price,Sell_Enter_Price,Temp_High_Price,Temp_Low_Price,Fibo_Temp_Up_Price
         ,Fibo_Temp_Down_Price,Last_High_Price,Last_Low_Price,Last_Profit,Stratigy_B_Final_High_Price
         ,Stratigy_B_Final_Low_Price;

 color    Object_Color,Obj_Color;

 int      RBPips_O,RSPips_O,iii_1,iii_2,iii_3,iii_4,iii_5,Repeat,Buy_iBarShift,Sell_iBarShift,Lot_D,Last_Ticket
         ,T_C_Y_D,Get_Last_Error,RBOTM,RSOTM,ROTM,Last_Comment_I_,Volume_=20,LRBOTM,LRSOTM,Obj_Ticket,Symbol_Count,OTMS
         ,Orders_Count=50,Obj__Y=25,Bar_Shift,Period_,Period_Bar_1_,Period_Bar_2_,Counted_Up,Counted_Down,Temp_Orders;

 bool    CODO,Buy_TF,Sell_TF,OM_TF,Last_Buy_TF,Last_Sell_TF,Buy_Close_TF,Sell_Close_TF,Restarting_Lots_TF
         ,selected,Buy_Open_Orders_TF_1_=true,Sell_Open_Orders_TF_1_=true,Stop_Working_TF,Extra_Lot_TF
         ,Buy_Open_Orders_TF_2_=true,Sell_Open_Orders_TF_2_=true,Buy_Open_Orders_TF_3_=true,Sell_Open_Orders_TF_3_=true
         ,Open__Orders_TF=true,Close_Buy_TF,Close_Sell_TF,O_D_TF,Close_Delete_All_Orders_TF,ODOC,Duration_Work_TF
         ,Stop_Working_134_TF,Market_Close_TF,Print_TF,Test_For_COM_TF,Symbol_Found_TF,COM_TF,Symbol_Work_TF_Array[]
         ,Close_Delete_all_Orders_Profit_Selected_TF,Close_Delete_all_Orders_Now_Selected_TF,O_S_TF,O_C_TF,Not_Alert_TF
         ,Stratigy_B_Up_TF,Stratigy_B_Down_TF,Stratigy_B_Buy_TF,Stratigy_B_Sell_TF,Stratigy_B_Up_Last_TF,Stratigy_B_Down_Last_TF
         ,Stratigy_B_Final_Buy_TF,Stratigy_B_Final_Sell_TF;

 string   Obj_Name1,Obj_Name2,ObjName,Btn_Name,clickedChartObject,Btn_Text,Frame_MagicComment2;

 datetime Buy_OOTM,Sell_OOTM,Buy_1_TP_Time,Buy_2_TP_Time,Buy_3_TP_Time,Buy_4_TP_Time,Buy_5_TP_Time,Sell_1_TP_Time,Sell_2_TP_Time
         ,Sell_3_TP_Time,Sell_4_TP_Time,Sell_5_TP_Time,Buy_1_SL_Time,Buy_2_SL_Time,Buy_3_SL_Time,Buy_4_SL_Time,Buy_5_SL_Time
         ,Sell_1_SL_Time,Sell_2_SL_Time,Sell_3_SL_Time,Sell_4_SL_Time,Sell_5_SL_Time,Line_Time,Open_Time,Time_From,Time_To
         ,New_Buy_Time_1_,New_Sell_Time_1_,New_Buy_Time_2_,New_Sell_Time_2_,New_Buy_Time_3_,New_Sell_Time_3_,New_Buy_Time
         ,New_Sell_Time,ZZ2_Buy_3_Time,ZZ2_Sell_3_Time,Symbol_Time_Array[],EA_Time,Last_Time,Last_Time_0_,Time_0_
         ,Last_Daily_Time,Last_Weekly_Time,Last_Monthly_Time,High_Time,Low_Time,Temp_High_Time,Temp_Low_Time,Last_OOT
         ,Stratigy_B_Last_H_Time,Stratigy_B_Last_L_Time;
   
 extern double Capital=1000;
 extern double Amount=100;
 
 double   Buy_1_TP,Buy_2_TP,Buy_3_TP,Buy_4_TP,Buy_5_TP,Sell_1_TP,Sell_2_TP,Sell_3_TP,Sell_4_TP,Sell_5_TP,Buy_1_SL,Buy_2_SL
         ,Buy_3_SL,Buy_4_SL,Buy_5_SL,Sell_1_SL,Sell_2_SL,Sell_3_SL,Sell_4_SL,Sell_5_SL,Buy_1_Open_Price,Buy_2_Open_Price
         ,Buy_3_Open_Price,Buy_4_Open_Price,Buy_5_Open_Price,Sell_1_Open_Price,Sell_2_Open_Price,Sell_3_Open_Price
         ,Sell_4_Open_Price,Sell_5_Open_Price,RBOOPM,RSOOPM,OOPBT,New_Lot1,New_Lot2,ZZ_1,ZZ_2,ZZ_3,ZZ_1_2,ZZ_2_3,RPBDM,RTLM
         ,Lastt_Equity,BAOOPM,SAOOPM,Stopping_Bid_,Pending_Buy_Avg,Pending_Sell_Avg,Pending_Buy_Lots
         ,Pending_Sell_Lots,Open_Price,Symbol_Price_Array[],Symbol_Equity_Array[],Last_Ask,Last_Bid
         ,Close_Delete_all_Orders_Profit_Selected_Value,Required_Buy_Lots,Required_Sell_Lots,Required_Price,Required_TP
         ,Required_SL,High_Price,Low_Price,Final_Risk,M_TV,Last_Equity,Stratigy_B_Up_Price,Stratigy_B_Down_Price
         ,Stratigy_B_Buy_TP,Stratigy_B_Sell_TP;

 int      Slippage=3;
 ushort Sub_Sz;

 color      GPT_ADR_Color=Blue;//

 int        GPT_Font_Size=10;
 int        GPT_DisplayCorner=0;
 int        GPT_x=10;
 int        GPT_y=10;
 int        GPT_LastBars0=0;
 int        GPT_n=1; // $$$ Used to loop back x days

 datetime GPT_Time_0_,GPT_Last_Time_0_;

 string     GPT_font2= "Arial Black";
 static int GPT_adr5; // stores ADR calcs
 string     GPT_text; //

 double     GPT_PipValue=0.0001;

 double     GPT_Daily_Range=0.0;  // $$$ Used to Total up the Daily Ranges  

 datetime Exp_T;
 
 bool     Real_TF=true;
 bool     Demo_TF=true;
 int      Account_No=0;
 string   Expire_Time="2023.03.8 23:59";

int OnInit()
{
 if(Digits==2 || Digits==3) GPT_PipValue=GPT_PipValue*100; // $$$ For JPY pairs
 if(Digits== 4 || Digits== 5) GPT_PipValue= GPT_PipValue;

 //ObjectCreate("xADR2",OBJ_LABEL,0,0,0);          // Average Daily Range ("ADR5" Label)
 //ObjectSet("xADR2",OBJPROP_CORNER,GPT_DisplayCorner);
 //ObjectSet("xADR2",OBJPROP_XDISTANCE,GPT_x);
 //ObjectSet("xADR2",OBJPROP_YDISTANCE,GPT_y+50);
 GPT_Time_0_=0;

 Exp_T=StrToTime(Expire_Time);
 if(AccountNumber()!=Account_No && Account_No>0) 
 {
  Comment("Wrong Account : ");
  Alert("Wrong Account : ");
 }
 if(TimeCurrent()>Exp_T)
 {
  Comment("Expired : ");
  Alert("Expired : ");
 }

 if(!IsDemo() && !Real_TF)
 {
  Comment("Not Working in Real Account");
  Alert("Not Working in Real Account");
 }

 if(IsDemo() && !Demo_TF)
 {
  Comment("Not Working in Demo Account");
  Alert("Not Working in Demo Account");
 }

 Ask_=MarketInfo(Symbol_Full,MODE_ASK);
 Bid_=MarketInfo(Symbol_Full,MODE_BID);
 Spread=(Ask_-Bid_);
 Symbol_Full=Symbol();

 EventKillTimer();
 EventSetMillisecondTimer(1000);
 
 if(Current_Symbols_Or_All==0 || IsTesting())
 {
  Symbol_Count=1;
  ArrayResize(Symbol_Array,1);
  ArrayResize(Symbol_Time_Array,1);
  ArrayResize(Symbol_Price_Array,1);
  ArrayResize(Symbol_Equity_Array,1);
  ArrayResize(Symbol_Work_TF_Array,1);
  Symbol_Work_TF_Array[0]=true;  
  Symbol_Array[0]=Symbol_Full;
  Symbol_Equity_Array[0]=AccountEquity();
 }
 else // if(Current_Symbols_Or_All==1)
 {
  Sub_Sz=SetSymbols(Symbol__Name);//,Symbols_Array);
  Symbol_Count=Sub_Sz; 
 }
 
 /////////////
 Continue_after_close_TF=true;
 if(Button_TF) CreateButtons();

 ChartSetInteger(0,CHART_SHOW_GRID,false);
 ChartSetInteger(0,CHART_SHOW_OBJECT_DESCR,true); 

 return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
//----------------------------------
 //if(ObjectFind("xADR2")== 0 )          ObjectDelete("xADR2");
 EventKillTimer();

 DeleteButtons();
 return;
}

void OnTimer()
{
 if(!IsTesting())
 {
  Start();
 }
 return;
}

void OnTick()
{
if(AccountBalance()<(Capital-Amount))
 {
 Stop_Working_TF=true;
 }
 Start();
 return;
}

void Start()
{
 double Sub_SL=0,Sub_TP=0;
 Minimum_Points_between_High_Low=Minimum_Points_between_High_Low_;
 Maximum_Points_between_High_Low=Maximum_Points_between_High_Low_;
 if(Auto_M_Points_between_High_Low_TF)
 {
  GPT_Time_0_=iTime(Symbol(),PERIOD_D1,0);
  if(GPT_Last_Time_0_<GPT_Time_0_)
  {
   GPT_Daily_Range=0;
   GPT_n=1;
   for(int GPT_i=1;GPT_i<=GPT_ADR_Number;GPT_i++) // $$$ Loop Past 20 Daily Sessions
   {
    while(GPT_ExcludeSundayData && TimeDayOfWeek(iTime(Symbol(),PERIOD_D1,GPT_n))==0) GPT_n++; // If TimeDayOfWeek returns 0 add 1 to n to skip Sunday
    GPT_Daily_Range=GPT_Daily_Range+(iHigh(Symbol(),PERIOD_D1,GPT_n)-iLow(Symbol(),PERIOD_D1,GPT_n))/GPT_PipValue;
    GPT_adr5=(int) MathRound(GPT_Daily_Range/GPT_ADR_Number);
    GPT_n++;
   }
   GPT_text="ADR("+IntegerToString(GPT_ADR_Number)+") : "+IntegerToString(GPT_adr5);
   //ObjectSetText("xADR2",GPT_text,GPT_Font_Size,GPT_font2,GPT_ADR_Color);      // $$$ "ADR5" Label
   GPT_Last_Time_0_=GPT_Time_0_;
  }
  if(Minimum_Divide>0)
  {
   Minimum_Points_between_High_Low=(GPT_adr5/Minimum_Divide);
  }
  Maximum_Points_between_High_Low=(GPT_adr5*Maximum_Multiply);  
 }

 datetime Sub_Time=0;
 double Target_Dollar=0,Sub_V_=0;
 
 Temp_Orders=0;
 if(IsTesting())
 {
  if(TimeCurrent()>=StringToTime("2023.01.06 13:33:59")) 
  {
   //Comment(Temp_Orders+" # "+DoubleToString((1/Temp_Orders),0)); return;
  }
  if((OrdersTotal()+OrdersHistoryTotal())>=Stop_Back_Test_at_Order_Count && Stop_Back_Test_at_Order_Count>0)
  {
   Comment(DoubleToString((1/Temp_Orders),0)); return;
  }
  if(TimeCurrent()<=StringToTime("2022.12.02 00:15")) 
  {
   //Comment(Stop_Back_Test_at_Order_Count+" # "+Temp_Orders); return;
  }
 }

 //return;
 //if(TimeCurrent()>=StringToTime("2017.11.02 18:00")) return;
 Exp_T=StrToTime(Expire_Time);
 if(AccountNumber()!=Account_No && Account_No>0) 
 {
  Comment("Wrong Account : ");
  return;
 }
 if(TimeCurrent()>Exp_T)
 {
  Comment("Expired : ");
  return;
 }

 if(!IsDemo() && !Real_TF)
 {
  Comment("Not Working in Real Account");
  return;
 }

 if(IsDemo() && !Demo_TF)
 {
  Comment("Not Working in Demo Account");
  return;
 }

 if(!IsExpertEnabled() && !IsTesting())
 {
  Comment(" Expert Advisors is disabled");
  return;
 }

 if(!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) && !MQLInfoInteger(MQL_TESTER))
 {
  Comment("Expert Advisors is disabled: Enable it");
  Alert("Expert Advisors is disabled: Enable it");
  return;
 }

 Symbol_Full=Symbol();
 
 if(MarketInfo(Symbol(),MODE_MINLOT)==0.001) Lot_D=3;
 else
 if(MarketInfo(Symbol(),MODE_MINLOT)==0.01 ) Lot_D=2;
 else
 if(MarketInfo(Symbol(),MODE_MINLOT)==0.1  ) Lot_D=1;
 else Lot_D=0;

 Repeat=20;
 if(Point<0.00001) 
 {
  Comment("Porint is Zero");
  return;
 }

 Ask_=MarketInfo(Symbol_Full,MODE_ASK);
 Bid_=MarketInfo(Symbol_Full,MODE_BID);
 Spread=(Ask_-Bid_);
 Frame_MagicNumber=Magic_Number;
 if(Stopping_Bid_==Bid_) 
 {
  Comment("Market Is Closed Stopping_Bid_");
  return;
 }
 Stopping_Bid_=0;
 ////////////////////////////
 //////////Start
 if(Temp_High_Time<1)
 {
  Temp_High_Time=TimeCurrent();
 }

 if(Temp_Low_Time<1)
 {
  Temp_Low_Time=TimeCurrent();
 }

 HideTestIndicators(HideTestIndicators_TF);

 if(Period_!=Period())
 {
  Comment(" ");
  Last_Time=0; 
  Time_Frame=Period();
  Period_=Period();
 }

 if(EA_Time<1)
 {
  EA_Time=TimeCurrent();
 }

 if(Max_Lots>MarketInfo(Symbol_Full,MODE_MAXLOT)) Max_Lots=MarketInfo(Symbol_Full,MODE_MAXLOT);
 MISMMXL=Max_Lots;
 Print_TF=true;
 
 Market_Close_TF=false;
 
 if(Capital<AccountBalance())
 {
  Stop_Working_134_TF=false;
 }
 

 ////////////////////////////////////////////////
 
 //Comment("");

 Test_For_COM_TF=false;
 for(iii_1=0;iii_1<Symbol_Count;iii_1++) 
 {
  Symbol_Found_TF=false;
  Symbol_Full=Symbol_Array[iii_1];
  Ask_=MarketInfo(Symbol_Full,MODE_ASK);
  Bid_=MarketInfo(Symbol_Full,MODE_BID);
  if(Bid_>0 && Ask_>0 && Symbol_Full!="" && Symbol_Full!=" " && Symbol_Full!="  ") Symbol_Found_TF=true;
  if(Symbol_Found_TF && !Market_Close_TF)
  {
   ///////// from here
   Ask_=MarketInfo(Symbol_Full,MODE_ASK);
   Bid_=MarketInfo(Symbol_Full,MODE_BID);      
   Spread=Ask_-Bid_;
   if(MarketInfo(Symbol_Full,MODE_MINLOT)==0.001) Lot_D=3;
   else
   if(MarketInfo(Symbol_Full,MODE_MINLOT)==0.01 ) Lot_D=2;
   else
   if(MarketInfo(Symbol_Full,MODE_MINLOT)==0.1  ) Lot_D=1;
   else Lot_D=0;

   Point_=MarketInfo(Symbol_Full,MODE_POINT);
   Digits_=(int) MarketInfo(Symbol_Full,MODE_DIGITS);
   Pointt=Point_;
   if(Digits_==3 || Digits_==5)
   {
    Pointt=(Point_*10);
   }

   if(Show_Details_TF)
   {
    Obj__S="MTF_Signals";

    Obj__I=0;

    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"open Buy : "+IntegerToString(RealBuyOrdersTotalM(Frame_MagicNumber))+" ( "+DoubleToStr(RealBuySumLotsM(Frame_MagicNumber,""),Lot_D)+" )",Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"open Sell : "+IntegerToString(RealSellOrdersTotalM(Frame_MagicNumber))+" ( "+DoubleToStr(RealSellSumLotsM(Frame_MagicNumber,""),Lot_D)+" )",Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    RPBDM=NormalizeDouble(RealOrdersProfitByTimeM(Frame_MagicNumber,0),2);
    if(RPBDM<0)
    {
     Object_Color=clrRed;
    }
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"Open orders profit : "+DoubleToStr(RPBDM,2),Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"Free Margin : "+DoubleToStr(AccountFreeMargin(),2),Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"Balance : "+DoubleToStr(AccountBalance(),2),Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    if(AccountEquity()<AccountBalance())
    {
     Object_Color=clrRed;
    }
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"Account : "+DoubleToStr(AccountEquity(),2),Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);
    
    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"G : "+IntegerToString(Group_Lot)+" S :"+IntegerToString(Series_Count),Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"Points (Red-Green) : "+DoubleToString(MathAbs((High_Price-Low_Price)/Pointt),Digits_),Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"Range : "+IntegerToString(GPT_adr5),Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);

    Obj__I++;
    Object_Color=clrLime;
    ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
    ObjectSetText(Obj__S+IntegerToString(Obj__I),"Min Range: "+DoubleToString(Minimum_Points_between_High_Low,2)+"Max Range: "+DoubleToString(Maximum_Points_between_High_Low,2) ,Obj__T_S,Obj__F, Object_Color);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
    ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
     ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);
    
    Obj__I++;
    if(RealOrdersTotalM(Frame_MagicNumber)>0)
    {
     Object_Color=clrLime;
     ObjectCreate( Obj__S+IntegerToString(Obj__I), OBJ_LABEL, 0, 0, 0);
     ObjectSetText(Obj__S+IntegerToString(Obj__I),"Risk: "+DoubleToString(Final_Risk,2) ,Obj__T_S,Obj__F, Object_Color);
     ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_CORNER, 0);
     ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_XDISTANCE, XDISTANCE);
     ObjectSet(    Obj__S+IntegerToString(Obj__I), OBJPROP_YDISTANCE,(Obj__I*Obj__Y)+YDISTANCE);
    }
    else
    {
     ObjectDelete(Obj__S+IntegerToString(Obj__I));
    }
   }

   /*
   S__L=StringLen(Symbol_Full+IntegerToString(Magic_Number)+Custom_Comment);
   if(S__L>28)
   {
    Comment("Custom Comment is too long ("+(string) S__L+")");
    return;   
   }
  */
   
   Ask_=MarketInfo(Symbol_Full,MODE_ASK);
   Bid_=MarketInfo(Symbol_Full,MODE_BID);
   
   Time_0_=iTime(Symbol_Full,PERIOD_CURRENT,0);
   
   Duration_Void();

   if(OrdersTotalM(Frame_MagicNumber)<1)
   {
    Symbol_Price_Array[iii_1]=Bid_;
    Symbol_Equity_Array[iii_1]=AccountEquity();
    
    Last_Ask=MarketInfo(Symbol_Full,MODE_BID);
    Last_Bid=MarketInfo(Symbol_Full,MODE_BID);
   }
   else
   {
    Stratigy_B_Up_TF=false;
    Stratigy_B_Down_TF=false;
    Stratigy_B_Buy_TF=false;
    Stratigy_B_Sell_TF=false;
    Stratigy_B_Up_Last_TF=false;
    Stratigy_B_Down_Last_TF=false;
    Stratigy_B_Up_Price=0;
    Stratigy_B_Down_Price=0;
    Stratigy_B_Buy_TP=0;
    Stratigy_B_Sell_TP=0;
   }   
   
   RBOTM=RealBuyOrdersTotalM(Frame_MagicNumber);
   RSOTM=RealSellOrdersTotalM(Frame_MagicNumber);
   
   if(RBOTM<1)
   {
    Objects_Delete("Buy__");
   }

   if(RSOTM<1)
   {
    Objects_Delete("Sell__");
   }

   if(OrdersTotalM(Frame_MagicNumber)>0)
   {
    RPBDM=NormalizeDouble((RealProfitByDollarsMH(Frame_MagicNumber,Symbol_Time_Array[iii_1],Symbol_Full)+RealOrdersProfitByTimeM(Frame_MagicNumber,0,Symbol_Full)),2);
    
    if(Close_Delete_all_Orders_Profit_Selected_TF && RealOrdersTotalM(Frame_MagicNumber)>0 && ((Close_Delete_all_Orders_Profit_Selected_Value>=0 && RPBDM>=Close_Delete_all_Orders_Profit_Selected_Value) || (Close_Delete_all_Orders_Profit_Selected_Value<0 && RPBDM<=Close_Delete_all_Orders_Profit_Selected_Value)))
    {
     Symbol_Work_TF_Array[iii_1]=false;
     Print(Symbol_Array[iii_1]+" Close_Delete_all_Orders_Profit_Selected_TF "+DoubleToStr(RPBDM,2));
    }
    
    if(Close_Delete_all_Orders_Now_Selected_TF)
    {
     Symbol_Work_TF_Array[iii_1]=false;
     Print(Symbol_Array[iii_1]+" Close_Delete_all_Orders_Now_Selected_TF "+DoubleToStr(RPBDM,2));
     Continue_after_close_TF=false;
    }

    RPBDM=NormalizeDouble((RealProfitByDollarsMH(Frame_MagicNumber,Symbol_Time_Array[iii_1],Symbol_Full)+RealOrdersProfitByTimeM(Frame_MagicNumber,0,Symbol_Full)),2);

    if(Required_Percent_Loss>0 && RPBDM<=(Symbol_Equity_Array[iii_1]-(Symbol_Equity_Array[iii_1]*Required_Percent_Loss/100)))
    {
     Symbol_Work_TF_Array[iii_1]=false;
     Print(Symbol_Array[iii_1]+" Required_Percent__Loss "+DoubleToStr(RPBDM,2));
    }
   
    if(Required_step_to_close>0 && MathAbs(Symbol_Price_Array[iii_1]-Bid_)>=(Required_step_to_close*Pointt))
    {
     Symbol_Work_TF_Array[iii_1]=false;
     Print(Symbol_Array[iii_1]+" Required_step_to_close");
    }
    
   }
   
   if(!Symbol_Work_TF_Array[iii_1] && RealOrdersTotalM(Frame_MagicNumber)<1)
   {
    Symbol_Work_TF_Array[iii_1]=true;
    if(!Continue_after_close_TF) Symbol_Work_TF_Array[iii_1]=false;
    //Symbol_Time_Array[iii_1]=OrdersLastOCTMH(Frame_MagicNumber);
    Close_Delete_all_Orders_Profit_Selected_TF=false;
    Close_Delete_all_Orders_Now_Selected_TF=false;
    ObjectSetInteger(0,"Btn_Close_Delete_all_Orders_Profit",OBJPROP_STATE,0);
    ObjectSetInteger(0,"Btn_Close_Delete_all_Orders_Now",OBJPROP_STATE,0);
   }

   if(!Symbol_Work_TF_Array[iii_1] && RealOrdersTotalM(Frame_MagicNumber)>0 && !Market_Close_TF)
   {
    for(iii_3=0;iii_3<=Repeat;iii_3++)
    {
     if(RealOrdersTotalM(Frame_MagicNumber)>0)
     {
      CloseRealOrdersM(Frame_MagicNumber);
     }
     if(RealOrdersTotalM(Frame_MagicNumber)<1)
     {
      iii_3=(Repeat*2);
     }
    }
    if(RealOrdersTotalM(Frame_MagicNumber)>0)
    {
     return;
    }

    for(iii_3=0;iii_3<=Repeat;iii_3++)
    {
     if(OrdersTotalM(Frame_MagicNumber)>0)
     {
      DeletePendingOrdersM(Frame_MagicNumber);
     }
     if(OrdersTotalM(Frame_MagicNumber)<1)
     {
      iii_3=(Repeat*2);
     }
    }
    if(OrdersTotalM(Frame_MagicNumber)>0)
    {
     return;
    }
    
   }
   
   if(Last_Monthly_Time>0 && Last_Monthly_Time>=iTime(Symbol_Full,PERIOD_MN1,0))
   {
    Comment("Waiting Next Month");//+Last_Monthly_Time+" # "+iTime(Symbol_Full,PERIOD_MN1,0));
    return;
   }
   
   if(Last_Weekly_Time>0 && Last_Weekly_Time>=iTime(Symbol_Full,PERIOD_W1,0))
   {
    Comment("Waiting Next Week");
    return;
   }
   
   if(Last_Daily_Time>0 && Last_Daily_Time>=iTime(Symbol_Full,PERIOD_D1,0))
   {
    Comment("Waiting Next Day");
    return;
   }
   
   Comment("");
   
   if(!Stop_Working_134_TF && !Market_Close_TF && Duration_Work_TF && Symbol_Work_TF_Array[iii_1])
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    Spread=Ask_-Bid_;
 
    Bar_Shift=1;
    Time_Frame=PERIOD_D1;
     
    Last_Time=iTime(Symbol_Full,Time_Frame,0);
    IClose=iClose(Symbol_Full,Time_Frame,Bar_Shift);
    IHigh=iHigh(Symbol_Full,Time_Frame,Bar_Shift);
    ILow=iLow(Symbol_Full,Time_Frame,Bar_Shift);
    IHigh_ILow=MathAbs(IHigh-ILow);
    IOpen=iOpen(Symbol_Full,Time_Frame,0);

    Time_Frame=Period();
    
    if(Stop_Working_TF)
    {
     Comment("Stop_Working_TF");
     return;
    }
    
    if(!Buy_TF && !Sell_TF && (Max_Spread<0.1 || Spread<=(Max_Spread*Pointt)))// && Last_Time_0_<Time_0_)
    {
     Read_Signal();
     Last_Time_0_=Time_0_;
    }
 //Print("D "+Buy_TF);
    if(
       (Open_by_Hours_Monday>0.01 && ((DayOfWeek()==1 && TimeCurrent()<((int) iTime(Symbol_Full,PERIOD_D1,0)+(Open_by_Hours_Monday*3600))) || DayOfWeek()==0))
       ||
       (Disable_Trades_before_close_Market_at_Friday_by_Hours>0.01 && DayOfWeek()==5 && TimeCurrent()>=((int) iTime(Symbol_Full,PERIOD_D1,0)+(PERIOD_D1*60)-(Disable_Trades_before_close_Market_at_Friday_by_Hours*3600)))
      )
    {
     Buy_TF=false;
     Sell_TF=false;
    }   
 //Print("E "+Buy_TF);
    
    if(TP_Ratio_from_SL>=0.01)
    {
     Sub_V_=(Final_Risk*TP_Ratio_from_SL);
     if(Sub_V_>=0.01)
     {
      if(RealBuyProfitByDollarsM(Frame_MagicNumber)>=Sub_V_)
      {
       Close_Buy_TF=true;
      }
      if(RealSellProfitByDollarsM(Frame_MagicNumber)>=Sub_V_)
      {
       Close_Sell_TF=true;
      }
     }
    }
    else
    {
     if(Buy__TP>Pointt)
     {
      if(Bid_>=Buy__TP)
      {
       if(RealBuyOrdersTotalM(Frame_MagicNumber)>0)
       {
        Close_Buy_TF=true;
       }
      }
     }
     if(Sell__TP>Pointt)
     {
      if(Ask_<=Sell__TP)
      {
       if(RealSellOrdersTotalM(Frame_MagicNumber)>0)
       {
        Close_Sell_TF=true;
       }
      }
     }
    }

    if(Close_Buy_TF)
    {
     if(RealBuyOrdersTotalM(Frame_MagicNumber)>0)
     {
      Print("Close_Buy_TF");
      Comment("Close_Buy_TF");
      CloseRealBuyOrdersM(Frame_MagicNumber);
      return;
     }
    }

    if(Close_Sell_TF)
    {
     if(RealSellOrdersTotalM(Frame_MagicNumber)>0)
     {
      Print("Close_Sell_TF");
      Comment("Close_Sell_TF");
      CloseRealSellOrdersM(Frame_MagicNumber);
      return;
     }
    }
    
    Close_Buy_TF=false;
    Close_Sell_TF=false;

    Comment("Working "+TimeToStr(TimeCurrent(),TIME_DATE|TIME_SECONDS)+"# "+DoubleToString(Temp_High_Price,Digits_)+"# "+DoubleToString(Temp_Low_Price,Digits_));//+"# "+Buy_TF+"# "+Sell_TF);
     
    if(Close_at_Reverse_TF && OrdersTotalM(Frame_MagicNumber)>0)
    {
     if(Buy_TF && RealSellOrdersTotalM(Frame_MagicNumber)>0)
     {
      Print("RealSellOrdersTotalM Close_at_Reverse_TF");
      CloseRealSellOrdersM(Frame_MagicNumber);
      if(Buy_TF && RealSellOrdersTotalM(Frame_MagicNumber)>0)
      {
       Comment("RealSellOrdersTotalM Close_at_Reverse_TF");
       return;
      }
     }

     if(Sell_TF && RealBuyOrdersTotalM(Frame_MagicNumber)>0)
     {
      Print("CloseRealBuyOrdersM Close_at_Reverse_TF");
      CloseRealBuyOrdersM(Frame_MagicNumber);
      if(Sell_TF && RealBuyOrdersTotalM(Frame_MagicNumber)>0)
      {
       Comment("RealBuyOrdersTotalM Close_at_Reverse_TF");
       return;
      }
     }
    }
    
    //if(LastRealOOTMH(Frame_MagicNumber)<iTime(Symbol_Full,Time_Frame,0) && (!Close_at_Reverse_TF || OrdersTotalM(Frame_MagicNumber)<1))
 //Print("F "+Buy_TF);
    if(Duration_Work_TF)
    {
     if(Buy_TF && Buy_Sell_Both_List!=1)
     {
      Ask_=MarketInfo(Symbol_Full,MODE_ASK);
      Bid_=MarketInfo(Symbol_Full,MODE_BID);
     
      Open_Price=Ask_;
      if(MathAbs(Open_Price-Buy__SL)<(Minimum_Stop_Loss_Points*Pointt) || (MAXimum_Stop_Loss_Points>0 && MathAbs(Open_Price-Buy__SL)>(MAXimum_Stop_Loss_Points*Pointt)))
      {
       Buy_TF=false;
       Open_Price=0;
      }
      Buy_Ticket=0;
      if(Open_Price>Pointt) 
      {
       Double_Lots=0;
       if(!Extra_Lot_TF)
       {
        Required_Lots_Void(Open_Price,Buy__SL);
        if(Minimum_Lots>=0.01 && Required_Lots<=Minimum_Lots)
        {
         if(Required_Lots<0.01)
         {
          Required_Lots=0.01;
         }
         Double_Lots=1;
         Required_Lots=(Required_Lots*2);
        }
        else if(Maximum_Lots>=0.01 && Required_Lots>=Maximum_Lots)
        {
         Double_Lots=2;
         Required_Lots=(Required_Lots/2);
        }
        Final_Lots=Required_Lots;
        Required_Buy_Lots=Required_Lots;
        if(TP_Ratio_from_SL>0)
        {
         if(M_TV>0 && Required_Lots>0)
         {
          Buy__TP=(Open_Price+(((Final_Risk*TP_Ratio_from_SL)/10/M_TV/Required_Lots)*Pointt*TP_Point_Multiply)+Point_);
         }
         //Print("W "+Final_Risk+" # "+Buy__TP);
         //Buy__SL=NormalizeDouble((OOPBT+((MathAbs(OOPBT-Buy__SL)+Pointt)*TP_Ratio_from_SL)+Pointt),Digits_);
        }
       }
       else
       {
        Required_Buy_Lots=(Final_Lots-RealBuySumLotsM(Frame_MagicNumber," "));
        if(Minimum_Lots>=0.01 && Required_Buy_Lots<=Minimum_Lots)
        {
         if(Required_Buy_Lots<0.01)
         {
          Required_Buy_Lots=0.01;
         }
         Double_Lots=1;
         Required_Buy_Lots=(Required_Buy_Lots*2);
        }
        else if(Maximum_Lots>=0.01 && Required_Buy_Lots>=Maximum_Lots)
        {
         Double_Lots=2;
         Required_Buy_Lots=(Required_Buy_Lots/2);
        }
       }
       
       if(Stop_Working_TF)
       {
        Comment("Stop_Working_TF");
        return;
       }

       S__L=StringLen(Frame_MagicComment2);
       if(S__L>28)
       {
        Comment("Custom Comment is too long ("+(string) S__L+")");
        return;   
       }
       //Print("WB "+Open_Price+" # "+Final_Lots+" # "+Final_Risk+" # "+NormalizeDouble(Buy__SL,Digits_)+" # "+NormalizeDouble(Buy__TP,Digits_)+" # "+((Open_Price-Buy__SL)/Pointt)+" # "+((Buy__TP-Open_Price)/Pointt));
       OOPBT=(-9);
       OpenBuyM(Required_Buy_Lots,OP_BUY,Open_Price);
       OOPBT=OrderOPByTicket(Buy_Ticket);
      }
      if(Buy_Ticket>0 && OOPBT>0)
      {
       if(NormalizeDouble(RealBuySumLotsM(Frame_MagicNumber," "),Lot_D)>=NormalizeDouble(Final_Lots,Lot_D))
       {
        Buy_TF=false;
        Extra_Lot_TF=false;
       }
       else
       {
        Extra_Lot_TF=true;
       }
       Print("Open Buy "+IntegerToString(Double_Lots)+" # "+ DoubleToString(Final_Risk,2)+" # "+DoubleToString(Buy__SL,2)+" # "+DoubleToString(Buy__TP,2));
       Last_Way=0;
       if(Restart_High_Low_when_open_order_TF)
       {
        Low_Price=0;
        Low_Time=Time[0];
        Temp_Low_Time=TimeCurrent();
        Temp_Low_Price=0;
        Print("Low_Price A ");
       }

       if(TP_Ratio_from_SL>0 && Buy__SL>Pointt)
       {
        Buy__TP=(OOPBT+(MathAbs(OOPBT-Buy__SL)*TP_Ratio_from_SL));
       }
         //Print("W "+Final_Risk+" # "+Buy__TP);
         
       Sub_SL=MathAbs(OOPBT-Buy__SL);
       Sub_TP=MathAbs(OOPBT-Buy__TP);
         
       if(Double_Lots==1)
       {
        Buy__TP=(OOPBT+(Sub_TP/2));
        Buy__SL=(OOPBT-(Sub_SL/2));
       }
       
       if(!Disable_Lines_and_Fibo_TF)
       {
        Set_Trend("Buy__SL",clrPurple,1,1,TimeCurrent(),Buy__SL,32000000000,Buy__SL,DoubleToString(Buy__SL,Digits_));
        Set_Trend("Buy__TP",clrBlue,1,1,TimeCurrent(),Buy__TP,32000000000,Buy__TP,DoubleToString(Buy__TP,Digits_));
       }
       
       if(Show_SL_TP_TF)
       {
        
        if(Buy__TP>0 || Buy__SL>0)
        {    
         for(iii_3=0;iii_3<=Repeat;iii_3++)
         {
          if(Buy__TP>0)
          {
           ModifyTicketToSpecialTPM(Buy_Ticket,Buy__TP);
           ModifyRealBuyOrdersToSpecialTPM(Frame_MagicNumber,Buy__TP);
          }
          
          if(Buy__SL>0)
          {
           ModifyTicketToSpecialSLM(Buy_Ticket,Buy__SL);
          }
         }
        }
       }
       Restarting_Lots_TF=false;       
      }
     }
    // else
     if(Sell_TF && Buy_Sell_Both_List!=0)
     {
      Ask_=MarketInfo(Symbol_Full,MODE_ASK);
      Bid_=MarketInfo(Symbol_Full,MODE_BID);
     
      Open_Price=Bid_;
      if(MathAbs(Open_Price-Sell__SL)<(Minimum_Stop_Loss_Points*Pointt) || (MAXimum_Stop_Loss_Points>0 && MathAbs(Open_Price-Sell__SL)>(MAXimum_Stop_Loss_Points*Pointt)))
      {
       Sell_TF=false;
       Open_Price=0;
      }
      Sell_Ticket=0;
      if(Open_Price>Pointt)
      {
       Double_Lots=0;
       if(!Extra_Lot_TF)
       {
        Required_Lots_Void(Open_Price,Sell__SL);
        if(Minimum_Lots>=0.01 && Required_Lots<=Minimum_Lots)
        {
         if(Required_Lots<0.01)
         {
          Required_Lots=0.01;
         }
         Double_Lots=1;
         Required_Lots=(Required_Lots*2);
        }
        else if(Maximum_Lots>=0.01 && Required_Lots>=Maximum_Lots)
        {
         Double_Lots=2;
         Required_Lots=(Required_Lots/2);
        }
        Final_Lots=Required_Lots;
        Required_Sell_Lots=Required_Lots;
        if(TP_Ratio_from_SL>0)
        {
         if(M_TV>0 && Required_Lots>0)
         {
          Sell__TP=(Open_Price-(((Final_Risk*TP_Ratio_from_SL)/10/M_TV/Required_Lots)*Pointt*TP_Point_Multiply)-Point_);
         }
         //Print("W "+Final_Risk+" # "+Buy__TP);
         //Buy__SL=NormalizeDouble((OOPBT+((MathAbs(OOPBT-Buy__SL)+Pointt)*TP_Ratio_from_SL)+Pointt),Digits_);
        }
       }
       else
       {
        Required_Sell_Lots=(Final_Lots-RealSellSumLotsM(Frame_MagicNumber," "));
        if(Minimum_Lots>=0.01 && Required_Sell_Lots<=Minimum_Lots)
        {
         if(Required_Sell_Lots<0.01)
         {
          Required_Sell_Lots=0.01;
         }
         Double_Lots=1;
         Required_Sell_Lots=(Required_Sell_Lots*2);
        }
        else if(Maximum_Lots>=0.01 && Required_Sell_Lots>=Maximum_Lots)
        {
         Double_Lots=2;
         Required_Sell_Lots=(Required_Sell_Lots/2);
        }
       }

       if(Stop_Working_TF)
       {
        Comment("Stop_Working_TF");
        return;
       }

       //Print("WS "+Open_Price+" # "+Final_Lots+" # "+Final_Risk+" # "+NormalizeDouble(Sell__SL,Digits_)+" # "+NormalizeDouble(Sell__TP,Digits_)+" # "+((Sell__SL-Open_Price)/Pointt)+" # "+((Open_Price-Sell__TP)/Pointt));
       OOPBT=(-9);
       OpenSellM(Required_Sell_Lots,OP_SELL,Open_Price);
       OOPBT=OrderOPByTicket(Sell_Ticket);
      }
      if(Sell_Ticket>0 && OOPBT>0)
      {
       //Print("A "+RealSellSumLotsM(Frame_MagicNumber," ")+" # "+Final_Lots+" # "+(RealSellSumLotsM(Frame_MagicNumber," ")>=Final_Lots)+" # "+(NormalizeDouble(RealSellSumLotsM(Frame_MagicNumber," "),Lot_D)>=NormalizeDouble(Final_Lots,Lot_D)));
       if(NormalizeDouble(RealSellSumLotsM(Frame_MagicNumber," "),Lot_D)>=NormalizeDouble(Final_Lots,Lot_D))
       {
        //Print("BBBBBBBBBBBBBBBBBB");
        Sell_TF=false;
        Extra_Lot_TF=false;
       }
       else
       {
        Extra_Lot_TF=true;
       }
       Print("Open Sell "+IntegerToString(Double_Lots)+" # "+DoubleToString(Final_Risk,2)+" # "+DoubleToString(Sell__SL,2)+" # "+DoubleToString(Sell__TP,2));
       Last_Way=0;
       if(Restart_High_Low_when_open_order_TF)
       {
        High_Price=0;
        High_Time=Time[0];
        Temp_High_Time=TimeCurrent();
        Temp_High_Price=0;
        Print("High_Price A "+TimeToString(High_Time)+" # "+DoubleToString(High_Price,Digits_));
       }
       
       if(TP_Ratio_from_SL>0 && Sell__SL>Pointt)
       {
        Sell__TP=(OOPBT-(MathAbs(OOPBT-Sell__SL)*TP_Ratio_from_SL));
       }

       Sub_SL=MathAbs(OOPBT-Sell__SL);
       Sub_TP=MathAbs(OOPBT-Sell__TP);
         
       if(Double_Lots==1)
       {
        Sell__TP=(OOPBT-(Sub_TP/2));
        Sell__SL=(OOPBT+(Sub_SL/2));
       }

       if(!Disable_Lines_and_Fibo_TF)
       {
        Set_Trend("Sell__SL",clrPurple,1,1,TimeCurrent(),Sell__SL,32000000000,Sell__SL,DoubleToString(Sell__SL,Digits_));
        Set_Trend("Sell__TP",clrBlue,1,1,TimeCurrent(),Sell__TP,32000000000,Sell__TP,DoubleToString(Sell__TP,Digits_));
       }

       if(Show_SL_TP_TF)
       {
        
        if(Sell__TP>0 || Sell__SL>0)
        {    
         for(iii_3=0;iii_3<=Repeat;iii_3++)
         {
          if(Sell__TP>0)
          {
           ModifyTicketToSpecialTPM(Sell_Ticket,Sell__TP);
           ModifyRealSellOrdersToSpecialTPM(Frame_MagicNumber,Sell__TP);
          }
          
          if(Sell__SL>0)
          {
           ModifyTicketToSpecialSLM(Sell_Ticket,Sell__SL);
          }
         }
        }
       }
       Restarting_Lots_TF=false;       
      }
     }
    }    
    /////////////////////////////////
   }   
  }
 }

 return;
}

int BuyOrdersTotalMC(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" ") && (OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP || OTYYYYYYYYYYYY==OP_BUYLIMIT))
   c++;
  }
 }
 return(c);
}

int SellOrdersTotalMC(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" ") && (OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLSTOP || OTYYYYYYYYYYYY==OP_SELLLIMIT))
   c++;
  }
 }
 return(c);
}

void Set_HLine(string Sub_Name,datetime Sub_x1,double Sub_y1,color Sub_clr,long Sub_Style)
{
 int Sub_idx=0;
 if(StringFind(Sub_Name,"Sell",0)>=0 && StringFind(Sub_Name,"SL",0)>=0) Sub_y1=Sub_y1+Spread;
 ObjectDelete(0,Sub_Name);
 ObjectCreate(0,Sub_Name, OBJ_HLINE, Sub_idx, 0, 0);
 ObjectSet(Sub_Name, OBJPROP_TIME1, Sub_x1);
 ObjectSet(Sub_Name, OBJPROP_PRICE1, Sub_y1);
 ObjectSet(Sub_Name, OBJPROP_COLOR, Sub_clr);
 ObjectSet(Sub_Name, OBJPROP_STYLE, Sub_Style);
 ObjectSet(Sub_Name, OBJPROP_RAY, 0);
 return;
}

void CloseRealBuyOrdersM(int Sub_Magic)
{
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF CloseRealBuyOrdersM");
  if(Print_TF) Print("Market_Close_TF CloseRealBuyOrdersM");
  Print_TF=false;
  return;
 }
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   {
    CODO=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Bid_,Slippage);
    Get_Last_Error=GetLastError();
    Print("CloseRealBuyOrdersM "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

void CloseRealSellOrdersM(int Sub_Magic)
{
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF CloseRealSellOrdersM");
  if(Print_TF) Print("Market_Close_TF CloseRealSellOrdersM");
  Print_TF=false;
  return;
 }
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    CODO=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Ask_,Slippage);
    Get_Last_Error=GetLastError();
    Print("CloseRealSellOrdersM "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }   
  }
 }
 return;
}

double RealOrdersOPM(int Magic,string Sub_Comment)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && (OCOOOOOOOOOOOO=="" || OCOOOOOOOOOOOO==" " || StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0))
   c=OOPPPPPPPPPPPP;
  }
 }
 return(c);
}

double OrdersOPM(int Magic,string Sub_Comment)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0)
   c=OOPPPPPPPPPPPP;
  }
 }
 return(c);
}

double RealBuyOrdersOPM(int Magic)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   c=OOPPPPPPPPPPPP;
  }
 }
 return(c);
}

double RealSellOrdersOPM(int Magic)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   c=OOPPPPPPPPPPPP;
  }
 }
 return(c);
}

datetime BuyOOTM(int Sub_Magic)
{
 datetime Sub_Result=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   Sub_Result=OOTTTTTTTTTTTT;
  }
 }
 return(Sub_Result);
}

datetime SellOOTM(int Sub_Magic)
{
 datetime Sub_Result=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   Sub_Result=OOTTTTTTTTTTTT;
  }
 }
 return(Sub_Result);
}

int RealBuyOCOToIntegerM(int Sub_Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   c=(int) StringToInteger(OCOOOOOOOOOOOO);
  }
 }
 return(c);
}

int RealSellOCOToIntegerM(int Sub_Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   c=(int) StringToInteger(OCOOOOOOOOOOOO);
  }
 }
 return(c);
}

void SetText2(string name,string txt,int x,int y,string font,int size,color clr,long Visualization)
{
 int idx=0;
 ObjectCreate(0,name, OBJ_LABEL, idx, 0, 0);
 ObjectSetText(name, txt, size, font, clr);
 ObjectSet(name, OBJPROP_XDISTANCE, x);
 ObjectSet(name, OBJPROP_YDISTANCE, y);
 ObjectSetInteger(0,name,OBJPROP_TIMEFRAMES,Visualization);
 //ObjectNo++;
 //ObjectNamee[ObjectNo]=name;
}

void ModifySLOrdersT2(int Sub_Ticket,double Sub_SL2)
{
 if(OrderSelect(Sub_Ticket,SELECT_BY_TICKET,MODE_TRADES))
 {
  int      OMNNNNNNNNNNNN2=OrderMagicNumber();
  string   OSYYYYYYYYYYYY2=OrderSymbol();
  int      OTYYYYYYYYYYYY2=OrderType();
  double   OOPPPPPPPPPPPP2=OrderOpenPrice();
  double   OSLLLLLLLLLLLL2=OrderStopLoss();
  double   OTPPPPPPPPPPPP2=OrderTakeProfit();
  double   OLOOOOOOOOOOOO2=OrderLots();
  double   OCPPPPPPPPPPPP2=OrderClosePrice();
  int      OTIIIIIIIIIIII2=OrderTicket();
  datetime OOTTTTTTTTTTTT2=OrderOpenTime();
  double   OPRRRRRRRRRRRR2=OrderProfit();
  datetime OCTTTTTTTTTTTT2=OrderCloseTime();
  string   OCOOOOOOOOOOOO2=OrderComment();
  if(MathAbs(OSLLLLLLLLLLLL2-Sub_SL2)>=Point_)
  {
   OM_TF=false;
   for(iii_1=0;iii_1<Repeat;iii_1++)
   {
    OM_TF=OrderModify(OTIIIIIIIIIIII2,OOPPPPPPPPPPPP2,Sub_SL2,OTPPPPPPPPPPPP2,0,clrNONE);
    Get_Last_Error=GetLastError();
    Error_132();
    if(OM_TF) iii_1=Repeat*2;
   }
  }
 }
}

void ModifyTPOrdersT2(int Sub_Ticket,double Sub_TP2)
{
 if(OrderSelect(Sub_Ticket,SELECT_BY_TICKET,MODE_TRADES))
 {
  int      OMNNNNNNNNNNNN2=OrderMagicNumber();
  string   OSYYYYYYYYYYYY2=OrderSymbol();
  int      OTYYYYYYYYYYYY2=OrderType();
  double   OOPPPPPPPPPPPP2=OrderOpenPrice();
  double   OSLLLLLLLLLLLL2=OrderStopLoss();
  double   OTPPPPPPPPPPPP2=OrderTakeProfit();
  double   OLOOOOOOOOOOOO2=OrderLots();
  double   OCPPPPPPPPPPPP2=OrderClosePrice();
  int      OTIIIIIIIIIIII2=OrderTicket();
  datetime OOTTTTTTTTTTTT2=OrderOpenTime();
  double   OPRRRRRRRRRRRR2=OrderProfit();
  datetime OCTTTTTTTTTTTT2=OrderCloseTime();
  string   OCOOOOOOOOOOOO2=OrderComment();
  if(MathAbs(OTPPPPPPPPPPPP2-Sub_TP2)>=Point_)
  {
   OM_TF=false;
   for(iii_1=0;iii_1<Repeat;iii_1++)
   {
    OM_TF=OrderModify(OTIIIIIIIIIIII2,OOPPPPPPPPPPPP2,OSLLLLLLLLLLLL2,Sub_TP2,0,clrNONE);
    Get_Last_Error=GetLastError();
    Error_132();
    if(OM_TF) iii_1=Repeat*2;
   }
  }
 }
}

double RealBuyOLOM(int Magic)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   c=OLOOOOOOOOOOOO;
  }
 }
 return(c);
}

double RealSellOLOM(int Magic)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   c=OLOOOOOOOOOOOO;
  }
 }
 return(c);
}

void OpenBuyM(double Sub_Lots,int BuyType,double BuyPrice)
{
 if(Stop_Working_134_TF) 
 {
  Comment("Stop_Working_134_TF Buy");
  if(Print_TF) Print("Stop_Working_134_TF Buy");
  Print_TF=false;
  return;
 }
  
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF Buy");
  if(Print_TF) Print("Market_Close_TF Buy");
  Print_TF=false;
  return;
 }
 
 RefreshRates();
 Sub_Lots=NormalizeDouble(Sub_Lots,Lot_D);
 if(Sub_Lots>MISMMXL) Sub_Lots=MISMMXL;
 if(Sub_Lots<MarketInfo(Symbol_Full,MODE_MINLOT)) Sub_Lots=MarketInfo(Symbol_Full,MODE_MINLOT);
 Buy_Ticket=0;
 Get_Last_Error=(-9);
 if(BuyType==OP_BUYSTOP && NormalizeDouble(BuyPrice,Digits)<=Ask)
 {
  BuyType=OP_BUY;
 }
 else
 if(BuyType==OP_BUYLIMIT && NormalizeDouble(BuyPrice,Digits)>=Ask)
 {
  BuyType=OP_BUY;
 }

 if(BuyType==OP_BUY)
 {
  BuyPrice=Ask;
 }
 if(!CheckMoneyForTrade2(Symbol_Full,Sub_Lots,OP_BUY))
 {
  Comment("Not enough money for Open Order ");
  return;
 }
 
 Buy_Ticket=OrderSend(Symbol_Full,BuyType,Sub_Lots,NormalizeDouble(BuyPrice,Digits),Slippage,0,0,Frame_MagicComment2,Frame_MagicNumber,0,Arrow_Buy_Color);
 Get_Last_Error=GetLastError();
 Ask_=MarketInfo(Symbol_Full,MODE_ASK);
 Bid_=MarketInfo(Symbol_Full,MODE_BID);
 if(Buy_Ticket<1)
 {
  Print("Buy Failed "+Symbol_Full+" # "+IntegerToString(BuyType)+" # "+DoubleToStr(Sub_Lots,Lot_D)+" # "+DoubleToStr(NormalizeDouble(BuyPrice,Digits),Digits)+" # "+DoubleToStr(Ask_,Digits)+" # "+IntegerToString(Get_Last_Error));
  Print("BF "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
  TimeToStr(TimeCurrent())
  +IntegerToString(Get_Last_Error));    
  if(Get_Last_Error==134) 
  {
   Stop_Working_134_TF=true;
   Capital=AccountBalance();
   Comment("Get_Last_Error==134 Buy");
   return;
  }
  Error_132();
  if(Get_Last_Error==132 || Get_Last_Error<(-8)) 
  {
   Stopping_Bid_=Bid_;
   Comment("Stopping_Bid_ Buy");
   return;
  }
  if(Get_Last_Error==148) Print("Max Orders="+IntegerToString(OrdersTotal()));
  if(Get_Last_Error==129 || Get_Last_Error==132 || Get_Last_Error==134 || Get_Last_Error==138 || Get_Last_Error==4051 || Get_Last_Error==4058 || Get_Last_Error==4200 || Get_Last_Error==4201 || Get_Last_Error==4202 || Get_Last_Error==4203 || Get_Last_Error==4204 || Get_Last_Error==4205 || Get_Last_Error==4207) 
  {
   Comment("Muti Get_Last_Error Buy");
   return;
  }
  if(Wrong_Alert) Alert(WindowExpertName()," ",Symbol_Full," ","you can not Buy A, the error number is ",Get_Last_Error);
 }
 else
 {
  Print("Open Buy "+IntegerToString(Buy_Ticket)+" # "+Frame_MagicComment2);
  Get_Last_Error=0;
 }
 return;
}

void OpenSellM(double Sub_Lots,int SellType,double SellPrice)
{
 if(Stop_Working_134_TF) 
 {
  Comment("Stop_Working_134_TF Sell");
  if(Print_TF) Print("Stop_Working_134_TF Sell");
  Print_TF=false;
  return;
 }
  
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF Sell");
  if(Print_TF) Print("Market_Close_TF Sell");
  Print_TF=false;
  return;
 }

 RefreshRates();
 Sub_Lots=NormalizeDouble(Sub_Lots,Lot_D);
 if(Sub_Lots>MISMMXL) Sub_Lots=MISMMXL;
 if(Sub_Lots<MarketInfo(Symbol_Full,MODE_MINLOT)) Sub_Lots=MarketInfo(Symbol_Full,MODE_MINLOT);
 Sell_Ticket=0;
 Get_Last_Error=(-9);
 if(SellType==OP_SELLSTOP && NormalizeDouble(SellPrice,Digits)>=Bid)
 {
  SellType=OP_SELL;
 }
 else
 if(SellType==OP_SELLLIMIT && NormalizeDouble(SellPrice,Digits)<=Bid)
 {
  SellType=OP_SELL;
 }

 if(SellType==OP_SELL)
 {
  SellPrice=Bid;
 }

 if(!CheckMoneyForTrade2(Symbol_Full,Sub_Lots,OP_SELL))
 {
  Comment("Not enough money for Open Order ");
  return;
 }

 Sell_Ticket=OrderSend(Symbol_Full,SellType,Sub_Lots,NormalizeDouble(SellPrice,Digits),Slippage,0,0,Frame_MagicComment2,Frame_MagicNumber,0,Arrow_Sell_Color);
 Get_Last_Error=GetLastError();
 Ask_=MarketInfo(Symbol_Full,MODE_ASK);
 Bid_=MarketInfo(Symbol_Full,MODE_BID);
 if(Sell_Ticket<1)
 {
  Print("Sell Failed "+Symbol_Full+" # "+IntegerToString(SellType)+" # "+DoubleToStr(Sub_Lots,Lot_D)+" # "+DoubleToStr(NormalizeDouble(SellPrice,Digits),Digits)+" # "+DoubleToStr(Bid_,Digits)+" # "+IntegerToString(Get_Last_Error));
  Print("SF "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
  TimeToStr(TimeCurrent())
  +IntegerToString(Get_Last_Error));    
  if(Get_Last_Error==134) 
  {
   Comment("Get_Last_Error==134 Sell");
   Stop_Working_134_TF=true;
   Capital=AccountBalance();
   return;
  }
  Error_132();
  if(Get_Last_Error==132 || Get_Last_Error<(-8)) 
  {
   Stopping_Bid_=Bid_;
   Comment("Stopping_Bid_ Sell");
   return;
  }
  if(Get_Last_Error==148) Print("Max Orders="+IntegerToString(OrdersTotal()));
  if(Get_Last_Error==129 || Get_Last_Error==132 || Get_Last_Error==134 || Get_Last_Error==138 || Get_Last_Error==4051 || Get_Last_Error==4058 || Get_Last_Error==4200 || Get_Last_Error==4201 || Get_Last_Error==4202 || Get_Last_Error==4203 || Get_Last_Error==4204 || Get_Last_Error==4205 || Get_Last_Error==4207)
  {
   Comment("Muti Get_Last_Error Sell");
   return;
  }
  if(Wrong_Alert) Alert(WindowExpertName()," ",Symbol_Full," ","you can not Sell A, the error number is ",Get_Last_Error);
 }
 else
 {
  Print("Open Sell "+IntegerToString(Sell_Ticket)+" # "+Frame_MagicComment2);
  Get_Last_Error=0;
 }
 return;
}

int RealOrdersTotalM(int Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1)
   c++;
  }
 }
 return(c);
}

int RealBuyOrdersTotalM(int Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   c++;
  }
 }
 return(c);
}

int RealSellOrdersTotalM(int Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   c++;
  }
 }
 return(c);
}

int OrdersTotalM(int Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full)
   c++;
  }
 }
 return(c);
}

double LowBuySpecialOOPM(int Magic)
{
 double c=EMPTY_VALUE;
 int total=OrdersTotal();
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full)
   {
    if(OTYYYYYYYYYYYY==OP_BUY && c>OOPPPPPPPPPPPP) c=OOPPPPPPPPPPPP;
   }
  }
 }
 return(c);
}

double LowRealSellOOPM(int Magic)
{
 double c=EMPTY_VALUE;
 int total=OrdersTotal();
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL && c>OOPPPPPPPPPPPP)
   {
    c=OOPPPPPPPPPPPP;
   }
  }
 }
 return(c);
}

double HighRealBuyOOPM(int Magic)
{
 double c=0.0;
 int total=OrdersTotal();
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY && c<OOPPPPPPPPPPPP)
   {
    c=OOPPPPPPPPPPPP;
   }
  }
 }
 return(c);
}

double HighSellSpecialOOPM(int Magic)
{
 double c=0.0;
 int total=OrdersTotal();
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full)
   {
    if(OTYYYYYYYYYYYY==OP_SELL && c<OOPPPPPPPPPPPP) c=OOPPPPPPPPPPPP;
   }
  }
 }
 return(c);
}

void DeletePendingOrdersM(int Sub_Magic)
{
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF Sell");
  if(Print_TF) Print("Market_Close_TF Sell");
  Print_TF=false;
  return;
 }
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY>1)
   {
    O_D_TF=OrderDelete(OTIIIIIIIIIIII);
    Get_Last_Error=GetLastError();
    Print("DBPOM "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

void DeleteBuyPendingOrdersM(int Sub_Magic,string Sub_Comment)
{
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF Sell");
  if(Print_TF) Print("Market_Close_TF Sell");
  Print_TF=false;
  return;
 }
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && (OTYYYYYYYYYYYY==OP_BUYSTOP || OTYYYYYYYYYYYY==OP_BUYLIMIT) && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   {
    O_D_TF=OrderDelete(OTIIIIIIIIIIII);
    Get_Last_Error=GetLastError();
    Print("DBPOM "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

void DeleteSellPendingOrdersM(int Sub_Magic,string Sub_Comment)
{
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF Sell");
  if(Print_TF) Print("Market_Close_TF Sell");
  Print_TF=false;
  return;
 }
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && (OTYYYYYYYYYYYY==OP_SELLSTOP || OTYYYYYYYYYYYY==OP_SELLLIMIT) && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   {
    O_D_TF=OrderDelete(OTIIIIIIIIIIII);
    Get_Last_Error=GetLastError();
    Print("DSPOM "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())
    +IntegerToString(GetLastError()));    
    Error_132();
   }    
  }
 }
 return;
}

double OrderOPByTicket(int Sub_Ticket)
{
 double Sub_Result=0;
 if(OrderSelect(Sub_Ticket,SELECT_BY_TICKET,MODE_TRADES))
 {
  Sub_Result=OrderOpenPrice();
 }
 return(Sub_Result);
}

double SpecialBuyAvgOfOpenPriceM(int Magic)
{
 double c=0.0,LLL=0.0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP))
   {
    LLL=LLL+OLOOOOOOOOOOOO;
    if(OTYYYYYYYYYYYY==OP_BUY) c=c+(OLOOOOOOOOOOOO*OOPPPPPPPPPPPP);
   }
  }
 }
 if(LLL!=0) return(NormalizeDouble(c/LLL,Digits)); else return(0);
}

double SpecialSellAvgOfOpenPriceM(int Magic)
{
 double c=0.0,LLL=0.0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT))
   {
    LLL=LLL+OLOOOOOOOOOOOO;
    if(OTYYYYYYYYYYYY==OP_SELL) c=c+(OLOOOOOOOOOOOO*OOPPPPPPPPPPPP);
   }
  }
 }
 if(LLL!=0) return(NormalizeDouble(c/LLL,Digits)); else return(0);
}

double RealBuyAvgOfOpenPriceM(int Magic)
{
 double c=0.0,LLL=0.0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   {
    OLOOOOOOOOOOOO=(OLOOOOOOOOOOOO*(MathPow(Double_Vaue,(Start_Order_From-1))));
    LLL=LLL+OLOOOOOOOOOOOO;
    c=c+(OLOOOOOOOOOOOO*OOPPPPPPPPPPPP);
   }
  }
 }
 LLL=LLL+Pending_Buy_Lots;
 c=c+Pending_Buy_Avg;
 if(LLL!=0) return(NormalizeDouble(c/LLL,Digits)); else return(0);
}

double RealSellAvgOfOpenPriceM(int Magic)
{
 double c=0.0,LLL=0.0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   {
    OLOOOOOOOOOOOO=(OLOOOOOOOOOOOO*(MathPow(Double_Vaue,(Start_Order_From-1))));
    LLL=LLL+OLOOOOOOOOOOOO;
    c=c+(OLOOOOOOOOOOOO*OOPPPPPPPPPPPP);
   }
  }
 }
 LLL=LLL+Pending_Sell_Lots;
 c=c+Pending_Sell_Avg;
 if(LLL!=0) return(NormalizeDouble(c/LLL,Digits)); else return(0);
}

int OrdersTotalC(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OCOOOOOOOOOOOO==Sub_Comment)
   c++;
  }
 }
 return(c);
}

int OrdersTotalContainC(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0)
   c++;
  }
 }
 return(c);
}

int RealOrdersTotalC(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OCOOOOOOOOOOOO==Sub_Comment && OTYYYYYYYYYYYY<=1)
   c++;
  }
 }
 return(c);
}

int SpecialBuyOrdersTotalC(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OCOOOOOOOOOOOO==Sub_Comment &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP))
   c++;
  }
 }
 return(c);
}

int SpecialSellOrdersTotalC(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OCOOOOOOOOOOOO==Sub_Comment &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT))
   c++;
  }
 }
 return(c);
}

bool   LastRealBuyOrdersIsTPCH(int Sub_Magic,string Sub_Comment)
{
 bool   c=false;
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 && OTYYYYYYYYYYYY==OP_BUY && Sub_Time<OCTTTTTTTTTTTT)
   {
    c=false;
    Sub_Time=OCTTTTTTTTTTTT;
    if(StringFind(OCOOOOOOOOOOOO,"[tp]",0)>=0) c=true;
   }
  }
 }
 return(c);
}

bool   LastRealSellOrdersIsTPCH(int Sub_Magic,string Sub_Comment)
{
 bool   c=false;
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 && OTYYYYYYYYYYYY==OP_SELL && Sub_Time<OCTTTTTTTTTTTT)
   {
    c=false;
    Sub_Time=OCTTTTTTTTTTTT;
    if(StringFind(OCOOOOOOOOOOOO,"[tp]",0)>=0) c=true;
   }
  }
 }
 return(c);
}

double SpecialBuyOrdersSumLotsM(int Temp_Magic,string Sub_Comment)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal();
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP) && OCOOOOOOOOOOOO==Sub_Comment)
   {
    Temp_Result=(Temp_Result+OLOOOOOOOOOOOO);
   }
  }
 }
 return(Temp_Result);
}

double SpecialSellOrdersSumLotsM(int Temp_Magic,string Sub_Comment)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal();
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT) && OCOOOOOOOOOOOO==Sub_Comment)
   {
    Temp_Result=(Temp_Result+OLOOOOOOOOOOOO);
   }
  }
 }
 return(Temp_Result);
}

double RealProfitByDollarsM(int Magic)
{
 double P=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1)
   {
    P=P+OPRRRRRRRRRRRR;
   }
  }
 }
 return(P);
}

double RealProfitByDollarsMH(int Magic,datetime Sub_Time,string Sub_Pair)
{
 double P=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if((OMNNNNNNNNNNNN==Magic || Magic<0) && (OSYYYYYYYYYYYY==Sub_Pair || Sub_Pair==" " || Sub_Pair=="") && OTYYYYYYYYYYYY<=1 && OCTTTTTTTTTTTT>Sub_Time)
   {
    P=P+OPRRRRRRRRRRRR;
   }
  }
 }
 return(P);
}

double RealBuyProfitByDollarsM(int Magic)
{
 double P=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   {
    P=P+OPRRRRRRRRRRRR;
   }
  }
 }
 return(P);
}

double RealSellProfitByDollarsM(int Magic)
{
 double P=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   {
    P=P+OPRRRRRRRRRRRR;
   }
  }
 }
 return(P);
}

datetime LastSpecialBuyOCTMH(int Sub_Magic)
{
 int total=OrdersHistoryTotal();
 datetime Sub_Result=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP) && Sub_Result<OCTTTTTTTTTTTT)
   {
    Sub_Result=OCTTTTTTTTTTTT;
   }
  }
 }
 return(Sub_Result);
}

datetime LastSpecialSellOCTMH(int Sub_Magic)
{
 int total=OrdersHistoryTotal();
 datetime Sub_Result=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT) && Sub_Result<OCTTTTTTTTTTTT)
   {
    Sub_Result=OCTTTTTTTTTTTT;
   }
  }
 }
 return(Sub_Result);
}

double LastRealBuyOPRM(int Temp_Magic)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY && Temp_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OPRRRRRRRRRRRR;
   }
  }
 }
 return(Temp_Result);
}

double LastRealSellOPRM(int Temp_Magic)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL && Temp_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OPRRRRRRRRRRRR;
   }
  }
 }
 return(Temp_Result);
}

double RealTotalLotsM(int Magic)
{
 double Sub_Result=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   
   
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1)
   {
    Sub_Result=(Sub_Result+OLOOOOOOOOOOOO);
   }
  }
 }
 return(Sub_Result);
}

double SpecialBuyTotalLotsM(int Magic,int Sub_Ticket)
{
 double Sub_Result=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP) && OTIIIIIIIIIIII>Sub_Ticket)
   {
    Sub_Result=(Sub_Result+OLOOOOOOOOOOOO);
   }
  }
 }
 return(NormalizeDouble(Sub_Result,Lot_D));
}

double SpecialSellTotalLotsM(int Magic,int Sub_Ticket)
{
 double Sub_Result=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT) && OTIIIIIIIIIIII>Sub_Ticket)
   {
    Sub_Result=(Sub_Result+OLOOOOOOOOOOOO);
   }
  }
 }
 return(NormalizeDouble(Sub_Result,Lot_D));
}

string LastSpecialBuyOCOM(int Temp_Magic)
{
 string Temp_Result="";
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP) && Temp_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OCOOOOOOOOOOOO;
   }
  }
 }
 return(Temp_Result);
}

string LastSpecialSellOCOM(int Temp_Magic)
{
 string Temp_Result="";
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT) && Temp_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OCOOOOOOOOOOOO;
   }
  }
 }
 return(Temp_Result);
}

void ModifyRealBuyOrdersToSpecialTPM(int Magic,double S_TP)
{ 
 for(int i=0; i<OrdersTotal(); i++) 
 { 
  if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
  { 
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   if(OSYYYYYYYYYYYY==Symbol_Full && OMNNNNNNNNNNNN==Magic && OTYYYYYYYYYYYY==OP_BUY && MathAbs(OTPPPPPPPPPPPP-S_TP)>=Point_)
   {
    ODOC=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,OSLLLLLLLLLLLL,S_TP,0,CLR_NONE); 
    Get_Last_Error=GetLastError();
    Error_132();
    if(!ODOC) Print("ODOC22 "+IntegerToString(OTIIIIIIIIIIII)+" # "+DoubleToStr(OOPPPPPPPPPPPP,Digits)+" # "+DoubleToStr(OSLLLLLLLLLLLL,Digits)+" # "+DoubleToStr(OTPPPPPPPPPPPP,Digits)+" # "+DoubleToStr(S_TP,Digits));
   } 
  }
 } 
} 

void ModifyRealSellOrdersToSpecialTPM(int Magic,double S_TP)
{ 
 for(int i=0; i<OrdersTotal(); i++) 
 { 
  if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
  { 
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   
   if(OSYYYYYYYYYYYY==Symbol_Full && OMNNNNNNNNNNNN==Magic && OTYYYYYYYYYYYY==OP_SELL && MathAbs(OTPPPPPPPPPPPP-S_TP)>=Point_)
   { 
    ODOC=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,OSLLLLLLLLLLLL,S_TP,0,CLR_NONE); 
    Get_Last_Error=GetLastError();
    Error_132();
    if(!ODOC) Print("ODOC55 "+IntegerToString(OTIIIIIIIIIIII)+" # "+DoubleToStr(OOPPPPPPPPPPPP,Digits)+" # "+DoubleToStr(OSLLLLLLLLLLLL,Digits)+" # "+DoubleToStr(S_TP,Digits));
   } 
  }
 } 
} 

void ModifyRealBuyOrdersToSpecialSLM(int Sub_Magic,double Sub_SL)
{ 
 for(int i=0; i<OrdersTotal(); i++) 
 { 
  if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
  { 
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   if(OSYYYYYYYYYYYY==Symbol_Full && OMNNNNNNNNNNNN==Sub_Magic && OTYYYYYYYYYYYY==OP_BUY && MathAbs(OSLLLLLLLLLLLL-Sub_SL)>=Point_)
   { 
    ODOC=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,Sub_SL,OTPPPPPPPPPPPP,0,CLR_NONE); 
    Get_Last_Error=GetLastError();
    Error_132();
    if(!ODOC) Print("ODOC Buy SL "+IntegerToString(OTIIIIIIIIIIII)+" # "+DoubleToStr(OOPPPPPPPPPPPP,Digits)+" # "+DoubleToStr(Sub_SL,Digits)+" # "+DoubleToStr(OTPPPPPPPPPPPP,Digits));
   } 
  }
 } 
} 

void ModifyRealSellOrdersToSpecialSLM(int Sub_Magic,double Sub_SL)
{ 
 for(int i=0; i<OrdersTotal(); i++) 
 { 
  if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
  { 
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   if(OSYYYYYYYYYYYY==Symbol_Full && OMNNNNNNNNNNNN==Sub_Magic && OTYYYYYYYYYYYY==OP_SELL && MathAbs(OSLLLLLLLLLLLL-Sub_SL)>=Point_)
   { 
    ODOC=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,Sub_SL,OTPPPPPPPPPPPP,0,CLR_NONE); 
    Get_Last_Error=GetLastError();
    Error_132();
    if(!ODOC) Print("ODOC Sell SL "+IntegerToString(OTIIIIIIIIIIII)+" # "+DoubleToStr(OOPPPPPPPPPPPP,Digits)+" # "+DoubleToStr(Sub_SL,Digits)+" # "+DoubleToStr(OTPPPPPPPPPPPP,Digits));
   } 
  }
 } 
} 

int LastSpecialBuyOrdersTicketM(int Magic,long BigTicket)
{
 int Sub_Result=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && Sub_Result<OTIIIIIIIIIIII &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP) && OTIIIIIIIIIIII<BigTicket)
   {
    Sub_Result=OTIIIIIIIIIIII;
   }
  }
 }
 return(Sub_Result);
}

int LastSpecialSellOrdersTicketM(int Magic,long BigTicket)
{
 int Sub_Result=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && Sub_Result<OTIIIIIIIIIIII &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT) && OTIIIIIIIIIIII<BigTicket)
   {
    Sub_Result=OTIIIIIIIIIIII;
   }
  }
 }
 return(Sub_Result);
}

datetime LastSpecialBuyOOTM(int Sub_Magic)
{
 int total=OrdersTotal();
 datetime Sub_Result=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP) && Sub_Result<OOTTTTTTTTTTTT)
   {
    Sub_Result=OOTTTTTTTTTTTT;
   }
  }
 }
 return(Sub_Result);
}

datetime LastSpecialSellOOTM(int Sub_Magic)
{
 int total=OrdersTotal();
 datetime Sub_Result=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT) && Sub_Result<OOTTTTTTTTTTTT)
   {
    Sub_Result=OOTTTTTTTTTTTT;
   }
  }
 }
 return(Sub_Result);
}

int BuyStopOrdersTotalM(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUYSTOP && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   c++;
  }
 }
 return(c);
}

int SellStopOrdersTotalM(int Sub_Magic,string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELLSTOP && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   c++;
  }
 }
 return(c);
}

int BuyLimitOrdersTotalM(int Sub_Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUYLIMIT)
   c++;
  }
 }
 return(c);
}

int SellLimitOrdersTotalM(int Sub_Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELLLIMIT)
   c++;
  }
 }
 return(c);
}

bool   LastRealBuyOrdersIsTPMH(int Sub_Magic)
{
 bool   c=false;
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY && Sub_Time<OCTTTTTTTTTTTT)
   {
    c=false;
    Sub_Time=OCTTTTTTTTTTTT;
    if(StringFind(OCOOOOOOOOOOOO,"[tp]",0)>=0) c=true;
   }
  }
 }
 return(c);
}

bool   LastRealSellOrdersIsTPMH(int Sub_Magic)
{
 bool   c=false;
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL && Sub_Time<OCTTTTTTTTTTTT)
   {
    c=false;
    Sub_Time=OCTTTTTTTTTTTT;
    if(StringFind(OCOOOOOOOOOOOO,"[tp]",0)>=0) c=true;
   }
  }
 }
 return(c);
}

int LastRealBuyOrdersTicketMH(int Magic)
{
 int Sub_Result=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && Sub_Result<OTIIIIIIIIIIII && OTYYYYYYYYYYYY==OP_BUY)
   {
    Sub_Result=OTIIIIIIIIIIII;
   }
  }
 }
 return(Sub_Result);
}

int LastRealSellOrdersTicketMH(int Magic)
{
 int Sub_Result=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && Sub_Result<OTIIIIIIIIIIII && OTYYYYYYYYYYYY==OP_SELL)
   {
    Sub_Result=OTIIIIIIIIIIII;
   }
  }
 }
 return(Sub_Result);
}

void Error_132()
{
 if(Get_Last_Error==132 || Get_Last_Error<(-8)) 
 {
  Stopping_Bid_=Bid_;
  Print(Stopping_Bid_);
  Market_Close_TF=true;
  return;
 }
 return;
}

double LastBuyOLOM(int Temp_Magic)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Ticket<OTIIIIIIIIIIII &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYLIMIT || OTYYYYYYYYYYYY==OP_BUYSTOP))
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OLOOOOOOOOOOOO;
   }
  }
 }
 return(Temp_Result);
}

double LastSellOLOM(int Temp_Magic)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Ticket<OTIIIIIIIIIIII &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT || OTYYYYYYYYYYYY==OP_SELLSTOP))
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OLOOOOOOOOOOOO;
   }
  }
 }
 return(Temp_Result);
}

void Set_HLine_Invisable(string Sub_Name,double Sub_y1)
{
 int Sub_idx=0;
 ObjectDelete(0,Sub_Name);
 ObjectCreate(0,Sub_Name, OBJ_HLINE, Sub_idx, 0, 0);
 ObjectSet(Sub_Name, OBJPROP_TIME1, Time[0]);
 ObjectSet(Sub_Name, OBJPROP_PRICE1, Sub_y1);
 ObjectSet(Sub_Name, OBJPROP_COLOR, clrNONE);
 ObjectSet(Sub_Name, OBJPROP_BACK,true);
 ObjectSetString(0,Sub_Name,OBJPROP_TEXT,(string) Time[0]); 
 return;
}

bool   FindT(int Sub_Ticket)
{
 bool   Sub_Result=false;
 int Sub_Total=OrdersTotal();
 
 for(int Temp_cnt=0;Temp_cnt<Sub_Total;Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OTIIIIIIIIIIII==Sub_Ticket)
   {
    Sub_Result=true;
    break;
   }
  }
 }
 return(Sub_Result);
}

double OrderLOByTicket(int Sub_Ticket)
{
 double Sub_Result=0;
 if(OrderSelect(Sub_Ticket,SELECT_BY_TICKET,MODE_TRADES))
 {
  Sub_Result=OrderLots();
 }
 return(Sub_Result);
}

double SumBuyOLOC(string Temp_Magic)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OCOOOOOOOOOOOO==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYLIMIT || OTYYYYYYYYYYYY==OP_BUYSTOP))
   {
    Temp_Result=(Temp_Result+OLOOOOOOOOOOOO);
   }
  }
 }
 return(Temp_Result);
}

double SumSellOLOC(string Temp_Magic)
{
 double Temp_Result=0;
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OCOOOOOOOOOOOO==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full &&(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLLIMIT || OTYYYYYYYYYYYY==OP_SELLSTOP))
   {
    Temp_Result=(Temp_Result+OLOOOOOOOOOOOO);
   }
  }
 }
 return(Temp_Result);
}

ushort SetSymbols(string Sub_Symbols_List)
{
 Sub_Symbols_List+=",";
 short Sub_Beg=WRONG_VALUE, Sub_End=1, Sub_Len=(short)StringLen(Sub_Symbols_List);
 string Sub_Sy="";
 //Print(__FUNCTION__," > ",symbols_list); // Посмотрим символы в строке
 while(Sub_Beg<Sub_Len) 
 {
  Sub_Beg++;
  Sub_End=(short)StringFind(Sub_Symbols_List,",",Sub_Beg);
  if(Sub_End==Sub_Beg || Sub_End<0) continue;
  Sub_Sy=StringSubstr(Sub_Symbols_List,Sub_Beg,Sub_End-Sub_Beg);
  if(CheckSymbol(Sub_Sy,Symbol_Array) || !IsPresentSymbol(Sub_Sy)) continue;
  Sub_Sz=(ushort)ArraySize(Symbol_Array);
  ArrayResize(Symbol_Array,Sub_Sz+1);
  ArrayResize(Symbol_Time_Array,Sub_Sz+1);
  ArrayResize(Symbol_Price_Array,Sub_Sz+1);
  ArrayResize(Symbol_Equity_Array,Sub_Sz+1);
  ArrayResize(Symbol_Work_TF_Array,Sub_Sz+1);
  for(iii_4=0; iii_4<(Sub_Sz+1); iii_4++)
  {
   Symbol_Work_TF_Array[iii_4]=true;
   Symbol_Equity_Array[iii_4]=AccountEquity();
  }
  
  Symbol_Array[Sub_Sz]=Sub_Sy;
  Print((string) Sub_Sz+" # "+Symbol_Array[Sub_Sz]);
  //--- Посмотрим корректность найденного символа и записи его в массив
  //Print("beg=",IntegerToString(beg,2,'0'),", end=",IntegerToString(end,2,'0'),", sy=|",sy,"|",", in array[",sz,"]=",array[sz]);
 }
 Ask_=MarketInfo(Symbol_Full,MODE_ASK);
 Bid_=MarketInfo(Symbol_Full,MODE_BID);      
 return((ushort)ArraySize(Symbol_Array));
}

int SymbolOrdersTotal()
{
 int c=0;
 int total=OrdersTotal();
 
 for (int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
  
   if(OSYYYYYYYYYYYY==Symbol_Full)
   {
    c++;
   }
  }
 }
 return(c);
}

bool CheckSymbol(string Sub_Symbol_Name,string &Sub_Array[])
{
 for(short Sub_i=0; Sub_i<ArraySize(Sub_Array); Sub_i++) 
 {
  if(Sub_Array[Sub_i]==Sub_Symbol_Name) return(true);
 }
 return(false);
}
//+------------------------------------------------------------------+
bool IsPresentSymbol(string Sub_Symbol_Name)
{
 for(ushort Sub_i=0; Sub_i<SymbolsTotal(false); Sub_i++)
 {
  if(SymbolName(Sub_i,false)==Sub_Symbol_Name) 
  {
   SymbolSelect(Sub_Symbol_Name,true);
   return(true);
  }
 }
 return(false);
}

void CloseSymbolRealOrders()
{
 int total=OrdersTotal();
 for (int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OTYYYYYYYYYYYY==OP_BUY ) ODOC=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,MarketInfo(OSYYYYYYYYYYYY,MODE_BID),Slippage);
   if(OTYYYYYYYYYYYY==OP_SELL) ODOC=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,MarketInfo(OSYYYYYYYYYYYY,MODE_ASK),Slippage);
  }
 }
 return;
}  

void DeleteSymbolPendingOrders()
{
 int total=OrdersTotal();
 for (int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OTYYYYYYYYYYYY>1) ODOC=OrderDelete(OTIIIIIIIIIIII,clrNONE);
  }
 }
 return;
}  

int LastOTYM(int Temp_Magic)
{
 int Temp_Result=(-9);
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OTYYYYYYYYYYYY;
   }
  }
 }
 return(Temp_Result);
}

int FirstOTYM(int Temp_Magic)
{
 int Temp_Result=(-9);
 int Temp_Total=OrdersTotal(),Temp_Ticket=EMPTY_VALUE;
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Ticket>OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OTYYYYYYYYYYYY;
   }
  }
 }
 return(Temp_Result);
}

double FirstOOPM(int Temp_Magic,int Sub_Ticket_1)
{
 double Temp_Result=0.0;
 int Temp_Total=OrdersTotal(),Temp_Ticket_2=EMPTY_VALUE;
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Ticket_2>OTIIIIIIIIIIII && Sub_Ticket_1<OTIIIIIIIIIIII)
   {
    Temp_Ticket_2=OTIIIIIIIIIIII;
    Temp_Result=OOPPPPPPPPPPPP;
   }
  }
 }
 return(Temp_Result);
}

int FirstOTIM(int Temp_Magic,int Sub_Ticket)
{
 int Temp_Result=EMPTY_VALUE;
 int Temp_Total=OrdersTotal();
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Result>OTIIIIIIIIIIII && Sub_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Result=OTIIIIIIIIIIII;
   }
  }
 }
 return(Temp_Result);
}

double LastOOPM(int Temp_Magic)
{
 double Temp_Result=0.0;
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OOPPPPPPPPPPPP;
   }
  }
 }
 return(Temp_Result);
}

double SumOTPOSLM(int Temp_Magic)
{
 double Temp_Result=0.0;
 int Temp_Total=OrdersTotal();
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full)
   {
    Temp_Result=(Temp_Result+OSLLLLLLLLLLLL+OTPPPPPPPPPPPP);
   }
  }
 }
 return(Temp_Result);
}

void CloseRealOrdersM(int Sub_Magic)
{
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF Sell");
  if(Print_TF) Print("Market_Close_TF Sell");
  Print_TF=false;
  return;
 }
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1)
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    if(OTYYYYYYYYYYYY==OP_BUY) CODO=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Bid_,Slippage);
    else
    if(OTYYYYYYYYYYYY==OP_SELL) CODO=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Ask_,Slippage);
    
    Get_Last_Error=GetLastError();
    Print("CRBOM C "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

double OrdersOPT(int Sub_Ticket)
{
 double Sub_Result=0.0;

 if(OrderSelect(Sub_Ticket,SELECT_BY_TICKET,MODE_TRADES))
 {
  Sub_Result=OrderOpenPrice();
 }
 return(Sub_Result);
}

bool   LastRealOrdersIsTPCH(int Sub_Magic,string Sub_Comment)
{
 bool   c=false;
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 && OTYYYYYYYYYYYY<=1 && Sub_Time<OCTTTTTTTTTTTT)
   {
    c=false;
    Sub_Time=OCTTTTTTTTTTTT;
    if(StringFind(OCOOOOOOOOOOOO,"[tp]",0)>=0) c=true;
   }
  }
 }
 return(c);
}

bool LastRealOrdersIsSLMH(int Sub_Magic)
{
 bool   c=false;
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && Sub_Time<OCTTTTTTTTTTTT)
   {
    c=false;
    Sub_Time=OCTTTTTTTTTTTT;
    if(StringFind(OCOOOOOOOOOOOO,"[sl]",0)>=0) c=true;
   }
  }
 }
 return(c);
}

int LastRealOrdersTypeMH(int Sub_Magic)
{
 int c=(-9);
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && Sub_Time<OCTTTTTTTTTTTT)
   {
    Sub_Time=OCTTTTTTTTTTTT;
    c=OTYYYYYYYYYYYY;
   }
  }
 }
 return(c);
}

int RealOrdersCH(int Sub_Magic,string Sub_Comment,datetime Sub_Time)
{
 int c=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 && OTYYYYYYYYYYYY<=1 && OCTTTTTTTTTTTT>Sub_Time)
   {
    c++;
   }
  }
 }
 return(c);
}

int LastRealOTYCH(int Sub_Magic,string Sub_Comment,datetime Sub_Time)
{
 int c=0;
 int total=OrdersHistoryTotal(),Sub_Ticket=(-99);
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 && OTYYYYYYYYYYYY<=1 && OCTTTTTTTTTTTT>Sub_Time && Sub_Ticket<OTIIIIIIIIIIII)
   {
    Sub_Ticket=OTIIIIIIIIIIII;
    c=OTYYYYYYYYYYYY;
   }
  }
 }
 return(c);
}

datetime OrdersLastOCTMH(int Sub_Magic)
{
 datetime c=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && c<OCTTTTTTTTTTTT)
   {
    c=OCTTTTTTTTTTTT;
   }
  }
 }
 return(c);
}

double LastRealOOPCH(int Sub_Magic,string Sub_Comment)
{
 double c=0.0;
 int total=OrdersHistoryTotal();
 datetime Sub_Time=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 && OTYYYYYYYYYYYY<=1 && Sub_Time<OCTTTTTTTTTTTT)
   {
    Sub_Time=OCTTTTTTTTTTTT;
    c=OOPPPPPPPPPPPP;
   }
  }
 }
 return(c);
}

void ModifyTicketToSpecialTPM(int Sub_Ticket,double Sub_TP)
{ 
 if(OrderSelect(Sub_Ticket,SELECT_BY_TICKET,MODE_TRADES))
 { 
  double   OOPPPPPPPPPPPP=OrderOpenPrice();
  double   OSLLLLLLLLLLLL=OrderStopLoss();
  double   OTPPPPPPPPPPPP=OrderTakeProfit();
  double   OLOOOOOOOOOOOO=OrderLots();
  double   OCPPPPPPPPPPPP=OrderClosePrice();
  double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
  int      OTIIIIIIIIIIII=OrderTicket();
  int      OMNNNNNNNNNNNN=OrderMagicNumber();
  int      OTYYYYYYYYYYYY=OrderType();
  string   OSYYYYYYYYYYYY=OrderSymbol();
  string   OCOOOOOOOOOOOO=OrderComment();
  datetime OOTTTTTTTTTTTT=OrderOpenTime();
  datetime OCTTTTTTTTTTTT=OrderCloseTime();
  
  if(MathAbs(OTPPPPPPPPPPPP-Sub_TP)>=Point_)
  {
   ODOC=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,OSLLLLLLLLLLLL,Sub_TP,0,CLR_NONE); 
   Get_Last_Error=GetLastError();
   Error_132();
   if(!ODOC) Print("ODOC TP "+IntegerToString(OTIIIIIIIIIIII)+" # "+DoubleToStr(OOPPPPPPPPPPPP,Digits)+" # "+DoubleToStr(OSLLLLLLLLLLLL,Digits)+" # "+DoubleToStr(Sub_TP,Digits));
  }
 } 
} 

void ModifyTicketToSpecialSLM(int Sub_Ticket,double Sub_SL)
{ 
 if(OrderSelect(Sub_Ticket,SELECT_BY_TICKET,MODE_TRADES))
 { 
  double   OOPPPPPPPPPPPP=OrderOpenPrice();
  double   OSLLLLLLLLLLLL=OrderStopLoss();
  double   OTPPPPPPPPPPPP=OrderTakeProfit();
  double   OLOOOOOOOOOOOO=OrderLots();
  double   OCPPPPPPPPPPPP=OrderClosePrice();
  double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
  int      OTIIIIIIIIIIII=OrderTicket();
  int      OMNNNNNNNNNNNN=OrderMagicNumber();
  int      OTYYYYYYYYYYYY=OrderType();
  string   OSYYYYYYYYYYYY=OrderSymbol();
  string   OCOOOOOOOOOOOO=OrderComment();
  datetime OOTTTTTTTTTTTT=OrderOpenTime();
  datetime OCTTTTTTTTTTTT=OrderCloseTime();
  
  if(MathAbs(OSLLLLLLLLLLLL-Sub_SL)>=Point_)
  {
   ODOC=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,Sub_SL,OTPPPPPPPPPPPP,0,CLR_NONE); 
   Get_Last_Error=GetLastError();
   Error_132();
   if(!ODOC) Print("ODOC SL "+IntegerToString(OTIIIIIIIIIIII)+" # "+DoubleToStr(OOPPPPPPPPPPPP,Digits)+" # "+DoubleToStr(Sub_SL,Digits)+" # "+DoubleToStr(OTPPPPPPPPPPPP,Digits));
  }
 } 
} 

void TrailingPosition(int Temp_Magic,string Sub_Comment,int Sub_TrailingStop, int Sub_TrailingStep) 
{ 
 bool   Sub_Result_TF;
 double Sub_SL       ;
     
 for (int Sub_i=0; Sub_i<OrdersTotal(); Sub_i++) 
 { 
  if(OrderSelect(Sub_i, SELECT_BY_POS, MODE_TRADES))
  { 
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   int      OTIIIIIIIIIIII=OrderTicket();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderSwap()+OrderCommission();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();

   if(OSYYYYYYYYYYYY==Symbol_Full && OMNNNNNNNNNNNN==Temp_Magic && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   {
    if(OTYYYYYYYYYYYY==OP_BUY && (Bid_-OOPPPPPPPPPPPP)>=((Sub_TrailingStop+Sub_TrailingStep)*Pointt))
    {
     if(OSLLLLLLLLLLLL<OOPPPPPPPPPPPP && MathAbs(OSLLLLLLLLLLLL-OOPPPPPPPPPPPP)>=Point_)
     {
      Sub_Result_TF=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,OOPPPPPPPPPPPP,OTPPPPPPPPPPPP,0,clrNONE);     
     }
     else
     {     
      Sub_SL=(Bid_-(Sub_TrailingStop*Pointt));
      if(OSLLLLLLLLLLLL<Sub_SL && MathAbs(OSLLLLLLLLLLLL-Sub_SL)>=Point_)
      {
       Sub_Result_TF=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,Sub_SL,OTPPPPPPPPPPPP,0,clrNONE);
     //  Print("B "+OTIIIIIIIIIIII+" # "+OOPPPPPPPPPPPP+" # "+Sub_SL);
      }
     }
    }
    else
    if(OTYYYYYYYYYYYY==OP_SELL && (OOPPPPPPPPPPPP-Ask_)>=((Sub_TrailingStop+Sub_TrailingStep)*Pointt))
    {
     if((OSLLLLLLLLLLLL>OOPPPPPPPPPPPP || OSLLLLLLLLLLLL<Pointt) && MathAbs(OSLLLLLLLLLLLL-OOPPPPPPPPPPPP)>=Point_)
     {
      Sub_Result_TF=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,OOPPPPPPPPPPPP,OTPPPPPPPPPPPP,0,clrNONE);     
     }
     else
     {     
      Sub_SL=(Ask_+(Sub_TrailingStop*Pointt));
      if(OSLLLLLLLLLLLL>Sub_SL && MathAbs(OSLLLLLLLLLLLL-Sub_SL)>=Point_)
      {
       Sub_Result_TF=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,Sub_SL,OTPPPPPPPPPPPP,0,clrNONE);
    //  Print("S "+OTIIIIIIIIIIII+" # "+OOPPPPPPPPPPPP+" # "+Sub_SL);
      }
     }
    }
   }
  }
 }
 return;
}

int PendingOrdersTotalM(int Magic)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY>1)
   c++;
  }
 }
 return(c);
}

double RealOrdersProfitByTimeM(int Magic,datetime TTT_,string Sub_Pair)
{
 double c=0;
 int total= OrdersTotal();
 
 for(int cnt= 0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();

   if((OMNNNNNNNNNNNN==Magic || Magic<0) && (OSYYYYYYYYYYYY==Sub_Pair || Sub_Pair==" " || Sub_Pair=="") && OOTTTTTTTTTTTT>=TTT_ && OTYYYYYYYYYYYY<=1)
   c=c+OPRRRRRRRRRRRR;
  }
 }
 return(c);
}

int LastOTYMC(int Temp_Magic,string Sub_Comment)
{
 int Temp_Result=(-9);
 int Temp_Total=OrdersTotal(),Temp_Ticket=0;
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Ticket<OTIIIIIIIIIIII && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    if(OTYYYYYYYYYYYY==OP_BUY || OTYYYYYYYYYYYY==OP_BUYSTOP || OTYYYYYYYYYYYY==OP_BUYLIMIT)
    {
     Temp_Result=OP_BUY;
    }
    else
    if(OTYYYYYYYYYYYY==OP_SELL || OTYYYYYYYYYYYY==OP_SELLSTOP || OTYYYYYYYYYYYY==OP_SELLLIMIT)
    {
     Temp_Result=OP_SELL;
    }
   }
  }
 }
 return(Temp_Result);
}

int LastOTIMC(int Temp_Magic,string Sub_Comment)
{
 int Temp_Result=0;
 int Temp_Total=OrdersTotal();
 
 for (int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit();
   double   OCOMMMMMMMMMMM=OrderCommission();
   double   OSWWWWWWWWWWWW=OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && Temp_Result<OTIIIIIIIIIIII && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0)
   {
    Temp_Result=OTIIIIIIIIIIII;
   }
  }
 }
 return(Temp_Result);
}

double RealBuyLotsTotalM(int Magic)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY)
   {
    c=(c+OLOOOOOOOOOOOO);
   }
  }
 }
 return(c);
}

double RealSellLotsTotalM(int Magic)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL)
   {
    c=(c+OLOOOOOOOOOOOO);
   }
  }
 }
 return(c);
}

void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
{
 if(id==CHARTEVENT_OBJECT_CLICK)
 {
  clickedChartObject=sparam;
  if(clickedChartObject=="Btn_Close_Delete_all_Orders_Profit")
  {
   Close_Delete_all_Orders_Profit_Selected_TF=ObjectGetInteger(0,clickedChartObject,OBJPROP_STATE);
   Close_Delete_all_Orders_Profit_Selected_Value=(double) ObjectGetString(0,"Btn_Profit",OBJPROP_TEXT,0);
  }
  else
  if(clickedChartObject=="Btn_Close_Delete_all_Orders_Now")
  {
   Close_Delete_all_Orders_Now_Selected_TF=ObjectGetInteger(0,clickedChartObject,OBJPROP_STATE);
  }
  
  ChartRedraw();
 }
}

void CreateButtons()
{
 Button_X=X_Side;
 Button_Y=Y_Side;  
 Obj_Color=clrGreen;
 buttonID="Btn_Close_Delete_all_Orders_Profit";
 Btn_Text="Close Orders if Profit";
 Button_Create();

 Button_X=Button_X+Extra_X_;
 //Button_Y=Y_Side+Extra_Y_;
 buttonID="Btn_Profit";
 Btn_Text="Profit";
 EditCreate(0,buttonID,0,Button_X,Button_Y,EDIT_WIDTH,EDIT_HEIGHT,"0","Tahoma",10,ALIGN_RIGHT,false,CORNER_LEFT_UPPER,C'59,41,40',clrWhite,clrWhite,false,false,true,0,"\n");
 LabelCreate(0,"Text_"+buttonID,0,Button_X+20,Button_Y+10,CORNER_LEFT_UPPER,Btn_Text,"Arial",10,clrDarkGray,0,ANCHOR_CENTER,false,false,true,0,"\n");

 Button_X=X_Side;
 Button_Y=Button_Y+Extra_Y_;
 Obj_Color=clrGreen;
 buttonID="Btn_Close_Delete_all_Orders_Now";
 Btn_Text="Close Orders Now";
 Button_Create();

 ChartRedraw();
}

void DeleteButtons()
{
 ObjectDelete("Btn_Close_Delete_all_Orders_Profit");
 ObjectDelete("Btn_Profit");
 ObjectDelete("Btn_Close_Delete_all_Orders_Now");
 return;
}

void Button_Create()
{
 Obj_Lots=NormalizeDouble(Obj_Lots,2);
 ObjectCreate(0,buttonID,OBJ_BUTTON,0,100,50);
 ObjectSetInteger(0,buttonID,OBJPROP_COLOR,Font_Color);
 ObjectSetInteger(0,buttonID,OBJPROP_XDISTANCE,Button_X);
 ObjectSetInteger(0,buttonID,OBJPROP_YDISTANCE,Button_Y);
 ObjectSetInteger(0,buttonID,OBJPROP_XSIZE,X_Size);
 ObjectSetInteger(0,buttonID,OBJPROP_YSIZE,Y_Size);
 ObjectSetString(0,buttonID,OBJPROP_FONT,"Arial");
 ObjectSetString(0,buttonID,OBJPROP_TEXT,Btn_Text);
 ObjectSetInteger(0,buttonID,OBJPROP_FONTSIZE,Font_Size);
 ObjectSetInteger(0,buttonID,OBJPROP_SELECTABLE,0);
 ObjectSetInteger(0,buttonID,OBJPROP_CORNER,CORNER_LEFT_UPPER);
 ObjectSetInteger(0,buttonID,OBJPROP_BGCOLOR,Obj_Color);
 ObjectSetInteger(0,buttonID,OBJPROP_HIDDEN,1);
 return;
}

bool   EditCreate(const long             chart_ID=0,               // chart's ID
                const string           name="Edit",              // object name
                const int              sub_window=0,             // subwindow index
                const int              x=0,                      // X coordinate
                const int              y=0,                      // Y coordinate
                const int              width=50,                 // width
                const int              height=18,                // height
                const string           text="Text",              // text
                const string           font="Arial",             // font
                const int              font_size=10,             // font size
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // alignment type
                const bool               read_only=false,          // ability to edit
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                const color            clr=clrBlack,             // text color
                const color            back_clr=clrWhite,        // background color
                const color            border_clr=clrNONE,       // border color
                const bool               back=false,               // in the background
                const bool               selection=false,          // highlight to move
                const bool               hidden=true,              // hidden in the object list
                const long             z_order=0,                // priority for mouse click 
                const string           tooltip="\n")             // tooltip for mouse hover
{
 //-- reset the error value
 ResetLastError();
 //--
 if(ObjectFind(chart_ID,name)!=0)
 {
  if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
  {
   Print(__FUNCTION__,
               ": failed to create \"Edit\" object! Error code=",_LastError);
   return(false);
  }
  //-- SetObjects
  ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
  ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
  ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
  ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
  ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
  ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
  ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
  ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
  ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
  ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
  ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
  ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
  ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
  ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
  ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
  ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
  ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
  ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
  ObjectSetString(chart_ID,name,OBJPROP_TOOLTIP,tooltip);
 }
 return(true);
}

bool LabelCreate(const long              chart_ID=0,               // chart's ID 
                 const string            name="Label",             // label name 
                 const int               sub_window=0,             // subwindow index 
                 const int               x=0,                      // X coordinate 
                 const int               y=0,                      // Y coordinate 
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring 
                 const string            text="Label",             // text 
                 const string            font="Arial",             // font 
                 const int               font_size=10,             // font size 
                 const color             clr=clrRed,               // color 
                 const double            angle=0.0,                // text slope 
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type 
                 const bool                back=false,               // in the background 
                 const bool                selection=false,          // highlight to move 
                 const bool                hidden=true,              // hidden in the object list 
                 const long              z_order=0,                // priority for mouse click 
                 const string            tooltip="\n",             // tooltip for mouse hover
                 const bool                tester=true)              // create object in the strategy tester
{
 //-- reset the error value 
 ResetLastError();
 //-- CheckTester
 if(!tester && IsTesting())
 return(false);
 //--
 if(ObjectFind(chart_ID,name)!=0)
 {
  if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
  {
   Print(__FUNCTION__,
              ": failed to create text label! Error code=",_LastError);
   return(false);
  }
  //-- SetObjects
  ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
  ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
  ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
  ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
  ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
  ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
  ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
  ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
  ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
  ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
  ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
  ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
  ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
  ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
  ObjectSetString(chart_ID,name,OBJPROP_TOOLTIP,tooltip);
 }
 return(true);
}

int RealBuyOrdersTotalSpecialM(int Magic, string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)<0)
   c++;
  }
 }
 return(c);
}

int RealSellOrdersTotalSpecialM(int Magic, string Sub_Comment)
{
 int c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)<0)
   c++;
  }
 }
 return(c);
}

double RealBuyLotsTotalSpecialM(int Magic, string Sub_Comment)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)<0)
   {
    c=(c+OLOOOOOOOOOOOO);
   }
  }
 }
 return(c);
}

double RealSellLotsTotalSpecialM(int Magic, string Sub_Comment)
{
 double c=0;
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)<0)
   {
    c=(c+OLOOOOOOOOOOOO);
   }
  }
 }
 return(c);
}

datetime LastRealOOTMH(int Sub_Magic)
{
 datetime Sub_Result=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && Sub_Result<OOTTTTTTTTTTTT)
   {
    Sub_Result=OOTTTTTTTTTTTT;
   }
  }
 }
 return(Sub_Result);
}

int RealBuyOrdersTotalMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_BUY)
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

int RealSellOrdersTotalMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_SELL)
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

void CloseRealBuyOrdersMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_BUY)
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    CODO=OrderClose(OTIIIIIIIIIIII2,OLOOOOOOOOOOOO2,Bid_,Slippage);
    Get_Last_Error=GetLastError();
    Print("CRBOM D "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

void CloseRealSellOrdersMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_SELL)
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    CODO=OrderClose(OTIIIIIIIIIIII2,OLOOOOOOOOOOOO2,Ask_,Slippage);
    Get_Last_Error=GetLastError();
    Print("CRBOM E "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

int LastRealBuyOTIMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_BUY && Sub_Result2<OTIIIIIIIIIIII2)
   {
    Sub_Result2=OTIIIIIIIIIIII2;
   }
  }
 }
 return(Sub_Result2);
}

int LastRealSellOTIMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_SELL && Sub_Result2<OTIIIIIIIIIIII2)
   {
    Sub_Result2=OTIIIIIIIIIIII2;
   }
  }
 }
 return(Sub_Result2);
}

void DeletePendingMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2>1)
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    CODO=OrderDelete(OTIIIIIIIIIIII2,clrNONE);
    Get_Last_Error=GetLastError();
    Print("CRBOM F "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

void DeleteBuyPendingMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT))
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    CODO=OrderDelete(OTIIIIIIIIIIII2,clrNONE);
    Get_Last_Error=GetLastError();
    Print("CRBOM F "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

void DeleteSellPendingMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT))
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    CODO=OrderDelete(OTIIIIIIIIIIII2,clrNONE);
    Get_Last_Error=GetLastError();
    Print("CRBOM G "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

double SumBuyPendingOLOMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT))
   {
    Sub_Result2=(Sub_Result2+OLOOOOOOOOOOOO2);
   }
  }
 }
 return(Sub_Result2);
}

double SumSellPendingOLOMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT))
   {
    Sub_Result2=(Sub_Result2+OLOOOOOOOOOOOO2);
   }
  }
 }
 return(Sub_Result2);
}

int BuyPendingOrdersTotalMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT))
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

int SellPendingOrdersTotalMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT))
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

double SumRealBuyOLOMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_BUY)
   {
    Sub_Result2=(Sub_Result2+OLOOOOOOOOOOOO2);
   }
  }
 }
 return(Sub_Result2);
}

double SumRealSellOLOMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2==OP_SELL)
   {
    Sub_Result2=(Sub_Result2+OLOOOOOOOOOOOO2);
   }
  }
 }
 return(Sub_Result2);
}

double FirstBuyOOPMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUY || OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OOPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstSellOOPMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELL || OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OOPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstBuyOTPMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUY || OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OTPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstSellOTPMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELL || OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OTPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstBuyOSLMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUY || OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OSLLLLLLLLLLLL2;    
   }
  }
 }
 return(Sub_Result2);
}

double FirstSellOSLMC2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELL || OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OSLLLLLLLLLLLL2;
   }
  }
 }
 return(Sub_Result2);
}

bool RealOrdersIsTPMCH2(int Sub_Magic2,string Sub_Comment2)
{
 bool Sub_Result2=false;
 int Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2<=1 && StringFind(OCOOOOOOOOOOOO2,"[tp]",0)>=0)
   {
    Sub_Result2=true;
   }
  }
 }
 return(Sub_Result2);
}

int RealOrdersTotalMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2<=1)
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

int PendingOrdersTotalMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" ") && OTYYYYYYYYYYYY2>1)
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

int OrdersTotalMC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (OCOOOOOOOOOOOO2==Sub_Comment2 || Sub_Comment2=="" || Sub_Comment2==" "))
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

void CloseDeleteOrdersM(int Sub_Magic,datetime Sub_Time)
{
 if(Market_Close_TF) 
 {
  Comment("Market_Close_TF Sell");
  if(Print_TF) Print("Market_Close_TF Sell");
  Print_TF=false;
  return;
 }
 int total=OrdersTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OOTTTTTTTTTTTT<Sub_Time)
   {
    Ask_=MarketInfo(Symbol_Full,MODE_ASK);
    Bid_=MarketInfo(Symbol_Full,MODE_BID);
    if(OTYYYYYYYYYYYY==OP_BUY) CODO=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Bid_,Slippage);
    else
    if(OTYYYYYYYYYYYY==OP_SELL) CODO=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Ask_,Slippage);
    else
    CODO=OrderDelete(OTIIIIIIIIIIII,clrNONE);
    
    Get_Last_Error=GetLastError();
    Print("CRBOM C "+IntegerToString(DayOfWeek())+" "+TimeToStr(TimeCurrent())+" "+
    TimeToStr(TimeCurrent())+" # "
    +IntegerToString(GetLastError()));
    Error_132();
   }
  }
 }
 return;
}

double FirstBuyOOPMCH2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUY || OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OOPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstSellOOPMCH2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELL || OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OOPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstBuyOTPMCH2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUY || OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OTPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstSellOTPMCH2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELL || OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OTPPPPPPPPPPPP2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstBuyOSLMCH2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_BUY || OTYYYYYYYYYYYY2==OP_BUYSTOP || OTYYYYYYYYYYYY2==OP_BUYLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OSLLLLLLLLLLLL2;
   }
  }
 }
 return(Sub_Result2);
}

double FirstSellOSLMCH2(int Sub_Magic2,string Sub_Comment2)
{
 double Sub_Result2=0.0;
 int    Sub_Ticket2=EMPTY_VALUE;
 int    Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" ") && (OTYYYYYYYYYYYY2==OP_SELL || OTYYYYYYYYYYYY2==OP_SELLSTOP || OTYYYYYYYYYYYY2==OP_SELLLIMIT) && Sub_Ticket2>OTIIIIIIIIIIII2)
   {
    Sub_Ticket2=OTIIIIIIIIIIII2;
    Sub_Result2=OSLLLLLLLLLLLL2;
   }
  }
 }
 return(Sub_Result2);
}

int RealOrdersTotalMHC2(int Sub_Magic2,string Sub_Comment2)
{
 int Sub_Result2=0;
 int Sub_Total2=OrdersHistoryTotal();
 
 for(int Sub_iii2=0; Sub_iii2<Sub_Total2; Sub_iii2++)
 {
  if(OrderSelect(Sub_iii2,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP2=OrderOpenPrice();
   double   OSLLLLLLLLLLLL2=OrderStopLoss();
   double   OTPPPPPPPPPPPP2=OrderTakeProfit();
   double   OLOOOOOOOOOOOO2=OrderLots();
   double   OCPPPPPPPPPPPP2=OrderClosePrice();
   int      OTIIIIIIIIIIII2=OrderTicket();
   int      OMNNNNNNNNNNNN2=OrderMagicNumber();
   int      OTYYYYYYYYYYYY2=OrderType();
   string   OSYYYYYYYYYYYY2=OrderSymbol();
   string   OCOOOOOOOOOOOO2=OrderComment();
   datetime OOTTTTTTTTTTTT2=OrderOpenTime();
   double   OPRRRRRRRRRRRR2=OrderProfit()+OrderCommission()+OrderSwap();
   if(OMNNNNNNNNNNNN2==Sub_Magic2 && OSYYYYYYYYYYYY2==Symbol_Full && OTYYYYYYYYYYYY2<=1 && (StringFind(OCOOOOOOOOOOOO2,Sub_Comment2,0)>=0 || Sub_Comment2=="" || Sub_Comment2==" "))
   {
    Sub_Result2++;
   }
  }
 }
 return(Sub_Result2);
}

double RealBuySumLotsM(int Sub_Magic,string Sub_Comment)
{
 double Sub_Result=0;
 int Sub_Total=OrdersTotal();
 
 for(int Sub_cnt=0; Sub_cnt<Sub_Total; Sub_cnt++)
 {
  if(OrderSelect(Sub_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_BUY && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   {
    Sub_Result=Sub_Result+OLOOOOOOOOOOOO;
   }
  }
 }
 return(Sub_Result);
}

double RealSellSumLotsM(int Sub_Magic,string Sub_Comment)
{
 double Sub_Result=0;
 int Sub_Total=OrdersTotal();
 
 for(int Sub_cnt=0; Sub_cnt<Sub_Total; Sub_cnt++)
 {
  if(OrderSelect(Sub_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY==OP_SELL && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   {
    Sub_Result=Sub_Result+OLOOOOOOOOOOOO;
   }
  }
 }
 return(Sub_Result);
}

double PendingBuySumLotsM(int Sub_Magic,string Sub_Comment)
{
 double Sub_Result=0;
 int Sub_Total=OrdersTotal();
 
 for(int Sub_cnt=0; Sub_cnt<Sub_Total; Sub_cnt++)
 {
  if(OrderSelect(Sub_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && (OTYYYYYYYYYYYY==OP_BUYSTOP || OTYYYYYYYYYYYY==OP_BUYLIMIT) && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   {
    Sub_Result=Sub_Result+OLOOOOOOOOOOOO;
   }
  }
 }
 return(Sub_Result);
}

double PendingSellSumLotsM(int Sub_Magic,string Sub_Comment)
{
 double Sub_Result=0;
 int Sub_Total=OrdersTotal();
 
 for(int Sub_cnt=0; Sub_cnt<Sub_Total; Sub_cnt++)
 {
  if(OrderSelect(Sub_cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && (OTYYYYYYYYYYYY==OP_SELLSTOP || OTYYYYYYYYYYYY==OP_SELLLIMIT) && (OCOOOOOOOOOOOO==Sub_Comment || Sub_Comment=="" || Sub_Comment==" "))
   {
    Sub_Result=Sub_Result+OLOOOOOOOOOOOO;
   }
  }
 }
 return(Sub_Result);
}

double LastRealOPRMH(int Sub_Magic)
{
 double Sub_Result=0;
 int Sub_Total=OrdersHistoryTotal(),Sub_Ticket=0;
 Temp_OTY=(-9);
 
 for(int Sub_cnt=0 ; Sub_cnt < Sub_Total ; Sub_cnt++)
 {
  if(OrderSelect(Sub_cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && Sub_Ticket<OTIIIIIIIIIIII)
   {
    Sub_Ticket=OTIIIIIIIIIIII;
    Sub_Result=OPRRRRRRRRRRRR;
    Temp_OTY=OTYYYYYYYYYYYY;
   }
  }
 }
 return(Sub_Result);
}

double LastRealOLOMH(int Temp_Magic)
{
 double Temp_Result=0;
 int Temp_Total=OrdersHistoryTotal(),Temp_Ticket=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && Temp_Ticket<OTIIIIIIIIIIII)
   {
    Temp_Ticket=OTIIIIIIIIIIII;
    Temp_Result=OLOOOOOOOOOOOO;
   }
  }
 }
 return(Temp_Result);
}

datetime LastRealOrderOCTMH(int Sub_Magic)
{
 int total=OrdersHistoryTotal();
 datetime Sub_Result=0;
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && Sub_Result<OCTTTTTTTTTTTT)
   {
    Sub_Result=OCTTTTTTTTTTTT;
   }
  }
 }
 return(Sub_Result);
}

void OrderSend_()
{
 if(OrdersHistoryTotal()<1 && OrdersTotal()<1)
 {
  if(!CheckMoneyForTrade2(Symbol(),MarketInfo(Symbol(),MODE_MINLOT),OP_BUY))
  {
   Comment("Not enough money for Open Order ");
   return;
  }
  O_S_TF=OrderSend(Symbol(),OP_BUY,MarketInfo(Symbol(),MODE_MINLOT),Ask,30,0,0,"",0,0,clrNONE);

  if(!CheckMoneyForTrade2(Symbol(),MarketInfo(Symbol(),MODE_MINLOT),OP_SELL))
  {
   Comment("Not enough money for Open Order ");
   return;
  }
  O_S_TF=OrderSend(Symbol(),OP_SELL,MarketInfo(Symbol(),MODE_MINLOT),Bid,30,0,0,"",0,0,clrNONE);
 }
 return;
}

void OrderClose_()
{
 int total= OrdersTotal();
 
 for(int cnt= 0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OTYYYYYYYYYYYY==OP_BUY)
   {
    O_C_TF=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Bid,30);
   }
   else
   if(OTYYYYYYYYYYYY==OP_SELL)
   {
    O_C_TF=OrderClose(OTIIIIIIIIIIII,OLOOOOOOOOOOOO,Ask,30);
   }
  }
 }
 return;
}

bool CheckMoneyForTrade2(string Sub_Symbol2, double Sub_Lots2,int Sub_Type2)
{
 double Free_Margin2=AccountFreeMarginCheck(Sub_Symbol2,Sub_Type2,Sub_Lots2);
 //-- if there is not enough money
 if(Free_Margin2<0)
 {
  string Oper2=(Sub_Type2==OP_BUY)? "Buy":"Sell";
  Print("Not enough money for ",Oper2," ",Sub_Lots2, " ",Sub_Symbol2, " Error code=",GetLastError());
  return(false);
 }
 //--- checking successful
 return(true);
}

void Read_Signal()
{
 bool Fibo_Buy_TF=false,Fibo_Sell_TF=false,MA_Buy_TF=false,MA_Sell_TF=false,MA_Filter_Buy_TF=false,MA_Filter_Sell_TF=false
      ,MACD_Buy_TF=false,MACD_Sell_TF=false,ZZ_Filter_Buy_TF=false,ZZ_Filter_Sell_TF=false,Stochastic_Filter_Buy_Main_TF=false
      ,Stochastic_Filter_Buy_Signal_TF=false,Stochastic_Filter_Sell_Main_TF=false,Stochastic_Filter_Sell_Signal_TF=false
      ,BBS_Buy_TF=false,BBS_Sell_TF=false;

 double  MA_V_=0,Sub_High=0,Sub_Low=0,Sub_Levels[],Sub_V_=0;
 
 int Sub_iii=0,Sub_History_Candles=0,Sub_Width[],Sub_ROTM=0,Sub_RBOTM=0,Sub_RSOTM=0,Value_1_C_=0,Value_2_C_=0,Value_3_C_=0
     ,Sub_H_Bar,Sub_L_Bar;
  
 string Sub_String="";
 
 color Sub_Colors[];
 
 datetime Sub_Time,Sub_H_Time,Sub_L_Time;
 
 ENUM_LINE_STYLE Sub_Style[];
 
 Bar_Shift=1;
 Sub_High=iHigh(Symbol_Full,PERIOD_CURRENT,0);
 Sub_Low=iLow(Symbol_Full,PERIOD_CURRENT,0);
 Sub_RBOTM=RealBuyOrdersTotalM(Frame_MagicNumber);
 Sub_RSOTM=RealSellOrdersTotalM(Frame_MagicNumber);
 Sub_ROTM=(Sub_RBOTM+Sub_RSOTM);
 Ask_=MarketInfo(Symbol_Full,MODE_ASK);
 Bid_=MarketInfo(Symbol_Full,MODE_BID);
 Spread=(Ask_-Bid_);
 
 if(Sub_RBOTM>0)
 {
  if(Buy__SL>Pointt && Bid_<=Buy__SL)
  {
   Close_Buy_TF=true;
   return;
  }
  /*
  if(Buy__TP>Pointt && Bid_>=Buy__TP)
  {
   Close_Buy_TF=true;
   return;
  }
  */
  Sub_V_=(Final_Risk*TP_Ratio_from_SL);
  if(Sub_V_>=0.01)
  {
   if(RealBuyProfitByDollarsM(Frame_MagicNumber)>=Sub_V_)
   {
    Close_Buy_TF=true;
    return;
   }
  }
 }
 
 if(Sub_RSOTM>0)
 {
  if(Sell__SL>Pointt && Ask_>=Sell__SL)
  {
   Close_Sell_TF=true;
   return;
  }
  /*
  if(Sell__TP>Pointt && Ask_<=Sell__TP)
  {
   Close_Sell_TF=true;
   return;
  }
  */
  Sub_V_=(Final_Risk*TP_Ratio_from_SL);
  if(Sub_V_>=0.01)
  {
   if(RealSellProfitByDollarsM(Frame_MagicNumber)>=Sub_V_)
   {
    Close_Sell_TF=true;
    return;
   }
  }
 }
 
 if(ZZ_Filter_TF)
 {
  Value_1_N_=ZigZag(1,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  Value_1_C_=ZigZag_Candle(1,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);

  Value_2_N_=ZigZag(2,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  Value_2_C_=ZigZag_Candle(2,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  
  Value_3_N_=ZigZag(3,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  Value_3_C_=ZigZag_Candle(3,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  
  if(Low_Price<Pointt && High_Price<Pointt)// && Sub_RBOTM==0 && Sub_RSOTM)
  {
   if(Value_1_N_<Value_2_N_)
   {
    Last_Way=2;
    High_Price=Value_2_N_;
    High_Time=Time[Value_2_C_];
    Temp_High_Time=iTime(Symbol_Full,ZZ_Time_Frame,Value_2_C_);
    Temp_High_Price=0;
    Print("High_Price B "+TimeToString(High_Time)+" # "+DoubleToString(High_Price,Digits_));

    Low_Price=Value_1_N_;
    Low_Time=Time[Value_1_C_];
    Temp_Low_Time=iTime(Symbol_Full,ZZ_Time_Frame,Value_1_C_);
    Temp_Low_Price=0;
    Print("Low_Price B ");
   }
   else if(Value_1_N_>Value_2_N_)
   {
    Last_Way=1;
    High_Price=Value_1_N_;
    High_Time=Time[Value_1_C_];
    Temp_High_Time=iTime(Symbol_Full,ZZ_Time_Frame,Value_1_C_);
    Temp_High_Price=0;
    Print("High_Price C "+TimeToString(High_Time)+" # "+DoubleToString(High_Price,Digits_));

    Low_Price=Value_2_N_;
    Low_Time=Time[Value_2_C_];
    Temp_Low_Time=iTime(Symbol_Full,ZZ_Time_Frame,Value_2_C_);
    Temp_Low_Price=0;
    Print("Low_Price C ");
   }
  }
 }
 
 if(Low_Price<Pointt || Low_Price>Sub_Low)
 {
  if(Low_Price>Pointt)
  {
   Last_Way=2;
  }
  Low_Price=Sub_Low;
  Low_Time=Time[0];
  Temp_Low_Price=0;
  Temp_Low_Time=TimeCurrent();
  Print("Low_Price D "+TimeToString(Low_Time)+" # "+DoubleToString(Low_Price,Digits_));
 }
 
 if(High_Price<Pointt || High_Price<Sub_High)
 {
  if(High_Price>Pointt)
  {
   Last_Way=1;
  }
  High_Price=Sub_High;
  High_Time=Time[0];
  Temp_High_Price=0;
  Temp_High_Time=TimeCurrent();
  Objects_Delete("High_Price");
  Print("High_Price D "+TimeToString(High_Time)+" # "+DoubleToString(High_Price,Digits_));
 }
 
 Sub_Time=Low_Time;
 if(Sub_Time>High_Time)
 {
  Sub_Time=High_Time;
 }
 
 if(!Disable_Lines_and_Fibo_TF)
 {
  Set_Trend("High_Price",High_Color,2,0,High_Time,High_Price,TimeCurrent(),High_Price,DoubleToString(High_Price,Digits_));
  Set_Trend("Low_Price" ,Low_Color ,2,0,Low_Time,Low_Price ,TimeCurrent(),Low_Price ,DoubleToString(Low_Price,Digits_) );
 }
 
 if(Maximum_Points_between_High_Low>0 && MathAbs(High_Price-Low_Price)>(Maximum_Points_between_High_Low*Pointt))
 {
  if(Sub_ROTM==0)
  {
   High_Price=0;
   High_Time=Time[0];
   Temp_High_Time=TimeCurrent();
   Temp_High_Price=0;

   Low_Price=0;
   Low_Time=Time[0];
   Temp_Low_Time=TimeCurrent();
   Temp_Low_Price=0;

   Last_Way=0;
   Objects_Delete("_Price");
   Objects_Delete("FiboZ");
   Print("Low_Price E ");
   Print("High_Price E "+TimeToString(High_Time)+" # "+DoubleToString(High_Price,Digits_));
   return;
  }
 }
 
 if(MathAbs(High_Price-Low_Price)>=(Minimum_Points_between_High_Low*Pointt))
 {
  //return;
  Temp_Levels=13;
  ArrayResize(Sub_Levels,Temp_Levels);
  ArrayResize(Sub_Colors,Temp_Levels);
  ArrayResize(Sub_Style,Temp_Levels);
  ArrayResize(Sub_Width,Temp_Levels);
  
  Sub_Levels[0]=Levels_0_;
  Sub_Levels[1]=Levels_1_;
  Sub_Levels[2]=Levels_2_;
  Sub_Levels[3]=Levels_3_;
  Sub_Levels[4]=Levels_4_;
  Sub_Levels[5]=Levels_5_;
  Sub_Levels[6]=Levels_6_;
  Sub_Levels[7]=Levels_7_;
  Sub_Levels[8]=Levels_8_;
  Sub_Levels[9]=Levels_9_;
  Sub_Levels[10]=Levels_10_;
  Sub_Levels[11]=Levels_11_;
  Sub_Levels[12]=Levels_12_;
  
  for(Sub_iii=0; Sub_iii<Temp_Levels; Sub_iii++)
  {
   Sub_Colors[Sub_iii]=clrYellow;
   Sub_Style[Sub_iii]=0;
   Sub_Width[Sub_iii]=1;
  }  
    
  if(!Disable_Lines_and_Fibo_TF)
  {
   FiboLevelsSet(Temp_Levels,Sub_Levels,Sub_Colors,Sub_Style,Sub_Width,0,"FiboZ");
  }
  //Set_Trend("FiboC" ,clrYellow,0,1,Temp_Time,0,Temp_Time,EMPTY_VALUE," ");
  //Set_Trend("FiboEP",clrLime  ,2,0,Temp_Time,Enter_Price,TimeCurrent(),Enter_Price," ");
  
  Fibo_Temp_Up_Price=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Temp_Up_Level));
  Fibo_Temp_Down_Price=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Temp_Down_Level));
  if(Stratigy_Type_List==1)
  {
   Sub_H_Time=(datetime) ObjectGetInteger(0,"High_Price",OBJPROP_TIME1);
   Sub_L_Time=(datetime) ObjectGetInteger(0,"Low_Price",OBJPROP_TIME1);
   if(Stratigy_B_Last_H_Time<Sub_H_Time)
   {
    if(Stratigy_B_Up_TF && Stratigy_B_Buy_TF && !Stratigy_B_Up_Last_TF)
    {
     Stratigy_B_Final_Buy_TF=true;
     Stratigy_B_Final_High_Price=High_Price;
    }
    Stratigy_B_Last_H_Time=Sub_H_Time;
    Stratigy_B_Up_TF=false;
    Stratigy_B_Buy_TF=false;
    Stratigy_B_Up_Last_TF=false;
    //Stratigy_B_Up_Price=0;
    //Stratigy_B_Buy_TP=0;
    if(Sub_H_Time>Sub_L_Time)
    {
     Stratigy_B_Buy_TF=true;
    }
   }

   if(Stratigy_B_Last_L_Time<Sub_L_Time)
   {
    if(Stratigy_B_Down_TF && Stratigy_B_Sell_TF && !Stratigy_B_Down_Last_TF)
    {
     Stratigy_B_Final_Sell_TF=true;
     Stratigy_B_Final_Low_Price=Low_Price;
    }
    Stratigy_B_Last_L_Time=Sub_L_Time;
    Stratigy_B_Down_TF=false;
    Stratigy_B_Sell_TF=false;
    Stratigy_B_Down_Last_TF=false;
    //Stratigy_B_Down_Price=0;
    //Stratigy_B_Sell_TP=0;
    if(Sub_L_Time>Sub_H_Time)
    {
     Stratigy_B_Sell_TF=true;
    }
   }

   if(!Stratigy_B_Up_TF && !Stratigy_B_Down_TF)
   {
    Stratigy_B_Up_Price=Fibo_Temp_Up_Price;
    Stratigy_B_Down_Price=Fibo_Temp_Down_Price;
    //Stratigy_B_Buy_TP=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Buy_TP));
    //Stratigy_B_Sell_TP=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Sell_TP));
   }
   if(Stratigy_B_Up_Last_TF && Bid_>=High_Price)
   {
    Stratigy_B_Buy_TF=true;
    //Print("Stratigy_B_Buy_TF");
   }
   if(Stratigy_B_Down_Last_TF && Bid_<=Low_Price)
   {
    Stratigy_B_Sell_TF=true;
   }
  }
  
  //Print("A "+Last_Way+" # "+Bid_+" # "+Fibo_Temp_Up_Price);
  if(Sub_RBOTM>0)
  {
   //Temp_Low_Price=0;
   //Temp_Low_Time=TimeCurrent();
  }
  
  if(Sub_RSOTM>0)
  {
   //Temp_High_Price=0;
  }
  
  
  if(Last_Way==1)
  {
   if(Bid_<=Fibo_Temp_Up_Price)
   {
    if((Temp_Low_Price<Pointt || Temp_Low_Price>Bid_))
    {
     Temp_Low_Price=Bid_;
     Temp_Low_Time=TimeCurrent();
     if(Stratigy_Type_List==1)
     {
      Stratigy_B_Up_TF=true;
      //Print("Stratigy_B_Up_TF");
     }
    }
   }
   if(Temp_Low_Price>Pointt && High_Price>Pointt && Bid_>=High_Price)
   {
    Low_Price=Temp_Low_Price;
    Low_Time=Temp_Low_Time;
    Temp_Low_Price=0;
    Temp_Low_Time=TimeCurrent();
    if(Stratigy_Type_List==1 && Stratigy_B_Up_TF)
    {
     Stratigy_B_Up_Last_TF=true;
     //Print("Stratigy_B_Up_Last_TF");
    }
   }
  }
  else if(Last_Way==2)
  {
   if(Bid_>=Fibo_Temp_Down_Price)
   {
    if(Temp_High_Price<Bid_)
    {
     Temp_High_Price=Bid_;
     Temp_High_Time=TimeCurrent();
     if(Stratigy_Type_List==1)
     {
      Stratigy_B_Down_TF=true;
     }
    }
   }
   if(Temp_High_Price>Pointt && Low_Price>Pointt && Bid_<=Low_Price)
   {
    High_Price=Temp_High_Price;
    High_Time=Temp_High_Time;
    Temp_High_Price=0;
    Temp_High_Time=TimeCurrent();
    if(Stratigy_Type_List==1 && Stratigy_B_Down_TF)
    {
     Stratigy_B_Down_Last_TF=true;
    }
    Print("High_Price F "+TimeToString(High_Time)+" # "+DoubleToString(High_Price,Digits_));
   }
  }
 }
 else
 {
  Objects_Delete("FiboZ");
 }
  
 {
  if(Sub_RBOTM==0)
  {
   Buy_Enter_Price=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_to_Enter_Buy));
   Buy__SL=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Buy_SL));
   Buy__TP=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Buy_TP));
   if(Stratigy_B_Buy_TF)
   {
    Buy__SL=Low_Price;
    Buy__TP=Stratigy_B_Buy_TP;
   }
   Buy__SL=(Buy__SL-(Buy_SL_Extra_Points*Pointt));
   Buy__SL=NormalizeDouble(Buy__SL,Digits_);
   Buy__TP=NormalizeDouble(Buy__TP,Digits_);
   if(Last_Way==1 && Ask_<=Buy_Enter_Price && MathAbs(Buy_Enter_Price-Buy__SL)>=(Minimum_Stop_Loss_Points*Pointt) && (MAXimum_Stop_Loss_Points<0.01 || MathAbs(Buy_Enter_Price-Buy__SL)<=(MAXimum_Stop_Loss_Points*Pointt)))
   {
    Fibo_Buy_TF=true;
   }
  }
  
  //Print("W "+Fibo_Buy_TF);
  
  if(Sub_RSOTM==0)
  {
   Sell_Enter_Price=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_to_Enter_Sell));
   Sell__SL=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Sell_SL));
   Sell__TP=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Sell_TP));
   if(Stratigy_B_Sell_TF)
   {
    Sell__SL=High_Price;
    Sell__TP=Stratigy_B_Sell_TP;
   }
   Sell__SL=(Sell__SL+(Buy_SL_Extra_Points*Pointt));
   Sell__SL=NormalizeDouble(Sell__SL,Digits_);
   Sell__TP=NormalizeDouble(Sell__TP,Digits_);
   if(Last_Way==2 && Bid_>=Sell_Enter_Price && MathAbs(Sell_Enter_Price-Sell__SL)>=(Minimum_Stop_Loss_Points*Pointt) && (MAXimum_Stop_Loss_Points<0.01 || MathAbs(Sell_Enter_Price-Sell__SL)<=(MAXimum_Stop_Loss_Points*Pointt)))
   {
    Fibo_Sell_TF=true;
   }
  }
  
  //Print("Buy: "+DoubleToString(Buy_Enter_Price,Digits_)+" # SL: "+DoubleToString(Buy__SL,Digits_)+" # TP: "+DoubleToString(Buy__TP,Digits_)+" # Sell: "+DoubleToString(Sell_Enter_Price,Digits_)+" # SL: "+DoubleToString(Sell__SL,Digits_)+" # TP: "+DoubleToString(Sell__TP,Digits_));
  if(!Disable_Lines_and_Fibo_TF)
  {
   if(Last_High_Price!=High_Price || Last_Low_Price!=Low_Price)
   {
    Objects_Delete("FiboZ");
   }
   FiboLevelsCreate(0,"FiboZ",0,Time[Fibo_History_Candle],High_Price,Time[0],Low_Price,Fibo_Color,0,1,false,true,false,false,0);
   Last_High_Price=High_Price;   
   Last_Low_Price=Low_Price;   
  }
 }
 
 if(MathAbs(High_Price-Low_Price)<(Minimum_Points_between_High_Low*Pointt))
 {
  Fibo_Buy_TF=false;
  Fibo_Sell_TF=false;
 }
 
 //Print("W "+High_Price+" # "+Last_High_Price);
 
 
 MA_Buy_TF=true;
 MA_Sell_TF=true;
 
 if(MA_Filter_TF)
 {
  Value_0_N_=iMA(Symbol_Full,MA_Filter_Time_Frame,MA_Filter_Period,MA_Filter_Shift,MA_Filter_Method,MA_Filter_Apply_to,Bar_Shift);
  Value_1_N_=iClose(Symbol_Full,PERIOD_CURRENT,Bar_Shift);
  Value_2_N_=iLow(Symbol_Full,PERIOD_CURRENT,Bar_Shift);
  Value_3_N_=iHigh(Symbol_Full,PERIOD_CURRENT,Bar_Shift);
  if(Bid_>Value_0_N_)
  {
   MA_Filter_Buy_TF=true;
  }
  else if(Bid_<Value_0_N_)
  {
   MA_Filter_Sell_TF=true;
  }  
 }
 else
 {
  MA_Filter_Buy_TF=true;
  MA_Filter_Sell_TF=true;
 }

 MACD_Buy_TF=true;
 MACD_Sell_TF=true;
 

 ZZ_Filter_Buy_TF=false;
 ZZ_Filter_Sell_TF=false;
 
 /*
 if(ZZ_Filter_TF)
 {
  Value_1_N_=ZigZag(1,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  Value_1_C_=ZigZag_Candle(1,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);

  Value_2_N_=ZigZag(2,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  Value_2_C_=ZigZag_Candle(2,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);

  Value_3_N_=ZigZag(3,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);
  Value_3_C_=ZigZag_Candle(3,ZZ_Time_Frame,Symbol_Full,ZZ_Depth,ZZ_Deviation,ZZ_Backstep,0);

  if((Value_1_N_>Value_2_N_ && Value_2_N_<Value_3_N_ && Time[Value_2_C_]>=Temp_Low_Time && Value_2_N_==Low_Price) || (Value_1_N_<Value_2_N_ && Value_2_N_>Value_3_N_ && Time[Value_3_C_]>=Temp_Low_Time && Value_3_N_==Low_Price))
  {
   //Print("W "+(Value_1_N_>Value_2_N_ && Value_2_N_<Value_3_N_ && Time[Value_2_C_]>=Temp_Low_Time)+" # "+(Value_1_N_<Value_2_N_ && Value_2_N_>Value_3_N_ && Time[Value_3_C_]>=Temp_Low_Time));
   //Print(Time[Value_2_C_]+" # "+Temp_Low_Time);
   ZZ_Filter_Buy_TF=true;
  }
  else if((Value_1_N_>Value_2_N_ && Value_2_N_<Value_3_N_ && Time[Value_3_C_]>=Temp_High_Time && Value_3_N_==High_Price) || (Value_1_N_<Value_2_N_ && Value_2_N_>Value_3_N_ && Time[Value_2_C_]>=Temp_High_Time && Value_2_N_==High_Price))
  {
   ZZ_Filter_Sell_TF=true;
  }  
 }
 else
 */
 {
  ZZ_Filter_Buy_TF=true;
  ZZ_Filter_Sell_TF=true;
 }
 
 if(Stochastic_Filter_TF)
 {
  Value_0_N_=iStochastic(Symbol_Full,Stochastic_Time_Frame,Stochastic_K_Period,Stochastic_D_Period,Stochastic_Slowing,Stochastic_MA_Method,Stochastic_Price_Field,MODE_MAIN,1);
  Value_1_N_=iStochastic(Symbol_Full,Stochastic_Time_Frame,Stochastic_K_Period,Stochastic_D_Period,Stochastic_Slowing,Stochastic_MA_Method,Stochastic_Price_Field,MODE_SIGNAL,1);
  if(Value_0_N_>Stochastic_Low_Level && Value_0_N_<Stochastic_Buy_Level && Value_1_N_>Stochastic_Low_Level && Value_1_N_<Stochastic_Buy_Level)
  {
   for(Sub_iii=2; Sub_iii<(iBars(Symbol_Full,Stochastic_Time_Frame)-1); Sub_iii++)
   {
    Value_2_N_=iStochastic(Symbol_Full,Stochastic_Time_Frame,Stochastic_K_Period,Stochastic_D_Period,Stochastic_Slowing,Stochastic_MA_Method,Stochastic_Price_Field,MODE_MAIN,Sub_iii);
    Value_3_N_=iStochastic(Symbol_Full,Stochastic_Time_Frame,Stochastic_K_Period,Stochastic_D_Period,Stochastic_Slowing,Stochastic_MA_Method,Stochastic_Price_Field,MODE_SIGNAL,Sub_iii);
    if(Value_2_N_<=Stochastic_Low_Level)
    {
     Stochastic_Filter_Buy_Main_TF=true;
     Stochastic_Filter_Buy_Signal_TF=true;
    }
    if(Value_3_N_<=Stochastic_Low_Level)
    {
     Stochastic_Filter_Buy_Main_TF=true;
     Stochastic_Filter_Buy_Signal_TF=true;
    }
    
    if(Value_2_N_>=Stochastic_Buy_Level || Value_3_N_>=Stochastic_Buy_Level)
    {
     Stochastic_Filter_Buy_Main_TF=false;
     Stochastic_Filter_Buy_Signal_TF=false;
     Sub_iii=(iBars(Symbol_Full,Stochastic_Time_Frame)+9);     
    }

    if(Stochastic_Filter_Buy_Main_TF && Stochastic_Filter_Buy_Signal_TF)
    {
     Sub_iii=(iBars(Symbol_Full,Stochastic_Time_Frame)+9);     
    }
   }
  }
  else if(Value_0_N_<Stochastic_High_Level && Value_0_N_>Stochastic_Sell_Level && Value_1_N_<Stochastic_High_Level && Value_1_N_>Stochastic_Sell_Level)
  {
   for(Sub_iii=2; Sub_iii<(iBars(Symbol_Full,Stochastic_Time_Frame)-1); Sub_iii++)
   {
    Value_2_N_=iStochastic(Symbol_Full,Stochastic_Time_Frame,Stochastic_K_Period,Stochastic_D_Period,Stochastic_Slowing,Stochastic_MA_Method,Stochastic_Price_Field,MODE_MAIN,Sub_iii);
    Value_3_N_=iStochastic(Symbol_Full,Stochastic_Time_Frame,Stochastic_K_Period,Stochastic_D_Period,Stochastic_Slowing,Stochastic_MA_Method,Stochastic_Price_Field,MODE_SIGNAL,Sub_iii);
    if(Value_2_N_>=Stochastic_High_Level)
    {
     Stochastic_Filter_Sell_Main_TF=true;
     Stochastic_Filter_Sell_Signal_TF=true;
    }
    if(Value_3_N_>=Stochastic_High_Level)
    {
     Stochastic_Filter_Sell_Main_TF=true;
     Stochastic_Filter_Sell_Signal_TF=true;
    }
    
    if(Value_2_N_<=Stochastic_Sell_Level || Value_3_N_<=Stochastic_Sell_Level)
    {
     Stochastic_Filter_Sell_Main_TF=false;
     Stochastic_Filter_Sell_Signal_TF=false;
     Sub_iii=(iBars(Symbol_Full,Stochastic_Time_Frame)+9);     
    }

    if(Stochastic_Filter_Sell_Main_TF && Stochastic_Filter_Sell_Signal_TF)
    {
     Sub_iii=(iBars(Symbol_Full,Stochastic_Time_Frame)+9);     
    }
   }
  }
 }
 else
 {
  Stochastic_Filter_Buy_Main_TF=true;
  Stochastic_Filter_Sell_Main_TF=true;
  Stochastic_Filter_Buy_Signal_TF=true;
  Stochastic_Filter_Sell_Signal_TF=true;
 }
 
 if(MTF_BBands_Stops_TF)
 {
  Value_4_N_=iCustom(Symbol_Full,BBS_TimeFrame,"MTF_BBands Stops",BBS_Length,BBS_Deviation,BBS_MoneyRisk,BBS_Signal,BBS_Line,BBS_Nbars,PERIOD_CURRENT,4,1);
  Value_5_N_=iCustom(Symbol_Full,BBS_TimeFrame,"MTF_BBands Stops",BBS_Length,BBS_Deviation,BBS_MoneyRisk,BBS_Signal,BBS_Line,BBS_Nbars,PERIOD_CURRENT,5,1);

  if(Value_4_N_>Pointt && Value_4_N_<EMPTY_VALUE)
  {
   BBS_Buy_TF=true;
  }
  else if(Value_5_N_>Pointt && Value_5_N_<EMPTY_VALUE)
  {
   BBS_Sell_TF=true;
  }  
 }
 else
 {
  BBS_Buy_TF=true;
  BBS_Sell_TF=true;
 }

 if(Stratigy_B_Up_TF && Stratigy_B_Buy_TF && !Stratigy_B_Up_Last_TF)
 {
  Stratigy_B_Buy_TP=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Buy_TP));
 }

 if(Stratigy_B_Down_TF && Stratigy_B_Sell_TF && !Stratigy_B_Down_Last_TF)
 {
  Stratigy_B_Sell_TP=(Low_Price+(MathAbs(High_Price-Low_Price)*Fibo_Level_Sell_TP));
 }

 //Print("W "+FXMASTERY1_Buy_TF+" # "+FXMASTERY2_Buy_TF+" # "+FXMASTERY3_Buy_TF+" # "+MA_Buy_TF);
 if(MA_Buy_TF  && MA_Filter_Buy_TF  && MACD_Buy_TF  && ZZ_Filter_Buy_TF && Stochastic_Filter_Buy_Main_TF && Stochastic_Filter_Buy_Signal_TF && BBS_Buy_TF)
 {
  //Print("B "+Stratigy_B_Up_TF+" # "+Stratigy_B_Buy_TF+" # "+Stratigy_B_Up_Last_TF+" # "+Stratigy_B_Up_Price+" # "+Stratigy_B_Buy_TP+" # "+Stratigy_B_Final_Buy_TF);
  if(Stratigy_Type_List==0 && Fibo_Buy_TF)
  {
   Buy_TF=true;
   //Close_Sell_TF=true;
  }
  else if(Stratigy_Type_List==1 && Stratigy_B_Final_Buy_TF && Ask_>=Stratigy_B_Final_High_Price)
  {
   Buy_TF=true;
   Stratigy_B_Final_Buy_TF=false;
   //Print("W "+Buy__TP+" # "+Buy__SL+" # "+Low_Price+" # "+Low_Time);
   if(!Disable_Lines_and_Fibo_TF)
   {
    Set_Trend("Low_Price" ,Low_Color ,2,0,Low_Time,Low_Price ,TimeCurrent(),Low_Price ,DoubleToString(Low_Price,Digits_) );
   }
   //Comment(Temp_Orders+" # "+DoubleToString((1/Temp_Orders),0)); return;
   //Close_Sell_TF=true;
  }
 }
 //Print("W "+Stratigy_B_Up_TF+" # "+Stratigy_B_Down_TF+" # "+Stratigy_B_Buy_TF+" # "+Stratigy_B_Sell_TF+" # "+Stratigy_B_Up_Last_TF+" # "+Stratigy_B_Down_Last_TF+" # "+Stratigy_B_Up_Price+" # "+Stratigy_B_Down_Price+" # "+Stratigy_B_Buy_TP+" # "+Stratigy_B_Sell_TP);
 //Print(MA_Sell_TF && MA_Filter_Sell_TF && MACD_Sell_TF && ZZ_Filter_Sell_TF && Stochastic_Filter_Sell_Main_TF && Stochastic_Filter_Sell_Signal_TF);
 //Print(Stratigy_Type_List==1 && Stratigy_B_Sell_TF && Stratigy_B_Down_Last_TF);
 if(MA_Sell_TF && MA_Filter_Sell_TF && MACD_Sell_TF && ZZ_Filter_Sell_TF && Stochastic_Filter_Sell_Main_TF && Stochastic_Filter_Sell_Signal_TF && BBS_Sell_TF)
 {
  //Print("S "+Stratigy_B_Down_TF+" # "+Stratigy_B_Sell_TF+" # "+Stratigy_B_Down_Last_TF+" # "+Stratigy_B_Down_Price+" # "+Stratigy_B_Sell_TP+" # "+Stratigy_B_Final_Sell_TF);
  if(Stratigy_Type_List==0 && Fibo_Sell_TF)
  {
   Sell_TF=true;
   //Close_Sell_TF=true;
  }
  else if(Stratigy_Type_List==1 && Stratigy_B_Final_Sell_TF && Bid_<=Stratigy_B_Final_Low_Price)
  {
   Sell_TF=true;
   Stratigy_B_Final_Sell_TF=false;
   if(!Disable_Lines_and_Fibo_TF)
   {
    Set_Trend("High_Price",High_Color,2,0,High_Time,High_Price,TimeCurrent(),High_Price,DoubleToString(High_Price,Digits_));
   }
   //Close_Sell_TF=true;
  }
 }
 
 //Print("A "+Buy_TF);
 if(Buy_TF && Sub_RBOTM>0)
 {
  Buy_TF=false;
 }

 if(Sell_TF && Sub_RSOTM>0)
 {
  Sell_TF=false;
 }

 if(Buy_TF && Sub_RSOTM>0 && !Buy_and_sell_in_Same_Time_TF)
 {
  Buy_TF=false;
 }

 if(Sell_TF && Sub_RBOTM>0 && !Buy_and_sell_in_Same_Time_TF)
 {
  Sell_TF=false;
 }

 if(Buy_TF && Sell_TF)
 {
  Buy_TF=false;
  Sell_TF=false;
 }
 //Print("B "+Buy_TF);
 
 
 /*
 if(Buy_TF || Sell_TF)
 {
  LROTMH=LastRealOrdersTypeMH(Frame_MagicNumber);
  if(Buy_TF && LROTMH==OP_BUY)
  {
   Buy_TF=false;
  }
  else if(Sell_TF && LROTMH==OP_SELL)
  {
   Sell_TF=false;
  }
 }
 */
 if(Buy_TF || Sell_TF)
 {
  if(Buy_TF && RealBuyOrdersTotalM(Frame_MagicNumber)>0)
  {
   Buy_TF=false;
  }
  else if(Sell_TF && RealSellOrdersTotalM(Frame_MagicNumber)>0)
  {
   Sell_TF=false;
  }
 }
 
 if(Buy_TF || Sell_TF)
 {
  if(Minimum_Bars>0)
  {
   Sub_H_Time=(datetime) ObjectGetInteger(0,"High_Price",OBJPROP_TIME1);
   Sub_L_Time=(datetime) ObjectGetInteger(0,"Low_Price",OBJPROP_TIME1);
   Sub_H_Bar=iBarShift(Symbol_Full,PERIOD_CURRENT,Sub_H_Time);
   Sub_L_Bar=iBarShift(Symbol_Full,PERIOD_CURRENT,Sub_L_Time);
   if(MathAbs(Sub_H_Bar-Sub_L_Bar)<Minimum_Bars && Sub_H_Time>0 && Sub_L_Time>0)
   {
    Buy_TF=false;
    Sell_TF=false;
   }
  }
 }

 if(Reverse_Orders_onlY_when_Loss_TF && (Buy_TF || Sell_TF))
 {
  if(LastRealOPRMH(Frame_MagicNumber)<0)
  {
   if(Buy_TF && Temp_OTY==OP_BUY)
   {
    Buy_TF=false;
   }
   if(Sell_TF && Temp_OTY==OP_SELL)
   {
    Sell_TF=false;
   }
  }
 }
 //Print("C "+Buy_TF);
 
 return;
}

void Break_EvenBuyM(int Temp_Magic,double Temp_Break_Even,double Temp_Break_Even_P,string Sub_Comment=" ")
{
 double Temp_SL=0,Sub_Ask=0,Sub_Bid=0;
 bool   Sub_ODOC_TF=false;
 
 for(int i=0; i<OrdersTotal(); i++) 
 { 
  if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
  { 
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=(int) OrderTicket();
   int      OMNNNNNNNNNNNN=(int) OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();

   if(OSYYYYYYYYYYYY==Symbol_Full && OMNNNNNNNNNNNN==Temp_Magic && (StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 || Sub_Comment=="" || Sub_Comment==" "))
   { 
    Temp_SL=OOPPPPPPPPPPPP+(Temp_Break_Even_P*Pointt);
    Sub_Ask=MarketInfo(OSYYYYYYYYYYYY,MODE_ASK);
    Sub_Bid=MarketInfo(OSYYYYYYYYYYYY,MODE_BID);
    if(OTYYYYYYYYYYYY==OP_BUY  && ((Sub_Bid-OOPPPPPPPPPPPP)/Pointt)>=(Temp_Break_Even) && (OSLLLLLLLLLLLL<Temp_SL) && MathAbs(OSLLLLLLLLLLLL-Temp_SL)>=Point_)
    {
     Sub_ODOC_TF=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,Temp_SL,OTPPPPPPPPPPPP,0,CLR_NONE);
     if(Print_TF) Print("Modify Break Even Buy A");
     //Set_Trend(IntegerToString(OTIIIIIIIIIIII)+"BE",OBJ_TREND,OOTTTTTTTTTTTT,Temp_SL,OOTTTTTTTTTTTT,Temp_SL,1,clrNONE,false);
    }
   } 
  } 
 } 
 return;
} 

void Break_EvenSellM(int Temp_Magic,double Temp_Break_Even,double Temp_Break_Even_P,string Sub_Comment=" ")
{
 double Temp_SL=0,Sub_Ask=0,Sub_Bid=0;
 bool   Sub_ODOC_TF=false;

 for(int i=0; i<OrdersTotal(); i++) 
 { 
  if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
  { 
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=(int) OrderTicket();
   int      OMNNNNNNNNNNNN=(int) OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();

   if(OSYYYYYYYYYYYY==Symbol_Full && OMNNNNNNNNNNNN==Temp_Magic && (StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 || Sub_Comment=="" || Sub_Comment==" "))
   { 
    Temp_SL=OOPPPPPPPPPPPP-(Temp_Break_Even_P*Pointt);
    Sub_Ask=MarketInfo(OSYYYYYYYYYYYY,MODE_ASK);
    Sub_Bid=MarketInfo(OSYYYYYYYYYYYY,MODE_BID);
    if(OTYYYYYYYYYYYY==OP_SELL && ((OOPPPPPPPPPPPP-Sub_Ask)/Pointt)>=(Temp_Break_Even) && (OSLLLLLLLLLLLL<=Pointt || OSLLLLLLLLLLLL>Temp_SL) && MathAbs(OSLLLLLLLLLLLL-Temp_SL)>=Point_)
    {
     Sub_ODOC_TF=OrderModify(OTIIIIIIIIIIII,OOPPPPPPPPPPPP,Temp_SL,OTPPPPPPPPPPPP,0,CLR_NONE); 
     if(Print_TF) Print("Modify Break Even Sell A");
     //Set_Trend(IntegerToString(OTIIIIIIIIIIII)+"BE",OBJ_TREND,OOTTTTTTTTTTTT,Temp_SL,OOTTTTTTTTTTTT,Temp_SL,1,clrNONE,false);
    }
   } 
  } 
 } 
 return;
} 

void Duration_Void()
{
 Duration_Work_TF=true;
 // start of Sunday
 // end of Saturday
 return;
}

int PairsCount()
{
//return(0);
 int Sub_Result=0,Sub_Total=OrdersTotal(),Sub_iii_1_=0,Sub_iii_2_=0;
 string Sub_Pair[];
 bool Sub_New_Pair_TF=false;
 
 for(Sub_iii_1_=0; Sub_iii_1_<Sub_Total; Sub_iii_1_++)
 {
  if(OrderSelect(Sub_iii_1_,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   if(OTYYYYYYYYYYYY>=0 && OTYYYYYYYYYYYY<=5)
   {
    Sub_Result=ArraySize(Sub_Pair);
    Sub_New_Pair_TF=true;
    if(Sub_Result==0)
    {
     Sub_Result++;
     ArrayResize(Sub_Pair,Sub_Result);
     Sub_Pair[Sub_Result-1]=OSYYYYYYYYYYYY;
     Sub_New_Pair_TF=false;
    }
    else for(Sub_iii_2_=0; Sub_iii_2_<Sub_Result; Sub_iii_2_++)
    {
     //Print("F1 "+Sub_iii_2_+" # "+
     if(Sub_Pair[Sub_iii_2_]==OSYYYYYYYYYYYY)
     {
      Sub_New_Pair_TF=false;
      Sub_iii_2_=(Sub_Result+9);
     }
    }
    if(Sub_New_Pair_TF)
    {
     Sub_Result=ArraySize(Sub_Pair);
     Sub_Result++;
     ArrayResize(Sub_Pair,Sub_Result);
     Sub_Pair[Sub_Result-1]=OSYYYYYYYYYYYY;
     Sub_New_Pair_TF=false;
    }    
   }
  }
 }
 Sub_Result=ArraySize(Sub_Pair);

 return(Sub_Result);
}

void Set_Trend(string Sub_Name, color Sub_Color, int Sub_Width, int Sub_Style, datetime Sub_Time_1_, double Sub_Price_1_, datetime Sub_Time_2_, double Sub_Price_2_,string Sub_Lot_S_)
{
 ObjectDelete(0,Sub_Name);
 ObjectCreate(0,Sub_Name, OBJ_TREND, 0, Sub_Time_1_, Sub_Price_1_, Sub_Time_2_, Sub_Price_2_);
 ObjectSet(Sub_Name, OBJPROP_COLOR, Sub_Color);
 ObjectSet(Sub_Name, OBJPROP_STYLE, Sub_Style);
 ObjectSet(Sub_Name, OBJPROP_WIDTH, Sub_Width);
 ObjectSet(Sub_Name, OBJPROP_BACK, 0);
 ObjectSet(Sub_Name,OBJPROP_RAY, 0);
 ObjectSetString(0,Sub_Name,OBJPROP_TEXT,Sub_Lot_S_);
 return;
}

bool FiboLevelsCreate(const long            chart_ID=0,        // chart's ID 
                      const string          name="FiboLevels", // object name 
                      const int             sub_window=0,      // subwindow index  
                      datetime              time1=0,           // first point time 
                      double                price1=0,          // first point price 
                      datetime              time2=0,           // second point time 
                      double                price2=0,          // second point price 
                      const color           clr=clrRed,        // object color 
                      const ENUM_LINE_STYLE style=STYLE_SOLID, // object line style 
                      const int             width=1,           // object line width 
                      const bool            back=false,        // in the background 
                      const bool            selection=true,    // highlight to move 
                      const bool            ray_right=false,   // object's continuation to the right 
                      const bool            hidden=true,       // hidden in the object list 
                      const long            z_order=0)         // priority for mouse click 
{ 
//--- set anchor points' coordinates if they are not set 
//--- reset the error value 
 ObjectDelete(chart_ID,name);
 ResetLastError(); 
//--- Create Fibonacci Retracement by the given coordinates 
 ObjectCreate(chart_ID,name,OBJ_FIBO,sub_window,time1,price1,time2,price2); 
//--- set color 
 ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- set line style 
 ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
//--- set line width 
 ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width); 
//--- display in the foreground (false) or background (true) 
 ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- enable (true) or disable (false) the mode of highlighting the channel for moving 
//--- when creating a graphical object using ObjectCreate function, the object cannot be 
//--- highlighted and moved by default. Inside this method, selection parameter 
//--- is true by default making it possible to highlight and move the object 
 ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
 ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- enable (true) or disable (false) the mode of continuation of the object's display to the right 
 ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right); 
//--- hide (true) or display (false) graphical object name in the object list 
 ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- set the priority for receiving the event of a mouse click in the chart 
 ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
 ObjectSetInteger(chart_ID,name,OBJPROP_RAY,false); 
//--- successful execution 
 return(true); 
} 

bool FiboLevelsSet(int             Sub_levels,            // number of level lines 
                   double          &Sub_values[],         // values of level lines 
                   color           &Sub_colors[],         // color of level lines 
                   ENUM_LINE_STYLE &Sub_styles[],         // style of level lines 
                   int             &Sub_widths[],         // width of level lines 
                   const long      Sub_chart_ID=0,        // chart's ID 
                   const string    Sub_name="FiboLevels") // object name 
{ 
//--- check array sizes 
 if(Sub_levels!=ArraySize(Sub_colors) || Sub_levels!=ArraySize(Sub_styles) || Sub_levels!=ArraySize(Sub_widths) || Sub_levels!=ArraySize(Sub_widths)) 
 { 
  Print(__FUNCTION__,": array length does not correspond to the number of levels, error!"); 
  return(false); 
 } 
//--- set the number of levels 
 ObjectSetInteger(Sub_chart_ID,Sub_name,OBJPROP_LEVELS,Sub_levels); 
//--- set the properties of levels in the loop 
 for(int Sub_i=0;Sub_i<Sub_levels;Sub_i++) 
 { 
      //--- level value 
 //Print("A "+Sub_i+" # "+Sub_chart_ID+" # "+Sub_name+" # "+Sub_i+" # "+Sub_values[Sub_i]+" # "+ObjectSetInteger(Sub_chart_ID,Sub_name,OBJPROP_LEVELS,Sub_levels));
  ObjectSetDouble(Sub_chart_ID,Sub_name,OBJPROP_LEVELVALUE,Sub_i,Sub_values[Sub_i]); 
    //--- level color 
  ObjectSetInteger(Sub_chart_ID,Sub_name,OBJPROP_LEVELCOLOR,Sub_i,Sub_colors[Sub_i]); 
      //--- level style 
  ObjectSetInteger(Sub_chart_ID,Sub_name,OBJPROP_LEVELSTYLE,Sub_i,Sub_styles[Sub_i]); 
      //--- level width 
  ObjectSetInteger(Sub_chart_ID,Sub_name,OBJPROP_LEVELWIDTH,Sub_i,Sub_widths[Sub_i]); 
      //--- level description 
  ObjectSetString(Sub_chart_ID,Sub_name,OBJPROP_LEVELTEXT,Sub_i,DoubleToString(100*Sub_values[Sub_i],1)); 
 } 
//--- successful execution 
 return(true); 
} 

void Objects_Delete(string Sub_Name_1_)
{
 string Sub_Name_2_;
 int Sub_iii_1_=0,Sub_iii_2_=0;
 
 for(Sub_iii_1_=0; Sub_iii_1_<=Repeat; Sub_iii_1_++)
 {
  if(ObjectsTotal()>0)
  {
   for(Sub_iii_2_=0;Sub_iii_2_<ObjectsTotal();Sub_iii_2_++)
   {
    Sub_Name_2_=ObjectName(0,Sub_iii_2_);
    if(StringFind(Sub_Name_2_,Sub_Name_1_,0)>=0)
    {
     ObjectDelete(0,Sub_Name_2_);
     if(Sub_Name_2_!="FiboZ")
     {
      Print("Objects_Delete "+Sub_Name_2_);
     }
    }
   }
  }
 }
 return;
}

double RealOrdersProfitByTimeM(int Magic,datetime TTT_)
{
 double c=0;
 int total= OrdersTotal();
 
 for(int cnt= 0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();

   if(OMNNNNNNNNNNNN==Magic && OSYYYYYYYYYYYY==Symbol_Full && OOTTTTTTTTTTTT>=TTT_ && OTYYYYYYYYYYYY<=1)
   c=c+OPRRRRRRRRRRRR;
  }
 }
 return(c);
}

double ZigZag(int Sub_Shift,int Sub_Period,string Sub_Symbol,int Sub_ZZ_Depth,int Sub_ZZ_Deviation,int Sub_ZZ_Backstep,int Sub_iii_1_)
{
 int Sub_Z=0;
 double Sub_ZZ;
 for(int Sub_iii_2_=Sub_iii_1_;Sub_iii_2_<(Bars-1);Sub_iii_2_++)
 {
  Sub_ZZ=iCustom(Sub_Symbol,Sub_Period,"ZigZag",Sub_ZZ_Depth,Sub_ZZ_Deviation,Sub_ZZ_Backstep,0,Sub_iii_2_);
  if(Sub_ZZ!=0) Sub_Z++;
  if(Sub_Shift==Sub_Z)
  {
   //Comment("ZZ");
   return(Sub_ZZ);
  }
 }
 
 return(0); 
}

int ZigZag_Candle(int Sub_C,int Sub_Period,string Sub_Symbol,int Sub_ZZ_Depth,int Sub_ZZ_Deviation,int Sub_ZZ_Backstep,int Sub_iii_1_)
{
 int Sub_Z=0;
 double Sub_ZZ;
 for(int Sub_iii_2_=Sub_iii_1_;Sub_iii_2_<(Bars-1);Sub_iii_2_++)
 {
  Sub_ZZ=iCustom(Sub_Symbol,Sub_Period,"ZigZag",Sub_ZZ_Depth,Sub_ZZ_Deviation,Sub_ZZ_Backstep,0,Sub_iii_2_);
  if(Sub_ZZ!=0) Sub_Z++;
  if(Sub_Z==Sub_C)
  {
   //Comment("(Z==C)");
   return(Sub_iii_2_);
  }
 }
 
 return(0); 
}

string LastOCOMH(int Temp_Magic,int Sub_Big_Ticket=0)
{
 string Temp_Result="";
 int Temp_Total=OrdersHistoryTotal();
 datetime Sub_OCT=0;
 
 for(int Temp_cnt=0 ; Temp_cnt < Temp_Total ; Temp_cnt++)
 {
  if(OrderSelect(Temp_cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   if(OMNNNNNNNNNNNN==Temp_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && Sub_OCT<OCTTTTTTTTTTTT && (Sub_Big_Ticket==0 || OTIIIIIIIIIIII<Sub_Big_Ticket))
   {
    Sub_OCT=OCTTTTTTTTTTTT;
    Temp_Result=OCOOOOOOOOOOOO;
    Last_Profit=OPRRRRRRRRRRRR;
    Last_Ticket=OTIIIIIIIIIIII;
    Last_OOT=OOTTTTTTTTTTTT;
   }
  }
 }
 return(Temp_Result);
}

void Required_Lots_Void(double Sub_OOP,double Sub_SL)
{
 double Sub_M_TV=0,Sub_Risk=0,Sub_V_=0,Sub_Profit=0,Sub_Sum=0;
 string Sub_OCO,Sub_Name;
 int Sub_Beg=0,Sub_End=0,Sub_i_1_=0;
 bool Sub_Risk_TF=false;
 
 Required_Lots=First_Lots;
 //Frame_MagicComment2=Custom_Comment;

 if(Auto_Lots_TF)
 {
  Sub_OCO=LastOCOMH(Frame_MagicNumber);
  //Sub_Profit=SumProfitMH(Frame_MagicNumber,Sub_OCO,Last_OOT);
  //Print("A "+Sub_OCO+" # "+Sub_Profit);

  if(StringFind(Sub_OCO,Custom_Comment+"#",0)>=0)
  {
  //@A#0$0% (801)
   Sub_Beg=StringLen(Custom_Comment)+1;
   Sub_End=StringFind(Sub_OCO,"$",Sub_Beg+1);
   Sub_Name=StringSubstr(Sub_OCO,Sub_Beg,Sub_End-Sub_Beg);
   Group_Lot=(int) Sub_Name;

   Sub_Beg=Sub_End+1;
   Sub_End=StringFind(Sub_OCO,"%",Sub_Beg+1);
   Sub_Name=StringSubstr(Sub_OCO,Sub_Beg,Sub_End-Sub_Beg);
   Series_Count=(int) Sub_Name;
   //Print("A "+Sub_OCO+" # "+Last_Profit);
   
   Sub_Risk_TF=false;
   if(Last_Profit<0)
   {
    Sub_Sum=SumProfitMH(Frame_MagicNumber,Last_Profit_Ticket);

    //Print("B "+Sub_Sum+" # "+Last_Profit_Ticket);//Sub_Beg+" # "+Sub_End+" # "+Sub_Name+" # "+Sub_Profit);
    
    Series_Count++;   
    Sub_Risk_TF=true;
   }
   else
   {
    Last_Profit_Ticket=Last_Ticket;
    if(Series_Count==1)
    {
     Group_Lot++;
    }
    else
    {
     Series_Count=1;
    }
   }
  }
  else
  {
   Group_Lot=0;
   Series_Count=1;
  }

  if(Max_Lot_Group>0 && Group_Lot>Max_Lot_Group)
  {
   if(Max_Lot_Group_List==0)
   {
    Stop_Working_TF=true;
   }
   else if(Max_Lot_Group_List==1)
   {
    Group_Lot=0;
   }
  }
  
  Variable_B_for_Lot=Variable_B_for_Lot_;
  if(Variable_B_for_Lot<0.01)
  {
   if(Last_Equity<0.01)
   {
    Last_Equity=AccountEquity();
   }
   Variable_B_for_Lot=Last_Equity;
  }
  
  Sub_Risk=(MathPow(Variable_A_for_Lot,Group_Lot)*Variable_B_for_Lot*Variable_C_for_Lot);
  //Print("A "+Sub_Risk+" # "+Sub_Risk_TF+" # "+Divide_Number);
  if(Sub_Risk_TF && Divide_Number>0)
  {
   Sub_Risk=(Sub_Sum/Divide_Number);
   //Print("B "+Sub_Risk);
  }  
  Sub_Risk=MathAbs(Sub_Risk);
  //Print("C "+Sub_Risk);
  
  Sub_M_TV=MarketInfo(Symbol_Full,MODE_TICKVALUE);
  
  Sub_V_=(MathAbs(Sub_OOP-Sub_SL)/Point_);
  
  if(Sub_V_>0)
  {
   Required_Lots=NormalizeDouble((Sub_Risk/Sub_M_TV/Sub_V_),Lot_D);
   //Print("A "+Required_Lots);
  }
 }
 Frame_MagicComment2=Custom_Comment+"#"+IntegerToString(Group_Lot)+"$"+IntegerToString(Series_Count)+"%";
 //Print("W "+Sub_Risk+" # "+Group_Lot+" # "+Series_Count+" # "+Sub_Sum+" # "+Sub_Risk_TF+" # "+Sub_V_+" # "+Sub_OOP+" # "+Sub_SL);
 
 Final_Lots=Required_Lots;
 Final_Risk=Sub_Risk;
 M_TV=Sub_M_TV;
 //Print("W "+Final_Lots+" # "+Final_Risk+" # "+Buy__SL+" # "+Buy__TP);
 return;
}

/*
double SumProfitMH(int Sub_Magic,string Sub_Comment,datetime Sub_OOT)
{
 double Sub_Result=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   //Print("B "+OTIIIIIIIIIIII+" # "+OCTTTTTTTTTTTT+" # "+Sub_OOT);//(OMNNNNNNNNNNNN==Sub_Magic)+" # "+(OSYYYYYYYYYYYY==Symbol_Full)+" # "+(OTYYYYYYYYYYYY<=1)+" # "+(StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0)+" # "+(OCTTTTTTTTTTTT>Sub_OOT));
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0 && OCTTTTTTTTTTTT>Sub_OOT)
   {
    Sub_Result=(Sub_Result+OPRRRRRRRRRRRR);
   }
  }
 }
 return(Sub_Result);
}
*/

double SumProfitMH(int Sub_Magic,int Sub_Small_Ticket)
{
 double Sub_Result=0;
 int total=OrdersHistoryTotal();
 
 for(int cnt=0 ; cnt < total ; cnt++)
 {
  if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY))
  {
   double   OOPPPPPPPPPPPP=OrderOpenPrice();
   double   OSLLLLLLLLLLLL=OrderStopLoss();
   double   OTPPPPPPPPPPPP=OrderTakeProfit();
   double   OLOOOOOOOOOOOO=OrderLots();
   double   OCPPPPPPPPPPPP=OrderClosePrice();
   double   OPRRRRRRRRRRRR=OrderProfit()+OrderCommission()+OrderSwap();
   int      OTIIIIIIIIIIII=OrderTicket();
   int      OMNNNNNNNNNNNN=OrderMagicNumber();
   int      OTYYYYYYYYYYYY=OrderType();
   string   OSYYYYYYYYYYYY=OrderSymbol();
   string   OCOOOOOOOOOOOO=OrderComment();
   datetime OOTTTTTTTTTTTT=OrderOpenTime();
   datetime OCTTTTTTTTTTTT=OrderCloseTime();
   //Print("B "+OTIIIIIIIIIIII+" # "+OCTTTTTTTTTTTT+" # "+Sub_OOT);//(OMNNNNNNNNNNNN==Sub_Magic)+" # "+(OSYYYYYYYYYYYY==Symbol_Full)+" # "+(OTYYYYYYYYYYYY<=1)+" # "+(StringFind(OCOOOOOOOOOOOO,Sub_Comment,0)>=0)+" # "+(OCTTTTTTTTTTTT>Sub_OOT));
   if(OMNNNNNNNNNNNN==Sub_Magic && OSYYYYYYYYYYYY==Symbol_Full && OTYYYYYYYYYYYY<=1 && OTIIIIIIIIIIII>Sub_Small_Ticket)
   {
    Sub_Result=(Sub_Result+OPRRRRRRRRRRRR);
   }
  }
 }
 return(Sub_Result);
}

