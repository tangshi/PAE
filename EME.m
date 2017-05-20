function eme = EME(X)

[h w] = size(X);

patch_size = 8;

k1 = h / patch_size;
k2 = w / patch_size;

K = k1 * k2;

eme = 0;

for i = 1:k1
    for j= 1:k2
        
       yy =  (i-1) * patch_size + 1;
       xx =  (j-1) * patch_size + 1;
        
       m =  X(yy:yy+patch_size-1, xx:xx+patch_size-1);
       
       minValue = double(min(m(:))) + 1;
       maxValue = double(max(m(:))) + 1;
           
       
       diff = maxValue / minValue;
      
       eme = eme + 20*log(diff);

    end
end

eme = eme / K;

end