

Generate RSA keys
-----------------

a) Using ssh-keygen (Linux)
---------------------------
ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -C "malloy@linux" \
    -f key 


b) Using ssh-keygen (Windows)
-----------------------------
ssh-keygen `
    -m PEM `
    -t rsa `
    -b 4096 `
    -C "malloy@linux" `
    -f key 


The private key will be stored in "./key" file and has to have "400" permissions!


Access to the VM
----------------
ssh -i ./key malloy@x.y.z.w

