//+------------------------------------------------------------------+
//|                                                         Core.mqh |
//|                                                   Kayro Schembek |
//|                      https://www.mql5.com/pt/users/kayroschembek |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.mql5.com/pt/users/kayroschembek"

class CCandle
  {
      public:
         CCandle(void)  { };
        ~CCandle(void)  { };
        
        bool NewCandle(ENUM_TIMEFRAMES TimeFrame); // ou CCandle::NewCandle();
        
        
        double getAskPrice();
        double getBidPrice();
  };
  
  
bool CCandle::NewCandle(ENUM_TIMEFRAMES TimeFrame)
   {
      static int indice = 0;
      int novo_indice = Bars(_Symbol, TimeFrame); 
      if(indice != novo_indice)
         {
            indice = novo_indice;
            return true;
         } 
      return false;   
   }
   
double CCandle::getAskPrice()
   {
      MqlTick mqlTick;
      if(SymbolInfoTick(_Symbol, mqlTick))
         return mqlTick.ask;
      return SymbolInfoDouble(_Symbol, SYMBOL_ASK);   
   }
   
double CCandle::getBidPrice()   
   {
      MqlTick mqlTick;
      if(SymbolInfoTick(_Symbol, mqlTick))
         return mqlTick.bid;
      return SymbolInfoDouble(_Symbol, SYMBOL_BID);   
   }