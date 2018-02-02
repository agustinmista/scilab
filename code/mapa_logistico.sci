function ans = mapa_logistico(x0, iters)
  
  if iters == 0
    ans = []
  else
    rec = mapa_logistico(4 * x0 * (1 - x0), iters - 1) 
    ans = [x0, rec] 
  end
  
endfunction

plot(abs(mapa_logistico(0.123456788, 25) - mapa_logistico(0.123456789, 25)))