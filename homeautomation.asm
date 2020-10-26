String voice;
#define relay1 2    
#define relay2 3    
void setup()
{
  Serial.begin(9600);            
  pinMode(relay1, OUTPUT);       
  pinMode(relay2, OUTPUT);       
  digitalWrite(relay1, LOW);     
  digitalWrite(relay2, LOW);     
}
void loop()
{
  while(Serial.available())    
  {
    delay(10);                 
    char c = Serial.read();    
    if (c == '#'){
      break;                   
    }
    voice += c;                
  }
    if (voice.length() >0)
    {
      Serial.println(voice);
      if(voice == "*switch on"){
        switchon();
      }               
      else if(voice == "*switch off"){
        switchoff();
      }             
                                                     //You can replace 'lamp on' with anything you want...same applies to others  
      else if(voice == "*fan on")
      {   

        digitalWrite(relay1, HIGH);
      }
      else if(voice == "*fan off"){
        digitalWrite(relay1, LOW);
      }
      else if(voice == "*tube  on"){
        digitalWrite(relay2, HIGH);
      }
      else if(voice == "*tube  off"){
        digitalWrite(relay2, LOW);
      }
      voice="";
    }
}
void switchon()              
  digitalWrite(relay1, HIGH);
  digitalWrite(relay2, HIGH);
}
void switchoff()              
{
  digitalWrite(relay1, LOW);
  digitalWrite(relay2, LOW);
}

/*
   
   void ......()
   {
     digitalWrite(...., LOW/HIGH);
     digitalWrite(...., LOW/HIGH);
   }