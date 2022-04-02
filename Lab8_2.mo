model Lab8_2
  parameter Real p_cr = 44;
  parameter Real tau1 = 26;
  parameter Real p1 = 11;
  parameter Real tau2 = 21;
  parameter Real p2 = 8.7;
  parameter Real N = 77;
  parameter Real q = 1;
  
  parameter Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
  parameter Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
  parameter Real b = p_cr/(tau1*tau1* tau2*tau2*p1*p1*p2*p2*N*q);
  parameter Real c1 = (p_cr-p1)/(tau1*p1);
  parameter Real c2 = (p_cr-p2)/(tau2*p2); 
  
  Real M1 (start=7.1);
  Real M2 (start=8.1);
equation
  der(M1)=M1-(b/(c1+0.0013))*M1*M2-a1/c1*M1*M1;
  der(M2)=c2/c1*M2-b/c1*M1*M2-a2/c1*M2*M2;
end Lab8_2;
