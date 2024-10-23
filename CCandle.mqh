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
        
        bool NewCandle(ENUM_TIMEFRAMES TimeFrame);
        
        int getMaxIndexCandle(ENUM_TIMEFRAMES timeframe, int numBar);
        int getMinIndexCandle(ENUM_TIMEFRAMES timeframe, int numBar);
        double getMaxPriceCandle(ENUM_TIMEFRAMES timeframe, int numBar);
        double getMinPriceCandle(ENUM_TIMEFRAMES timeframe, int numBar);
                
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
   
   
int CCandle::getMaxIndexCandle(ENUM_TIMEFRAMES timeframe, int numBar)
   {
      return (iHighest(_Symbol, timeframe, MODE_HIGH, numBar, 1));
   }

double CCandle::getMaxPriceCandle(ENUM_TIMEFRAMES timeframe,int numBar)
   {
      int index = getMaxIndexCandle(timeframe, numBar);
      return iHigh(_Symbol, timeframe, index);
   }
   
int CCandle::getMinIndexCandle(ENUM_TIMEFRAMES timeframe, int numBar)
   {
      return (iLowest(_Symbol, timeframe, MODE_LOW, numBar, 1));
   }

double CCandle::getMinPriceCandle(ENUM_TIMEFRAMES timeframe,int numBar)
   {
      int index = getMinIndexCandle(timeframe, numBar);
      return iLow(_Symbol, timeframe, index);
   }   
   