
test.elf:     file format elf32-littlearm


Disassembly of section .text:

08000000 <table_interrupt_vector>:
 8000000:	00 50 00 20 39 2d 00 08 99 2d 00 08 99 2d 00 08     .P. 9-...-...-..
 8000010:	99 2d 00 08 99 2d 00 08 99 2d 00 08 00 00 00 00     .-...-...-......
	...
 800002c:	99 2d 00 08 99 2d 00 08 00 00 00 00 99 2d 00 08     .-...-.......-..
 800003c:	a1 18 00 08 99 2d 00 08 99 2d 00 08 99 2d 00 08     .....-...-...-..
 800004c:	99 2d 00 08 99 2d 00 08 99 2d 00 08 99 2d 00 08     .-...-...-...-..
 800005c:	99 2d 00 08 99 2d 00 08 99 2d 00 08 bd 18 00 08     .-...-...-......
 800006c:	99 2d 00 08 99 2d 00 08 99 2d 00 08 99 2d 00 08     .-...-...-...-..
 800007c:	99 2d 00 08 99 2d 00 08 99 2d 00 08 0d 19 00 08     .-...-...-......
 800008c:	99 2d 00 08 99 2d 00 08 99 2d 00 08 99 2d 00 08     .-...-...-...-..
 800009c:	99 2d 00 08 99 2d 00 08 99 2d 00 08 99 2d 00 08     .-...-...-...-..
 80000ac:	99 2d 00 08 55 1a 00 08 99 2d 00 08 99 2d 00 08     .-..U....-...-..
 80000bc:	99 2d 00 08 99 2d 00 08 99 2d 00 08 99 2d 00 08     .-...-...-...-..
 80000cc:	99 2d 00 08 99 2d 00 08 71 0d 00 08 3d 10 00 08     .-...-..q...=...
 80000dc:	99 2d 00 08 99 2d 00 08 99 2d 00 08 99 2d 00 08     .-...-...-...-..

080000ec <strstr>:
 80000ec:	b4b0      	push	{r4, r5, r7}
 80000ee:	b083      	sub	sp, #12
 80000f0:	af00      	add	r7, sp, #0
 80000f2:	6078      	str	r0, [r7, #4]
 80000f4:	6039      	str	r1, [r7, #0]
 80000f6:	687c      	ldr	r4, [r7, #4]
 80000f8:	683d      	ldr	r5, [r7, #0]
 80000fa:	782b      	ldrb	r3, [r5, #0]
 80000fc:	2b00      	cmp	r3, #0
 80000fe:	d101      	bne.n	8000104 <strstr+0x18>
 8000100:	687b      	ldr	r3, [r7, #4]
 8000102:	e011      	b.n	8000128 <strstr+0x3c>
 8000104:	782a      	ldrb	r2, [r5, #0]
 8000106:	7823      	ldrb	r3, [r4, #0]
 8000108:	429a      	cmp	r2, r3
 800010a:	d102      	bne.n	8000112 <strstr+0x26>
 800010c:	3501      	adds	r5, #1
 800010e:	3401      	adds	r4, #1
 8000110:	e7f3      	b.n	80000fa <strstr+0xe>
 8000112:	683d      	ldr	r5, [r7, #0]
 8000114:	7823      	ldrb	r3, [r4, #0]
 8000116:	2b00      	cmp	r3, #0
 8000118:	d101      	bne.n	800011e <strstr+0x32>
 800011a:	2300      	movs	r3, #0
 800011c:	e004      	b.n	8000128 <strstr+0x3c>
 800011e:	687b      	ldr	r3, [r7, #4]
 8000120:	3301      	adds	r3, #1
 8000122:	607b      	str	r3, [r7, #4]
 8000124:	687c      	ldr	r4, [r7, #4]
 8000126:	e7e8      	b.n	80000fa <strstr+0xe>
 8000128:	4618      	mov	r0, r3
 800012a:	370c      	adds	r7, #12
 800012c:	46bd      	mov	sp, r7
 800012e:	bcb0      	pop	{r4, r5, r7}
 8000130:	4770      	bx	lr
 8000132:	bf00      	nop

08000134 <strncmp>:
 8000134:	b480      	push	{r7}
 8000136:	b087      	sub	sp, #28
 8000138:	af00      	add	r7, sp, #0
 800013a:	60f8      	str	r0, [r7, #12]
 800013c:	60b9      	str	r1, [r7, #8]
 800013e:	607a      	str	r2, [r7, #4]
 8000140:	2300      	movs	r3, #0
 8000142:	617b      	str	r3, [r7, #20]
 8000144:	bf00      	nop
 8000146:	687b      	ldr	r3, [r7, #4]
 8000148:	1e5a      	subs	r2, r3, #1
 800014a:	607a      	str	r2, [r7, #4]
 800014c:	2b00      	cmp	r3, #0
 800014e:	d011      	beq.n	8000174 <strncmp+0x40>
 8000150:	68fb      	ldr	r3, [r7, #12]
 8000152:	781b      	ldrb	r3, [r3, #0]
 8000154:	4619      	mov	r1, r3
 8000156:	68bb      	ldr	r3, [r7, #8]
 8000158:	1c5a      	adds	r2, r3, #1
 800015a:	60ba      	str	r2, [r7, #8]
 800015c:	781b      	ldrb	r3, [r3, #0]
 800015e:	1acb      	subs	r3, r1, r3
 8000160:	617b      	str	r3, [r7, #20]
 8000162:	697b      	ldr	r3, [r7, #20]
 8000164:	2b00      	cmp	r3, #0
 8000166:	d105      	bne.n	8000174 <strncmp+0x40>
 8000168:	68fb      	ldr	r3, [r7, #12]
 800016a:	1c5a      	adds	r2, r3, #1
 800016c:	60fa      	str	r2, [r7, #12]
 800016e:	781b      	ldrb	r3, [r3, #0]
 8000170:	2b00      	cmp	r3, #0
 8000172:	d1e8      	bne.n	8000146 <strncmp+0x12>
 8000174:	697b      	ldr	r3, [r7, #20]
 8000176:	4618      	mov	r0, r3
 8000178:	371c      	adds	r7, #28
 800017a:	46bd      	mov	sp, r7
 800017c:	bc80      	pop	{r7}
 800017e:	4770      	bx	lr

08000180 <strlen>:
 8000180:	b490      	push	{r4, r7}
 8000182:	b082      	sub	sp, #8
 8000184:	af00      	add	r7, sp, #0
 8000186:	6078      	str	r0, [r7, #4]
 8000188:	687c      	ldr	r4, [r7, #4]
 800018a:	e000      	b.n	800018e <strlen+0xe>
 800018c:	3401      	adds	r4, #1
 800018e:	7823      	ldrb	r3, [r4, #0]
 8000190:	2b00      	cmp	r3, #0
 8000192:	d1fb      	bne.n	800018c <strlen+0xc>
 8000194:	4622      	mov	r2, r4
 8000196:	687b      	ldr	r3, [r7, #4]
 8000198:	1ad3      	subs	r3, r2, r3
 800019a:	4618      	mov	r0, r3
 800019c:	3708      	adds	r7, #8
 800019e:	46bd      	mov	sp, r7
 80001a0:	bc90      	pop	{r4, r7}
 80001a2:	4770      	bx	lr

080001a4 <itoa>:
 80001a4:	b480      	push	{r7}
 80001a6:	b087      	sub	sp, #28
 80001a8:	af00      	add	r7, sp, #0
 80001aa:	6078      	str	r0, [r7, #4]
 80001ac:	6039      	str	r1, [r7, #0]
 80001ae:	2303      	movs	r3, #3
 80001b0:	617b      	str	r3, [r7, #20]
 80001b2:	683a      	ldr	r2, [r7, #0]
 80001b4:	4b20      	ldr	r3, [pc, #128]	; (8000238 <itoa+0x94>)
 80001b6:	fba3 1302 	umull	r1, r3, r3, r2
 80001ba:	08d9      	lsrs	r1, r3, #3
 80001bc:	460b      	mov	r3, r1
 80001be:	009b      	lsls	r3, r3, #2
 80001c0:	440b      	add	r3, r1
 80001c2:	005b      	lsls	r3, r3, #1
 80001c4:	1ad3      	subs	r3, r2, r3
 80001c6:	60fb      	str	r3, [r7, #12]
 80001c8:	683b      	ldr	r3, [r7, #0]
 80001ca:	4a1b      	ldr	r2, [pc, #108]	; (8000238 <itoa+0x94>)
 80001cc:	fba2 2303 	umull	r2, r3, r2, r3
 80001d0:	08db      	lsrs	r3, r3, #3
 80001d2:	603b      	str	r3, [r7, #0]
 80001d4:	68fb      	ldr	r3, [r7, #12]
 80001d6:	b2d9      	uxtb	r1, r3
 80001d8:	f107 0208 	add.w	r2, r7, #8
 80001dc:	697b      	ldr	r3, [r7, #20]
 80001de:	4413      	add	r3, r2
 80001e0:	460a      	mov	r2, r1
 80001e2:	701a      	strb	r2, [r3, #0]
 80001e4:	683b      	ldr	r3, [r7, #0]
 80001e6:	2b00      	cmp	r3, #0
 80001e8:	d003      	beq.n	80001f2 <itoa+0x4e>
 80001ea:	697b      	ldr	r3, [r7, #20]
 80001ec:	3b01      	subs	r3, #1
 80001ee:	617b      	str	r3, [r7, #20]
 80001f0:	e7df      	b.n	80001b2 <itoa+0xe>
 80001f2:	bf00      	nop
 80001f4:	2300      	movs	r3, #0
 80001f6:	613b      	str	r3, [r7, #16]
 80001f8:	e00f      	b.n	800021a <itoa+0x76>
 80001fa:	693b      	ldr	r3, [r7, #16]
 80001fc:	1c5a      	adds	r2, r3, #1
 80001fe:	613a      	str	r2, [r7, #16]
 8000200:	687a      	ldr	r2, [r7, #4]
 8000202:	4413      	add	r3, r2
 8000204:	f107 0108 	add.w	r1, r7, #8
 8000208:	697a      	ldr	r2, [r7, #20]
 800020a:	440a      	add	r2, r1
 800020c:	7812      	ldrb	r2, [r2, #0]
 800020e:	3230      	adds	r2, #48	; 0x30
 8000210:	b2d2      	uxtb	r2, r2
 8000212:	701a      	strb	r2, [r3, #0]
 8000214:	697b      	ldr	r3, [r7, #20]
 8000216:	3301      	adds	r3, #1
 8000218:	617b      	str	r3, [r7, #20]
 800021a:	697b      	ldr	r3, [r7, #20]
 800021c:	2b03      	cmp	r3, #3
 800021e:	d9ec      	bls.n	80001fa <itoa+0x56>
 8000220:	687a      	ldr	r2, [r7, #4]
 8000222:	693b      	ldr	r3, [r7, #16]
 8000224:	4413      	add	r3, r2
 8000226:	2200      	movs	r2, #0
 8000228:	701a      	strb	r2, [r3, #0]
 800022a:	693b      	ldr	r3, [r7, #16]
 800022c:	4618      	mov	r0, r3
 800022e:	371c      	adds	r7, #28
 8000230:	46bd      	mov	sp, r7
 8000232:	bc80      	pop	{r7}
 8000234:	4770      	bx	lr
 8000236:	bf00      	nop
 8000238:	cccccccd 	.word	0xcccccccd

0800023c <atoi>:
 800023c:	b480      	push	{r7}
 800023e:	b085      	sub	sp, #20
 8000240:	af00      	add	r7, sp, #0
 8000242:	6078      	str	r0, [r7, #4]
 8000244:	2300      	movs	r3, #0
 8000246:	60bb      	str	r3, [r7, #8]
 8000248:	2300      	movs	r3, #0
 800024a:	60fb      	str	r3, [r7, #12]
 800024c:	687b      	ldr	r3, [r7, #4]
 800024e:	2b00      	cmp	r3, #0
 8000250:	d010      	beq.n	8000274 <atoi+0x38>
 8000252:	bf00      	nop
 8000254:	687b      	ldr	r3, [r7, #4]
 8000256:	781b      	ldrb	r3, [r3, #0]
 8000258:	2b20      	cmp	r3, #32
 800025a:	d003      	beq.n	8000264 <atoi+0x28>
 800025c:	687b      	ldr	r3, [r7, #4]
 800025e:	781b      	ldrb	r3, [r3, #0]
 8000260:	2b09      	cmp	r3, #9
 8000262:	d109      	bne.n	8000278 <atoi+0x3c>
 8000264:	687b      	ldr	r3, [r7, #4]
 8000266:	3301      	adds	r3, #1
 8000268:	607b      	str	r3, [r7, #4]
 800026a:	687b      	ldr	r3, [r7, #4]
 800026c:	781b      	ldrb	r3, [r3, #0]
 800026e:	2b00      	cmp	r3, #0
 8000270:	d1f0      	bne.n	8000254 <atoi+0x18>
 8000272:	e001      	b.n	8000278 <atoi+0x3c>
 8000274:	2300      	movs	r3, #0
 8000276:	e032      	b.n	80002de <atoi+0xa2>
 8000278:	687b      	ldr	r3, [r7, #4]
 800027a:	781b      	ldrb	r3, [r3, #0]
 800027c:	2b2d      	cmp	r3, #45	; 0x2d
 800027e:	d105      	bne.n	800028c <atoi+0x50>
 8000280:	687b      	ldr	r3, [r7, #4]
 8000282:	1c5a      	adds	r2, r3, #1
 8000284:	607a      	str	r2, [r7, #4]
 8000286:	781b      	ldrb	r3, [r3, #0]
 8000288:	2b00      	cmp	r3, #0
 800028a:	d10a      	bne.n	80002a2 <atoi+0x66>
 800028c:	687b      	ldr	r3, [r7, #4]
 800028e:	781b      	ldrb	r3, [r3, #0]
 8000290:	2b2b      	cmp	r3, #43	; 0x2b
 8000292:	d104      	bne.n	800029e <atoi+0x62>
 8000294:	687b      	ldr	r3, [r7, #4]
 8000296:	1c5a      	adds	r2, r3, #1
 8000298:	607a      	str	r2, [r7, #4]
 800029a:	781b      	ldrb	r3, [r3, #0]
 800029c:	2b00      	cmp	r3, #0
 800029e:	2301      	movs	r3, #1
 80002a0:	e001      	b.n	80002a6 <atoi+0x6a>
 80002a2:	f04f 33ff 	mov.w	r3, #4294967295
 80002a6:	60bb      	str	r3, [r7, #8]
 80002a8:	e00d      	b.n	80002c6 <atoi+0x8a>
 80002aa:	68fa      	ldr	r2, [r7, #12]
 80002ac:	4613      	mov	r3, r2
 80002ae:	009b      	lsls	r3, r3, #2
 80002b0:	4413      	add	r3, r2
 80002b2:	005b      	lsls	r3, r3, #1
 80002b4:	60fb      	str	r3, [r7, #12]
 80002b6:	687b      	ldr	r3, [r7, #4]
 80002b8:	1c5a      	adds	r2, r3, #1
 80002ba:	607a      	str	r2, [r7, #4]
 80002bc:	781b      	ldrb	r3, [r3, #0]
 80002be:	3b30      	subs	r3, #48	; 0x30
 80002c0:	68fa      	ldr	r2, [r7, #12]
 80002c2:	4413      	add	r3, r2
 80002c4:	60fb      	str	r3, [r7, #12]
 80002c6:	687b      	ldr	r3, [r7, #4]
 80002c8:	781b      	ldrb	r3, [r3, #0]
 80002ca:	2b2f      	cmp	r3, #47	; 0x2f
 80002cc:	d903      	bls.n	80002d6 <atoi+0x9a>
 80002ce:	687b      	ldr	r3, [r7, #4]
 80002d0:	781b      	ldrb	r3, [r3, #0]
 80002d2:	2b39      	cmp	r3, #57	; 0x39
 80002d4:	d9e9      	bls.n	80002aa <atoi+0x6e>
 80002d6:	68bb      	ldr	r3, [r7, #8]
 80002d8:	68fa      	ldr	r2, [r7, #12]
 80002da:	fb02 f303 	mul.w	r3, r2, r3
 80002de:	4618      	mov	r0, r3
 80002e0:	3714      	adds	r7, #20
 80002e2:	46bd      	mov	sp, r7
 80002e4:	bc80      	pop	{r7}
 80002e6:	4770      	bx	lr

080002e8 <tohex>:
 80002e8:	b480      	push	{r7}
 80002ea:	b087      	sub	sp, #28
 80002ec:	af00      	add	r7, sp, #0
 80002ee:	60f8      	str	r0, [r7, #12]
 80002f0:	60b9      	str	r1, [r7, #8]
 80002f2:	607a      	str	r2, [r7, #4]
 80002f4:	2300      	movs	r3, #0
 80002f6:	617b      	str	r3, [r7, #20]
 80002f8:	e023      	b.n	8000342 <tohex+0x5a>
 80002fa:	697b      	ldr	r3, [r7, #20]
 80002fc:	009b      	lsls	r3, r3, #2
 80002fe:	68fa      	ldr	r2, [r7, #12]
 8000300:	fa22 f303 	lsr.w	r3, r2, r3
 8000304:	b2db      	uxtb	r3, r3
 8000306:	f003 030f 	and.w	r3, r3, #15
 800030a:	74fb      	strb	r3, [r7, #19]
 800030c:	7cfb      	ldrb	r3, [r7, #19]
 800030e:	2b09      	cmp	r3, #9
 8000310:	d80a      	bhi.n	8000328 <tohex+0x40>
 8000312:	687a      	ldr	r2, [r7, #4]
 8000314:	697b      	ldr	r3, [r7, #20]
 8000316:	1ad3      	subs	r3, r2, r3
 8000318:	3b01      	subs	r3, #1
 800031a:	68ba      	ldr	r2, [r7, #8]
 800031c:	4413      	add	r3, r2
 800031e:	7cfa      	ldrb	r2, [r7, #19]
 8000320:	3230      	adds	r2, #48	; 0x30
 8000322:	b2d2      	uxtb	r2, r2
 8000324:	701a      	strb	r2, [r3, #0]
 8000326:	e009      	b.n	800033c <tohex+0x54>
 8000328:	687a      	ldr	r2, [r7, #4]
 800032a:	697b      	ldr	r3, [r7, #20]
 800032c:	1ad3      	subs	r3, r2, r3
 800032e:	3b01      	subs	r3, #1
 8000330:	68ba      	ldr	r2, [r7, #8]
 8000332:	4413      	add	r3, r2
 8000334:	7cfa      	ldrb	r2, [r7, #19]
 8000336:	3237      	adds	r2, #55	; 0x37
 8000338:	b2d2      	uxtb	r2, r2
 800033a:	701a      	strb	r2, [r3, #0]
 800033c:	697b      	ldr	r3, [r7, #20]
 800033e:	3301      	adds	r3, #1
 8000340:	617b      	str	r3, [r7, #20]
 8000342:	697a      	ldr	r2, [r7, #20]
 8000344:	687b      	ldr	r3, [r7, #4]
 8000346:	429a      	cmp	r2, r3
 8000348:	d3d7      	bcc.n	80002fa <tohex+0x12>
 800034a:	68ba      	ldr	r2, [r7, #8]
 800034c:	697b      	ldr	r3, [r7, #20]
 800034e:	4413      	add	r3, r2
 8000350:	2200      	movs	r2, #0
 8000352:	701a      	strb	r2, [r3, #0]
 8000354:	697b      	ldr	r3, [r7, #20]
 8000356:	4618      	mov	r0, r3
 8000358:	371c      	adds	r7, #28
 800035a:	46bd      	mov	sp, r7
 800035c:	bc80      	pop	{r7}
 800035e:	4770      	bx	lr

08000360 <hextob>:
 8000360:	b480      	push	{r7}
 8000362:	b087      	sub	sp, #28
 8000364:	af00      	add	r7, sp, #0
 8000366:	6078      	str	r0, [r7, #4]
 8000368:	6039      	str	r1, [r7, #0]
 800036a:	2300      	movs	r3, #0
 800036c:	613b      	str	r3, [r7, #16]
 800036e:	683b      	ldr	r3, [r7, #0]
 8000370:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
 8000374:	3b01      	subs	r3, #1
 8000376:	009b      	lsls	r3, r3, #2
 8000378:	2201      	movs	r2, #1
 800037a:	fa02 f303 	lsl.w	r3, r2, r3
 800037e:	60bb      	str	r3, [r7, #8]
 8000380:	2300      	movs	r3, #0
 8000382:	617b      	str	r3, [r7, #20]
 8000384:	e037      	b.n	80003f6 <hextob+0x96>
 8000386:	687a      	ldr	r2, [r7, #4]
 8000388:	697b      	ldr	r3, [r7, #20]
 800038a:	4413      	add	r3, r2
 800038c:	781b      	ldrb	r3, [r3, #0]
 800038e:	2b2f      	cmp	r3, #47	; 0x2f
 8000390:	d937      	bls.n	8000402 <hextob+0xa2>
 8000392:	687a      	ldr	r2, [r7, #4]
 8000394:	697b      	ldr	r3, [r7, #20]
 8000396:	4413      	add	r3, r2
 8000398:	781b      	ldrb	r3, [r3, #0]
 800039a:	2b46      	cmp	r3, #70	; 0x46
 800039c:	d831      	bhi.n	8000402 <hextob+0xa2>
 800039e:	687a      	ldr	r2, [r7, #4]
 80003a0:	697b      	ldr	r3, [r7, #20]
 80003a2:	4413      	add	r3, r2
 80003a4:	781b      	ldrb	r3, [r3, #0]
 80003a6:	2b39      	cmp	r3, #57	; 0x39
 80003a8:	d905      	bls.n	80003b6 <hextob+0x56>
 80003aa:	687a      	ldr	r2, [r7, #4]
 80003ac:	697b      	ldr	r3, [r7, #20]
 80003ae:	4413      	add	r3, r2
 80003b0:	781b      	ldrb	r3, [r3, #0]
 80003b2:	2b40      	cmp	r3, #64	; 0x40
 80003b4:	d924      	bls.n	8000400 <hextob+0xa0>
 80003b6:	687a      	ldr	r2, [r7, #4]
 80003b8:	697b      	ldr	r3, [r7, #20]
 80003ba:	4413      	add	r3, r2
 80003bc:	781b      	ldrb	r3, [r3, #0]
 80003be:	2b39      	cmp	r3, #57	; 0x39
 80003c0:	d806      	bhi.n	80003d0 <hextob+0x70>
 80003c2:	687a      	ldr	r2, [r7, #4]
 80003c4:	697b      	ldr	r3, [r7, #20]
 80003c6:	4413      	add	r3, r2
 80003c8:	781b      	ldrb	r3, [r3, #0]
 80003ca:	3b30      	subs	r3, #48	; 0x30
 80003cc:	73fb      	strb	r3, [r7, #15]
 80003ce:	e005      	b.n	80003dc <hextob+0x7c>
 80003d0:	687a      	ldr	r2, [r7, #4]
 80003d2:	697b      	ldr	r3, [r7, #20]
 80003d4:	4413      	add	r3, r2
 80003d6:	781b      	ldrb	r3, [r3, #0]
 80003d8:	3b37      	subs	r3, #55	; 0x37
 80003da:	73fb      	strb	r3, [r7, #15]
 80003dc:	7bfb      	ldrb	r3, [r7, #15]
 80003de:	68ba      	ldr	r2, [r7, #8]
 80003e0:	fb02 f303 	mul.w	r3, r2, r3
 80003e4:	693a      	ldr	r2, [r7, #16]
 80003e6:	4413      	add	r3, r2
 80003e8:	613b      	str	r3, [r7, #16]
 80003ea:	68bb      	ldr	r3, [r7, #8]
 80003ec:	091b      	lsrs	r3, r3, #4
 80003ee:	60bb      	str	r3, [r7, #8]
 80003f0:	697b      	ldr	r3, [r7, #20]
 80003f2:	3301      	adds	r3, #1
 80003f4:	617b      	str	r3, [r7, #20]
 80003f6:	697a      	ldr	r2, [r7, #20]
 80003f8:	683b      	ldr	r3, [r7, #0]
 80003fa:	429a      	cmp	r2, r3
 80003fc:	d3c3      	bcc.n	8000386 <hextob+0x26>
 80003fe:	e000      	b.n	8000402 <hextob+0xa2>
 8000400:	bf00      	nop
 8000402:	693b      	ldr	r3, [r7, #16]
 8000404:	4618      	mov	r0, r3
 8000406:	371c      	adds	r7, #28
 8000408:	46bd      	mov	sp, r7
 800040a:	bc80      	pop	{r7}
 800040c:	4770      	bx	lr
 800040e:	bf00      	nop

08000410 <unc_to_utf>:
 8000410:	b480      	push	{r7}
 8000412:	b085      	sub	sp, #20
 8000414:	af00      	add	r7, sp, #0
 8000416:	4603      	mov	r3, r0
 8000418:	6039      	str	r1, [r7, #0]
 800041a:	80fb      	strh	r3, [r7, #6]
 800041c:	88fb      	ldrh	r3, [r7, #6]
 800041e:	2b7f      	cmp	r3, #127	; 0x7f
 8000420:	d806      	bhi.n	8000430 <unc_to_utf+0x20>
 8000422:	683b      	ldr	r3, [r7, #0]
 8000424:	1c5a      	adds	r2, r3, #1
 8000426:	603a      	str	r2, [r7, #0]
 8000428:	88fa      	ldrh	r2, [r7, #6]
 800042a:	b2d2      	uxtb	r2, r2
 800042c:	701a      	strb	r2, [r3, #0]
 800042e:	e01e      	b.n	800046e <unc_to_utf+0x5e>
 8000430:	88fb      	ldrh	r3, [r7, #6]
 8000432:	009b      	lsls	r3, r3, #2
 8000434:	b21b      	sxth	r3, r3
 8000436:	f403 53f8 	and.w	r3, r3, #7936	; 0x1f00
 800043a:	b21a      	sxth	r2, r3
 800043c:	f9b7 3006 	ldrsh.w	r3, [r7, #6]
 8000440:	f003 033f 	and.w	r3, r3, #63	; 0x3f
 8000444:	b21b      	sxth	r3, r3
 8000446:	4313      	orrs	r3, r2
 8000448:	b21a      	sxth	r2, r3
 800044a:	4b0c      	ldr	r3, [pc, #48]	; (800047c <unc_to_utf+0x6c>)
 800044c:	4313      	orrs	r3, r2
 800044e:	b21b      	sxth	r3, r3
 8000450:	81fb      	strh	r3, [r7, #14]
 8000452:	683b      	ldr	r3, [r7, #0]
 8000454:	1c5a      	adds	r2, r3, #1
 8000456:	603a      	str	r2, [r7, #0]
 8000458:	89fa      	ldrh	r2, [r7, #14]
 800045a:	0a12      	lsrs	r2, r2, #8
 800045c:	b292      	uxth	r2, r2
 800045e:	b2d2      	uxtb	r2, r2
 8000460:	701a      	strb	r2, [r3, #0]
 8000462:	683b      	ldr	r3, [r7, #0]
 8000464:	1c5a      	adds	r2, r3, #1
 8000466:	603a      	str	r2, [r7, #0]
 8000468:	89fa      	ldrh	r2, [r7, #14]
 800046a:	b2d2      	uxtb	r2, r2
 800046c:	701a      	strb	r2, [r3, #0]
 800046e:	683b      	ldr	r3, [r7, #0]
 8000470:	4618      	mov	r0, r3
 8000472:	3714      	adds	r7, #20
 8000474:	46bd      	mov	sp, r7
 8000476:	bc80      	pop	{r7}
 8000478:	4770      	bx	lr
 800047a:	bf00      	nop
 800047c:	ffffc080 	.word	0xffffc080

08000480 <utf_to_unc>:
 8000480:	b480      	push	{r7}
 8000482:	b083      	sub	sp, #12
 8000484:	af00      	add	r7, sp, #0
 8000486:	6078      	str	r0, [r7, #4]
 8000488:	6039      	str	r1, [r7, #0]
 800048a:	687b      	ldr	r3, [r7, #4]
 800048c:	781b      	ldrb	r3, [r3, #0]
 800048e:	b25b      	sxtb	r3, r3
 8000490:	2b00      	cmp	r3, #0
 8000492:	db06      	blt.n	80004a2 <utf_to_unc+0x22>
 8000494:	687b      	ldr	r3, [r7, #4]
 8000496:	781b      	ldrb	r3, [r3, #0]
 8000498:	b29a      	uxth	r2, r3
 800049a:	683b      	ldr	r3, [r7, #0]
 800049c:	801a      	strh	r2, [r3, #0]
 800049e:	2301      	movs	r3, #1
 80004a0:	e01b      	b.n	80004da <utf_to_unc+0x5a>
 80004a2:	687b      	ldr	r3, [r7, #4]
 80004a4:	781b      	ldrb	r3, [r3, #0]
 80004a6:	f003 03e0 	and.w	r3, r3, #224	; 0xe0
 80004aa:	2bc0      	cmp	r3, #192	; 0xc0
 80004ac:	d114      	bne.n	80004d8 <utf_to_unc+0x58>
 80004ae:	687b      	ldr	r3, [r7, #4]
 80004b0:	781b      	ldrb	r3, [r3, #0]
 80004b2:	019b      	lsls	r3, r3, #6
 80004b4:	b21b      	sxth	r3, r3
 80004b6:	f403 63f8 	and.w	r3, r3, #1984	; 0x7c0
 80004ba:	b21a      	sxth	r2, r3
 80004bc:	687b      	ldr	r3, [r7, #4]
 80004be:	3301      	adds	r3, #1
 80004c0:	781b      	ldrb	r3, [r3, #0]
 80004c2:	b21b      	sxth	r3, r3
 80004c4:	f003 033f 	and.w	r3, r3, #63	; 0x3f
 80004c8:	b21b      	sxth	r3, r3
 80004ca:	4313      	orrs	r3, r2
 80004cc:	b21b      	sxth	r3, r3
 80004ce:	b29a      	uxth	r2, r3
 80004d0:	683b      	ldr	r3, [r7, #0]
 80004d2:	801a      	strh	r2, [r3, #0]
 80004d4:	2302      	movs	r3, #2
 80004d6:	e000      	b.n	80004da <utf_to_unc+0x5a>
 80004d8:	2300      	movs	r3, #0
 80004da:	4618      	mov	r0, r3
 80004dc:	370c      	adds	r7, #12
 80004de:	46bd      	mov	sp, r7
 80004e0:	bc80      	pop	{r7}
 80004e2:	4770      	bx	lr

080004e4 <xputc>:
 80004e4:	b580      	push	{r7, lr}
 80004e6:	b082      	sub	sp, #8
 80004e8:	af00      	add	r7, sp, #0
 80004ea:	4603      	mov	r3, r0
 80004ec:	71fb      	strb	r3, [r7, #7]
 80004ee:	79fb      	ldrb	r3, [r7, #7]
 80004f0:	2b0a      	cmp	r3, #10
 80004f2:	d102      	bne.n	80004fa <xputc+0x16>
 80004f4:	200d      	movs	r0, #13
 80004f6:	f7ff fff5 	bl	80004e4 <xputc>
 80004fa:	4b0c      	ldr	r3, [pc, #48]	; (800052c <xputc+0x48>)
 80004fc:	681b      	ldr	r3, [r3, #0]
 80004fe:	2b00      	cmp	r3, #0
 8000500:	d007      	beq.n	8000512 <xputc+0x2e>
 8000502:	4b0a      	ldr	r3, [pc, #40]	; (800052c <xputc+0x48>)
 8000504:	681b      	ldr	r3, [r3, #0]
 8000506:	1c5a      	adds	r2, r3, #1
 8000508:	4908      	ldr	r1, [pc, #32]	; (800052c <xputc+0x48>)
 800050a:	600a      	str	r2, [r1, #0]
 800050c:	79fa      	ldrb	r2, [r7, #7]
 800050e:	701a      	strb	r2, [r3, #0]
 8000510:	e008      	b.n	8000524 <xputc+0x40>
 8000512:	4b07      	ldr	r3, [pc, #28]	; (8000530 <xputc+0x4c>)
 8000514:	681b      	ldr	r3, [r3, #0]
 8000516:	2b00      	cmp	r3, #0
 8000518:	d004      	beq.n	8000524 <xputc+0x40>
 800051a:	4b05      	ldr	r3, [pc, #20]	; (8000530 <xputc+0x4c>)
 800051c:	681b      	ldr	r3, [r3, #0]
 800051e:	79fa      	ldrb	r2, [r7, #7]
 8000520:	4610      	mov	r0, r2
 8000522:	4798      	blx	r3
 8000524:	3708      	adds	r7, #8
 8000526:	46bd      	mov	sp, r7
 8000528:	bd80      	pop	{r7, pc}
 800052a:	bf00      	nop
 800052c:	200000a8 	.word	0x200000a8
 8000530:	200000a4 	.word	0x200000a4

08000534 <xputs>:
 8000534:	b580      	push	{r7, lr}
 8000536:	b082      	sub	sp, #8
 8000538:	af00      	add	r7, sp, #0
 800053a:	6078      	str	r0, [r7, #4]
 800053c:	e006      	b.n	800054c <xputs+0x18>
 800053e:	687b      	ldr	r3, [r7, #4]
 8000540:	1c5a      	adds	r2, r3, #1
 8000542:	607a      	str	r2, [r7, #4]
 8000544:	781b      	ldrb	r3, [r3, #0]
 8000546:	4618      	mov	r0, r3
 8000548:	f7ff ffcc 	bl	80004e4 <xputc>
 800054c:	687b      	ldr	r3, [r7, #4]
 800054e:	781b      	ldrb	r3, [r3, #0]
 8000550:	2b00      	cmp	r3, #0
 8000552:	d1f4      	bne.n	800053e <xputs+0xa>
 8000554:	bf00      	nop
 8000556:	3708      	adds	r7, #8
 8000558:	46bd      	mov	sp, r7
 800055a:	bd80      	pop	{r7, pc}

0800055c <xfputs>:
 800055c:	b580      	push	{r7, lr}
 800055e:	b084      	sub	sp, #16
 8000560:	af00      	add	r7, sp, #0
 8000562:	6078      	str	r0, [r7, #4]
 8000564:	6039      	str	r1, [r7, #0]
 8000566:	4b0c      	ldr	r3, [pc, #48]	; (8000598 <xfputs+0x3c>)
 8000568:	681b      	ldr	r3, [r3, #0]
 800056a:	60fb      	str	r3, [r7, #12]
 800056c:	4a0a      	ldr	r2, [pc, #40]	; (8000598 <xfputs+0x3c>)
 800056e:	687b      	ldr	r3, [r7, #4]
 8000570:	6013      	str	r3, [r2, #0]
 8000572:	e006      	b.n	8000582 <xfputs+0x26>
 8000574:	683b      	ldr	r3, [r7, #0]
 8000576:	1c5a      	adds	r2, r3, #1
 8000578:	603a      	str	r2, [r7, #0]
 800057a:	781b      	ldrb	r3, [r3, #0]
 800057c:	4618      	mov	r0, r3
 800057e:	f7ff ffb1 	bl	80004e4 <xputc>
 8000582:	683b      	ldr	r3, [r7, #0]
 8000584:	781b      	ldrb	r3, [r3, #0]
 8000586:	2b00      	cmp	r3, #0
 8000588:	d1f4      	bne.n	8000574 <xfputs+0x18>
 800058a:	4a03      	ldr	r2, [pc, #12]	; (8000598 <xfputs+0x3c>)
 800058c:	68fb      	ldr	r3, [r7, #12]
 800058e:	6013      	str	r3, [r2, #0]
 8000590:	bf00      	nop
 8000592:	3710      	adds	r7, #16
 8000594:	46bd      	mov	sp, r7
 8000596:	bd80      	pop	{r7, pc}
 8000598:	200000a4 	.word	0x200000a4

0800059c <xvprintf>:
 800059c:	b580      	push	{r7, lr}
 800059e:	b08e      	sub	sp, #56	; 0x38
 80005a0:	af00      	add	r7, sp, #0
 80005a2:	6078      	str	r0, [r7, #4]
 80005a4:	6039      	str	r1, [r7, #0]
 80005a6:	687b      	ldr	r3, [r7, #4]
 80005a8:	1c5a      	adds	r2, r3, #1
 80005aa:	607a      	str	r2, [r7, #4]
 80005ac:	781b      	ldrb	r3, [r3, #0]
 80005ae:	77fb      	strb	r3, [r7, #31]
 80005b0:	7ffb      	ldrb	r3, [r7, #31]
 80005b2:	2b00      	cmp	r3, #0
 80005b4:	f000 8167 	beq.w	8000886 <xvprintf+0x2ea>
 80005b8:	7ffb      	ldrb	r3, [r7, #31]
 80005ba:	2b25      	cmp	r3, #37	; 0x25
 80005bc:	d004      	beq.n	80005c8 <xvprintf+0x2c>
 80005be:	7ffb      	ldrb	r3, [r7, #31]
 80005c0:	4618      	mov	r0, r3
 80005c2:	f7ff ff8f 	bl	80004e4 <xputc>
 80005c6:	e15d      	b.n	8000884 <xvprintf+0x2e8>
 80005c8:	2300      	movs	r3, #0
 80005ca:	627b      	str	r3, [r7, #36]	; 0x24
 80005cc:	687b      	ldr	r3, [r7, #4]
 80005ce:	1c5a      	adds	r2, r3, #1
 80005d0:	607a      	str	r2, [r7, #4]
 80005d2:	781b      	ldrb	r3, [r3, #0]
 80005d4:	77fb      	strb	r3, [r7, #31]
 80005d6:	7ffb      	ldrb	r3, [r7, #31]
 80005d8:	2b30      	cmp	r3, #48	; 0x30
 80005da:	d107      	bne.n	80005ec <xvprintf+0x50>
 80005dc:	2301      	movs	r3, #1
 80005de:	627b      	str	r3, [r7, #36]	; 0x24
 80005e0:	687b      	ldr	r3, [r7, #4]
 80005e2:	1c5a      	adds	r2, r3, #1
 80005e4:	607a      	str	r2, [r7, #4]
 80005e6:	781b      	ldrb	r3, [r3, #0]
 80005e8:	77fb      	strb	r3, [r7, #31]
 80005ea:	e009      	b.n	8000600 <xvprintf+0x64>
 80005ec:	7ffb      	ldrb	r3, [r7, #31]
 80005ee:	2b2d      	cmp	r3, #45	; 0x2d
 80005f0:	d106      	bne.n	8000600 <xvprintf+0x64>
 80005f2:	2302      	movs	r3, #2
 80005f4:	627b      	str	r3, [r7, #36]	; 0x24
 80005f6:	687b      	ldr	r3, [r7, #4]
 80005f8:	1c5a      	adds	r2, r3, #1
 80005fa:	607a      	str	r2, [r7, #4]
 80005fc:	781b      	ldrb	r3, [r3, #0]
 80005fe:	77fb      	strb	r3, [r7, #31]
 8000600:	2300      	movs	r3, #0
 8000602:	62bb      	str	r3, [r7, #40]	; 0x28
 8000604:	e00e      	b.n	8000624 <xvprintf+0x88>
 8000606:	6aba      	ldr	r2, [r7, #40]	; 0x28
 8000608:	4613      	mov	r3, r2
 800060a:	009b      	lsls	r3, r3, #2
 800060c:	4413      	add	r3, r2
 800060e:	005b      	lsls	r3, r3, #1
 8000610:	461a      	mov	r2, r3
 8000612:	7ffb      	ldrb	r3, [r7, #31]
 8000614:	4413      	add	r3, r2
 8000616:	3b30      	subs	r3, #48	; 0x30
 8000618:	62bb      	str	r3, [r7, #40]	; 0x28
 800061a:	687b      	ldr	r3, [r7, #4]
 800061c:	1c5a      	adds	r2, r3, #1
 800061e:	607a      	str	r2, [r7, #4]
 8000620:	781b      	ldrb	r3, [r3, #0]
 8000622:	77fb      	strb	r3, [r7, #31]
 8000624:	7ffb      	ldrb	r3, [r7, #31]
 8000626:	2b2f      	cmp	r3, #47	; 0x2f
 8000628:	d902      	bls.n	8000630 <xvprintf+0x94>
 800062a:	7ffb      	ldrb	r3, [r7, #31]
 800062c:	2b39      	cmp	r3, #57	; 0x39
 800062e:	d9ea      	bls.n	8000606 <xvprintf+0x6a>
 8000630:	7ffb      	ldrb	r3, [r7, #31]
 8000632:	2b6c      	cmp	r3, #108	; 0x6c
 8000634:	d002      	beq.n	800063c <xvprintf+0xa0>
 8000636:	7ffb      	ldrb	r3, [r7, #31]
 8000638:	2b4c      	cmp	r3, #76	; 0x4c
 800063a:	d108      	bne.n	800064e <xvprintf+0xb2>
 800063c:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800063e:	f043 0304 	orr.w	r3, r3, #4
 8000642:	627b      	str	r3, [r7, #36]	; 0x24
 8000644:	687b      	ldr	r3, [r7, #4]
 8000646:	1c5a      	adds	r2, r3, #1
 8000648:	607a      	str	r2, [r7, #4]
 800064a:	781b      	ldrb	r3, [r3, #0]
 800064c:	77fb      	strb	r3, [r7, #31]
 800064e:	7ffb      	ldrb	r3, [r7, #31]
 8000650:	2b00      	cmp	r3, #0
 8000652:	f000 811a 	beq.w	800088a <xvprintf+0x2ee>
 8000656:	7ffb      	ldrb	r3, [r7, #31]
 8000658:	77bb      	strb	r3, [r7, #30]
 800065a:	7fbb      	ldrb	r3, [r7, #30]
 800065c:	2b60      	cmp	r3, #96	; 0x60
 800065e:	d902      	bls.n	8000666 <xvprintf+0xca>
 8000660:	7fbb      	ldrb	r3, [r7, #30]
 8000662:	3b20      	subs	r3, #32
 8000664:	77bb      	strb	r3, [r7, #30]
 8000666:	7fbb      	ldrb	r3, [r7, #30]
 8000668:	3b42      	subs	r3, #66	; 0x42
 800066a:	2b16      	cmp	r3, #22
 800066c:	d873      	bhi.n	8000756 <xvprintf+0x1ba>
 800066e:	a201      	add	r2, pc, #4	; (adr r2, 8000674 <xvprintf+0xd8>)
 8000670:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
 8000674:	0800073f 	.word	0x0800073f
 8000678:	0800072d 	.word	0x0800072d
 800067c:	0800074b 	.word	0x0800074b
 8000680:	08000757 	.word	0x08000757
 8000684:	08000757 	.word	0x08000757
 8000688:	08000757 	.word	0x08000757
 800068c:	08000757 	.word	0x08000757
 8000690:	08000757 	.word	0x08000757
 8000694:	08000757 	.word	0x08000757
 8000698:	08000757 	.word	0x08000757
 800069c:	08000757 	.word	0x08000757
 80006a0:	08000757 	.word	0x08000757
 80006a4:	08000757 	.word	0x08000757
 80006a8:	08000745 	.word	0x08000745
 80006ac:	08000757 	.word	0x08000757
 80006b0:	08000757 	.word	0x08000757
 80006b4:	08000757 	.word	0x08000757
 80006b8:	080006d1 	.word	0x080006d1
 80006bc:	08000757 	.word	0x08000757
 80006c0:	0800074b 	.word	0x0800074b
 80006c4:	08000757 	.word	0x08000757
 80006c8:	08000757 	.word	0x08000757
 80006cc:	08000751 	.word	0x08000751
 80006d0:	683b      	ldr	r3, [r7, #0]
 80006d2:	1d1a      	adds	r2, r3, #4
 80006d4:	603a      	str	r2, [r7, #0]
 80006d6:	681b      	ldr	r3, [r3, #0]
 80006d8:	61bb      	str	r3, [r7, #24]
 80006da:	2300      	movs	r3, #0
 80006dc:	62fb      	str	r3, [r7, #44]	; 0x2c
 80006de:	e002      	b.n	80006e6 <xvprintf+0x14a>
 80006e0:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80006e2:	3301      	adds	r3, #1
 80006e4:	62fb      	str	r3, [r7, #44]	; 0x2c
 80006e6:	69ba      	ldr	r2, [r7, #24]
 80006e8:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80006ea:	4413      	add	r3, r2
 80006ec:	781b      	ldrb	r3, [r3, #0]
 80006ee:	2b00      	cmp	r3, #0
 80006f0:	d1f6      	bne.n	80006e0 <xvprintf+0x144>
 80006f2:	e002      	b.n	80006fa <xvprintf+0x15e>
 80006f4:	2020      	movs	r0, #32
 80006f6:	f7ff fef5 	bl	80004e4 <xputc>
 80006fa:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80006fc:	f003 0302 	and.w	r3, r3, #2
 8000700:	2b00      	cmp	r3, #0
 8000702:	d105      	bne.n	8000710 <xvprintf+0x174>
 8000704:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8000706:	1c5a      	adds	r2, r3, #1
 8000708:	62fa      	str	r2, [r7, #44]	; 0x2c
 800070a:	6aba      	ldr	r2, [r7, #40]	; 0x28
 800070c:	4293      	cmp	r3, r2
 800070e:	d3f1      	bcc.n	80006f4 <xvprintf+0x158>
 8000710:	69b8      	ldr	r0, [r7, #24]
 8000712:	f7ff ff0f 	bl	8000534 <xputs>
 8000716:	e002      	b.n	800071e <xvprintf+0x182>
 8000718:	2020      	movs	r0, #32
 800071a:	f7ff fee3 	bl	80004e4 <xputc>
 800071e:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8000720:	1c5a      	adds	r2, r3, #1
 8000722:	62fa      	str	r2, [r7, #44]	; 0x2c
 8000724:	6aba      	ldr	r2, [r7, #40]	; 0x28
 8000726:	4293      	cmp	r3, r2
 8000728:	d3f6      	bcc.n	8000718 <xvprintf+0x17c>
 800072a:	e0ab      	b.n	8000884 <xvprintf+0x2e8>
 800072c:	683b      	ldr	r3, [r7, #0]
 800072e:	1d1a      	adds	r2, r3, #4
 8000730:	603a      	str	r2, [r7, #0]
 8000732:	681b      	ldr	r3, [r3, #0]
 8000734:	b2db      	uxtb	r3, r3
 8000736:	4618      	mov	r0, r3
 8000738:	f7ff fed4 	bl	80004e4 <xputc>
 800073c:	e0a2      	b.n	8000884 <xvprintf+0x2e8>
 800073e:	2302      	movs	r3, #2
 8000740:	637b      	str	r3, [r7, #52]	; 0x34
 8000742:	e00d      	b.n	8000760 <xvprintf+0x1c4>
 8000744:	2308      	movs	r3, #8
 8000746:	637b      	str	r3, [r7, #52]	; 0x34
 8000748:	e00a      	b.n	8000760 <xvprintf+0x1c4>
 800074a:	230a      	movs	r3, #10
 800074c:	637b      	str	r3, [r7, #52]	; 0x34
 800074e:	e007      	b.n	8000760 <xvprintf+0x1c4>
 8000750:	2310      	movs	r3, #16
 8000752:	637b      	str	r3, [r7, #52]	; 0x34
 8000754:	e004      	b.n	8000760 <xvprintf+0x1c4>
 8000756:	7ffb      	ldrb	r3, [r7, #31]
 8000758:	4618      	mov	r0, r3
 800075a:	f7ff fec3 	bl	80004e4 <xputc>
 800075e:	e091      	b.n	8000884 <xvprintf+0x2e8>
 8000760:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000762:	f003 0304 	and.w	r3, r3, #4
 8000766:	2b00      	cmp	r3, #0
 8000768:	d004      	beq.n	8000774 <xvprintf+0x1d8>
 800076a:	683b      	ldr	r3, [r7, #0]
 800076c:	1d1a      	adds	r2, r3, #4
 800076e:	603a      	str	r2, [r7, #0]
 8000770:	681b      	ldr	r3, [r3, #0]
 8000772:	e00b      	b.n	800078c <xvprintf+0x1f0>
 8000774:	7fbb      	ldrb	r3, [r7, #30]
 8000776:	2b44      	cmp	r3, #68	; 0x44
 8000778:	d104      	bne.n	8000784 <xvprintf+0x1e8>
 800077a:	683b      	ldr	r3, [r7, #0]
 800077c:	1d1a      	adds	r2, r3, #4
 800077e:	603a      	str	r2, [r7, #0]
 8000780:	681b      	ldr	r3, [r3, #0]
 8000782:	e003      	b.n	800078c <xvprintf+0x1f0>
 8000784:	683b      	ldr	r3, [r7, #0]
 8000786:	1d1a      	adds	r2, r3, #4
 8000788:	603a      	str	r2, [r7, #0]
 800078a:	681b      	ldr	r3, [r3, #0]
 800078c:	623b      	str	r3, [r7, #32]
 800078e:	7fbb      	ldrb	r3, [r7, #30]
 8000790:	2b44      	cmp	r3, #68	; 0x44
 8000792:	d109      	bne.n	80007a8 <xvprintf+0x20c>
 8000794:	6a3b      	ldr	r3, [r7, #32]
 8000796:	2b00      	cmp	r3, #0
 8000798:	da06      	bge.n	80007a8 <xvprintf+0x20c>
 800079a:	6a3b      	ldr	r3, [r7, #32]
 800079c:	425b      	negs	r3, r3
 800079e:	623b      	str	r3, [r7, #32]
 80007a0:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80007a2:	f043 0308 	orr.w	r3, r3, #8
 80007a6:	627b      	str	r3, [r7, #36]	; 0x24
 80007a8:	2300      	movs	r3, #0
 80007aa:	633b      	str	r3, [r7, #48]	; 0x30
 80007ac:	6a3b      	ldr	r3, [r7, #32]
 80007ae:	6b7a      	ldr	r2, [r7, #52]	; 0x34
 80007b0:	fbb3 f2f2 	udiv	r2, r3, r2
 80007b4:	6b79      	ldr	r1, [r7, #52]	; 0x34
 80007b6:	fb01 f202 	mul.w	r2, r1, r2
 80007ba:	1a9b      	subs	r3, r3, r2
 80007bc:	77bb      	strb	r3, [r7, #30]
 80007be:	6a3a      	ldr	r2, [r7, #32]
 80007c0:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80007c2:	fbb2 f3f3 	udiv	r3, r2, r3
 80007c6:	623b      	str	r3, [r7, #32]
 80007c8:	7fbb      	ldrb	r3, [r7, #30]
 80007ca:	2b09      	cmp	r3, #9
 80007cc:	d908      	bls.n	80007e0 <xvprintf+0x244>
 80007ce:	7ffb      	ldrb	r3, [r7, #31]
 80007d0:	2b78      	cmp	r3, #120	; 0x78
 80007d2:	d101      	bne.n	80007d8 <xvprintf+0x23c>
 80007d4:	2227      	movs	r2, #39	; 0x27
 80007d6:	e000      	b.n	80007da <xvprintf+0x23e>
 80007d8:	2207      	movs	r2, #7
 80007da:	7fbb      	ldrb	r3, [r7, #30]
 80007dc:	4413      	add	r3, r2
 80007de:	77bb      	strb	r3, [r7, #30]
 80007e0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80007e2:	1c5a      	adds	r2, r3, #1
 80007e4:	633a      	str	r2, [r7, #48]	; 0x30
 80007e6:	7fba      	ldrb	r2, [r7, #30]
 80007e8:	3230      	adds	r2, #48	; 0x30
 80007ea:	b2d2      	uxtb	r2, r2
 80007ec:	f107 0138 	add.w	r1, r7, #56	; 0x38
 80007f0:	440b      	add	r3, r1
 80007f2:	f803 2c30 	strb.w	r2, [r3, #-48]
 80007f6:	6a3b      	ldr	r3, [r7, #32]
 80007f8:	2b00      	cmp	r3, #0
 80007fa:	d002      	beq.n	8000802 <xvprintf+0x266>
 80007fc:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80007fe:	2b0f      	cmp	r3, #15
 8000800:	d9d4      	bls.n	80007ac <xvprintf+0x210>
 8000802:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000804:	f003 0308 	and.w	r3, r3, #8
 8000808:	2b00      	cmp	r3, #0
 800080a:	d008      	beq.n	800081e <xvprintf+0x282>
 800080c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 800080e:	1c5a      	adds	r2, r3, #1
 8000810:	633a      	str	r2, [r7, #48]	; 0x30
 8000812:	f107 0238 	add.w	r2, r7, #56	; 0x38
 8000816:	4413      	add	r3, r2
 8000818:	222d      	movs	r2, #45	; 0x2d
 800081a:	f803 2c30 	strb.w	r2, [r3, #-48]
 800081e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8000820:	62fb      	str	r3, [r7, #44]	; 0x2c
 8000822:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000824:	f003 0301 	and.w	r3, r3, #1
 8000828:	2b00      	cmp	r3, #0
 800082a:	d001      	beq.n	8000830 <xvprintf+0x294>
 800082c:	2330      	movs	r3, #48	; 0x30
 800082e:	e000      	b.n	8000832 <xvprintf+0x296>
 8000830:	2320      	movs	r3, #32
 8000832:	77bb      	strb	r3, [r7, #30]
 8000834:	e003      	b.n	800083e <xvprintf+0x2a2>
 8000836:	7fbb      	ldrb	r3, [r7, #30]
 8000838:	4618      	mov	r0, r3
 800083a:	f7ff fe53 	bl	80004e4 <xputc>
 800083e:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000840:	f003 0302 	and.w	r3, r3, #2
 8000844:	2b00      	cmp	r3, #0
 8000846:	d105      	bne.n	8000854 <xvprintf+0x2b8>
 8000848:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800084a:	1c5a      	adds	r2, r3, #1
 800084c:	62fa      	str	r2, [r7, #44]	; 0x2c
 800084e:	6aba      	ldr	r2, [r7, #40]	; 0x28
 8000850:	4293      	cmp	r3, r2
 8000852:	d3f0      	bcc.n	8000836 <xvprintf+0x29a>
 8000854:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8000856:	3b01      	subs	r3, #1
 8000858:	633b      	str	r3, [r7, #48]	; 0x30
 800085a:	f107 0208 	add.w	r2, r7, #8
 800085e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8000860:	4413      	add	r3, r2
 8000862:	781b      	ldrb	r3, [r3, #0]
 8000864:	4618      	mov	r0, r3
 8000866:	f7ff fe3d 	bl	80004e4 <xputc>
 800086a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 800086c:	2b00      	cmp	r3, #0
 800086e:	d1f1      	bne.n	8000854 <xvprintf+0x2b8>
 8000870:	e002      	b.n	8000878 <xvprintf+0x2dc>
 8000872:	2020      	movs	r0, #32
 8000874:	f7ff fe36 	bl	80004e4 <xputc>
 8000878:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800087a:	1c5a      	adds	r2, r3, #1
 800087c:	62fa      	str	r2, [r7, #44]	; 0x2c
 800087e:	6aba      	ldr	r2, [r7, #40]	; 0x28
 8000880:	4293      	cmp	r3, r2
 8000882:	d3f6      	bcc.n	8000872 <xvprintf+0x2d6>
 8000884:	e68f      	b.n	80005a6 <xvprintf+0xa>
 8000886:	bf00      	nop
 8000888:	e000      	b.n	800088c <xvprintf+0x2f0>
 800088a:	bf00      	nop
 800088c:	bf00      	nop
 800088e:	3738      	adds	r7, #56	; 0x38
 8000890:	46bd      	mov	sp, r7
 8000892:	bd80      	pop	{r7, pc}

08000894 <xprintf>:
 8000894:	b40f      	push	{r0, r1, r2, r3}
 8000896:	b580      	push	{r7, lr}
 8000898:	b082      	sub	sp, #8
 800089a:	af00      	add	r7, sp, #0
 800089c:	f107 0314 	add.w	r3, r7, #20
 80008a0:	607b      	str	r3, [r7, #4]
 80008a2:	6879      	ldr	r1, [r7, #4]
 80008a4:	6938      	ldr	r0, [r7, #16]
 80008a6:	f7ff fe79 	bl	800059c <xvprintf>
 80008aa:	bf00      	nop
 80008ac:	3708      	adds	r7, #8
 80008ae:	46bd      	mov	sp, r7
 80008b0:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 80008b4:	b004      	add	sp, #16
 80008b6:	4770      	bx	lr

080008b8 <xsprintf>:
 80008b8:	b40e      	push	{r1, r2, r3}
 80008ba:	b580      	push	{r7, lr}
 80008bc:	b085      	sub	sp, #20
 80008be:	af00      	add	r7, sp, #0
 80008c0:	6078      	str	r0, [r7, #4]
 80008c2:	4a0c      	ldr	r2, [pc, #48]	; (80008f4 <xsprintf+0x3c>)
 80008c4:	687b      	ldr	r3, [r7, #4]
 80008c6:	6013      	str	r3, [r2, #0]
 80008c8:	f107 0320 	add.w	r3, r7, #32
 80008cc:	60fb      	str	r3, [r7, #12]
 80008ce:	68f9      	ldr	r1, [r7, #12]
 80008d0:	69f8      	ldr	r0, [r7, #28]
 80008d2:	f7ff fe63 	bl	800059c <xvprintf>
 80008d6:	4b07      	ldr	r3, [pc, #28]	; (80008f4 <xsprintf+0x3c>)
 80008d8:	681b      	ldr	r3, [r3, #0]
 80008da:	2200      	movs	r2, #0
 80008dc:	701a      	strb	r2, [r3, #0]
 80008de:	4b05      	ldr	r3, [pc, #20]	; (80008f4 <xsprintf+0x3c>)
 80008e0:	2200      	movs	r2, #0
 80008e2:	601a      	str	r2, [r3, #0]
 80008e4:	bf00      	nop
 80008e6:	3714      	adds	r7, #20
 80008e8:	46bd      	mov	sp, r7
 80008ea:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 80008ee:	b003      	add	sp, #12
 80008f0:	4770      	bx	lr
 80008f2:	bf00      	nop
 80008f4:	200000a8 	.word	0x200000a8

080008f8 <xfprintf>:
 80008f8:	b40e      	push	{r1, r2, r3}
 80008fa:	b580      	push	{r7, lr}
 80008fc:	b085      	sub	sp, #20
 80008fe:	af00      	add	r7, sp, #0
 8000900:	6078      	str	r0, [r7, #4]
 8000902:	4b0b      	ldr	r3, [pc, #44]	; (8000930 <xfprintf+0x38>)
 8000904:	681b      	ldr	r3, [r3, #0]
 8000906:	60fb      	str	r3, [r7, #12]
 8000908:	4a09      	ldr	r2, [pc, #36]	; (8000930 <xfprintf+0x38>)
 800090a:	687b      	ldr	r3, [r7, #4]
 800090c:	6013      	str	r3, [r2, #0]
 800090e:	f107 0320 	add.w	r3, r7, #32
 8000912:	60bb      	str	r3, [r7, #8]
 8000914:	68b9      	ldr	r1, [r7, #8]
 8000916:	69f8      	ldr	r0, [r7, #28]
 8000918:	f7ff fe40 	bl	800059c <xvprintf>
 800091c:	4a04      	ldr	r2, [pc, #16]	; (8000930 <xfprintf+0x38>)
 800091e:	68fb      	ldr	r3, [r7, #12]
 8000920:	6013      	str	r3, [r2, #0]
 8000922:	bf00      	nop
 8000924:	3714      	adds	r7, #20
 8000926:	46bd      	mov	sp, r7
 8000928:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 800092c:	b003      	add	sp, #12
 800092e:	4770      	bx	lr
 8000930:	200000a4 	.word	0x200000a4

08000934 <put_dump>:
 8000934:	b580      	push	{r7, lr}
 8000936:	b088      	sub	sp, #32
 8000938:	af00      	add	r7, sp, #0
 800093a:	60f8      	str	r0, [r7, #12]
 800093c:	60b9      	str	r1, [r7, #8]
 800093e:	607a      	str	r2, [r7, #4]
 8000940:	603b      	str	r3, [r7, #0]
 8000942:	68b9      	ldr	r1, [r7, #8]
 8000944:	4834      	ldr	r0, [pc, #208]	; (8000a18 <put_dump+0xe4>)
 8000946:	f7ff ffa5 	bl	8000894 <xprintf>
 800094a:	683b      	ldr	r3, [r7, #0]
 800094c:	2b02      	cmp	r3, #2
 800094e:	d03a      	beq.n	80009c6 <put_dump+0x92>
 8000950:	2b04      	cmp	r3, #4
 8000952:	d049      	beq.n	80009e8 <put_dump+0xb4>
 8000954:	2b01      	cmp	r3, #1
 8000956:	d158      	bne.n	8000a0a <put_dump+0xd6>
 8000958:	68fb      	ldr	r3, [r7, #12]
 800095a:	613b      	str	r3, [r7, #16]
 800095c:	2300      	movs	r3, #0
 800095e:	61fb      	str	r3, [r7, #28]
 8000960:	e00a      	b.n	8000978 <put_dump+0x44>
 8000962:	69fb      	ldr	r3, [r7, #28]
 8000964:	693a      	ldr	r2, [r7, #16]
 8000966:	4413      	add	r3, r2
 8000968:	781b      	ldrb	r3, [r3, #0]
 800096a:	4619      	mov	r1, r3
 800096c:	482b      	ldr	r0, [pc, #172]	; (8000a1c <put_dump+0xe8>)
 800096e:	f7ff ff91 	bl	8000894 <xprintf>
 8000972:	69fb      	ldr	r3, [r7, #28]
 8000974:	3301      	adds	r3, #1
 8000976:	61fb      	str	r3, [r7, #28]
 8000978:	69fa      	ldr	r2, [r7, #28]
 800097a:	687b      	ldr	r3, [r7, #4]
 800097c:	429a      	cmp	r2, r3
 800097e:	dbf0      	blt.n	8000962 <put_dump+0x2e>
 8000980:	2020      	movs	r0, #32
 8000982:	f7ff fdaf 	bl	80004e4 <xputc>
 8000986:	2300      	movs	r3, #0
 8000988:	61fb      	str	r3, [r7, #28]
 800098a:	e017      	b.n	80009bc <put_dump+0x88>
 800098c:	69fb      	ldr	r3, [r7, #28]
 800098e:	693a      	ldr	r2, [r7, #16]
 8000990:	4413      	add	r3, r2
 8000992:	781b      	ldrb	r3, [r3, #0]
 8000994:	2b1f      	cmp	r3, #31
 8000996:	d90a      	bls.n	80009ae <put_dump+0x7a>
 8000998:	69fb      	ldr	r3, [r7, #28]
 800099a:	693a      	ldr	r2, [r7, #16]
 800099c:	4413      	add	r3, r2
 800099e:	781b      	ldrb	r3, [r3, #0]
 80009a0:	2b7e      	cmp	r3, #126	; 0x7e
 80009a2:	d804      	bhi.n	80009ae <put_dump+0x7a>
 80009a4:	69fb      	ldr	r3, [r7, #28]
 80009a6:	693a      	ldr	r2, [r7, #16]
 80009a8:	4413      	add	r3, r2
 80009aa:	781b      	ldrb	r3, [r3, #0]
 80009ac:	e000      	b.n	80009b0 <put_dump+0x7c>
 80009ae:	232e      	movs	r3, #46	; 0x2e
 80009b0:	4618      	mov	r0, r3
 80009b2:	f7ff fd97 	bl	80004e4 <xputc>
 80009b6:	69fb      	ldr	r3, [r7, #28]
 80009b8:	3301      	adds	r3, #1
 80009ba:	61fb      	str	r3, [r7, #28]
 80009bc:	69fa      	ldr	r2, [r7, #28]
 80009be:	687b      	ldr	r3, [r7, #4]
 80009c0:	429a      	cmp	r2, r3
 80009c2:	dbe3      	blt.n	800098c <put_dump+0x58>
 80009c4:	e021      	b.n	8000a0a <put_dump+0xd6>
 80009c6:	68fb      	ldr	r3, [r7, #12]
 80009c8:	61bb      	str	r3, [r7, #24]
 80009ca:	69bb      	ldr	r3, [r7, #24]
 80009cc:	1c9a      	adds	r2, r3, #2
 80009ce:	61ba      	str	r2, [r7, #24]
 80009d0:	881b      	ldrh	r3, [r3, #0]
 80009d2:	4619      	mov	r1, r3
 80009d4:	4812      	ldr	r0, [pc, #72]	; (8000a20 <put_dump+0xec>)
 80009d6:	f7ff ff5d 	bl	8000894 <xprintf>
 80009da:	687b      	ldr	r3, [r7, #4]
 80009dc:	3b01      	subs	r3, #1
 80009de:	607b      	str	r3, [r7, #4]
 80009e0:	687b      	ldr	r3, [r7, #4]
 80009e2:	2b00      	cmp	r3, #0
 80009e4:	d1f1      	bne.n	80009ca <put_dump+0x96>
 80009e6:	e010      	b.n	8000a0a <put_dump+0xd6>
 80009e8:	68fb      	ldr	r3, [r7, #12]
 80009ea:	617b      	str	r3, [r7, #20]
 80009ec:	697b      	ldr	r3, [r7, #20]
 80009ee:	1d1a      	adds	r2, r3, #4
 80009f0:	617a      	str	r2, [r7, #20]
 80009f2:	681b      	ldr	r3, [r3, #0]
 80009f4:	4619      	mov	r1, r3
 80009f6:	480b      	ldr	r0, [pc, #44]	; (8000a24 <put_dump+0xf0>)
 80009f8:	f7ff ff4c 	bl	8000894 <xprintf>
 80009fc:	687b      	ldr	r3, [r7, #4]
 80009fe:	3b01      	subs	r3, #1
 8000a00:	607b      	str	r3, [r7, #4]
 8000a02:	687b      	ldr	r3, [r7, #4]
 8000a04:	2b00      	cmp	r3, #0
 8000a06:	d1f1      	bne.n	80009ec <put_dump+0xb8>
 8000a08:	bf00      	nop
 8000a0a:	200a      	movs	r0, #10
 8000a0c:	f7ff fd6a 	bl	80004e4 <xputc>
 8000a10:	bf00      	nop
 8000a12:	3720      	adds	r7, #32
 8000a14:	46bd      	mov	sp, r7
 8000a16:	bd80      	pop	{r7, pc}
 8000a18:	08003704 	.word	0x08003704
 8000a1c:	0800370c 	.word	0x0800370c
 8000a20:	08003714 	.word	0x08003714
 8000a24:	0800371c 	.word	0x0800371c

08000a28 <xgets>:
 8000a28:	b580      	push	{r7, lr}
 8000a2a:	b084      	sub	sp, #16
 8000a2c:	af00      	add	r7, sp, #0
 8000a2e:	6078      	str	r0, [r7, #4]
 8000a30:	6039      	str	r1, [r7, #0]
 8000a32:	4b24      	ldr	r3, [pc, #144]	; (8000ac4 <xgets+0x9c>)
 8000a34:	681b      	ldr	r3, [r3, #0]
 8000a36:	2b00      	cmp	r3, #0
 8000a38:	d101      	bne.n	8000a3e <xgets+0x16>
 8000a3a:	2300      	movs	r3, #0
 8000a3c:	e03e      	b.n	8000abc <xgets+0x94>
 8000a3e:	2300      	movs	r3, #0
 8000a40:	60fb      	str	r3, [r7, #12]
 8000a42:	4b20      	ldr	r3, [pc, #128]	; (8000ac4 <xgets+0x9c>)
 8000a44:	681b      	ldr	r3, [r3, #0]
 8000a46:	4798      	blx	r3
 8000a48:	4603      	mov	r3, r0
 8000a4a:	60bb      	str	r3, [r7, #8]
 8000a4c:	68bb      	ldr	r3, [r7, #8]
 8000a4e:	2b00      	cmp	r3, #0
 8000a50:	d101      	bne.n	8000a56 <xgets+0x2e>
 8000a52:	2300      	movs	r3, #0
 8000a54:	e032      	b.n	8000abc <xgets+0x94>
 8000a56:	68bb      	ldr	r3, [r7, #8]
 8000a58:	2b0d      	cmp	r3, #13
 8000a5a:	d025      	beq.n	8000aa8 <xgets+0x80>
 8000a5c:	68bb      	ldr	r3, [r7, #8]
 8000a5e:	2b08      	cmp	r3, #8
 8000a60:	d10b      	bne.n	8000a7a <xgets+0x52>
 8000a62:	68fb      	ldr	r3, [r7, #12]
 8000a64:	2b00      	cmp	r3, #0
 8000a66:	d008      	beq.n	8000a7a <xgets+0x52>
 8000a68:	68fb      	ldr	r3, [r7, #12]
 8000a6a:	3b01      	subs	r3, #1
 8000a6c:	60fb      	str	r3, [r7, #12]
 8000a6e:	68bb      	ldr	r3, [r7, #8]
 8000a70:	b2db      	uxtb	r3, r3
 8000a72:	4618      	mov	r0, r3
 8000a74:	f7ff fd36 	bl	80004e4 <xputc>
 8000a78:	e015      	b.n	8000aa6 <xgets+0x7e>
 8000a7a:	68bb      	ldr	r3, [r7, #8]
 8000a7c:	2b1f      	cmp	r3, #31
 8000a7e:	dde0      	ble.n	8000a42 <xgets+0x1a>
 8000a80:	683b      	ldr	r3, [r7, #0]
 8000a82:	1e5a      	subs	r2, r3, #1
 8000a84:	68fb      	ldr	r3, [r7, #12]
 8000a86:	429a      	cmp	r2, r3
 8000a88:	dddb      	ble.n	8000a42 <xgets+0x1a>
 8000a8a:	68fb      	ldr	r3, [r7, #12]
 8000a8c:	1c5a      	adds	r2, r3, #1
 8000a8e:	60fa      	str	r2, [r7, #12]
 8000a90:	461a      	mov	r2, r3
 8000a92:	687b      	ldr	r3, [r7, #4]
 8000a94:	4413      	add	r3, r2
 8000a96:	68ba      	ldr	r2, [r7, #8]
 8000a98:	b2d2      	uxtb	r2, r2
 8000a9a:	701a      	strb	r2, [r3, #0]
 8000a9c:	68bb      	ldr	r3, [r7, #8]
 8000a9e:	b2db      	uxtb	r3, r3
 8000aa0:	4618      	mov	r0, r3
 8000aa2:	f7ff fd1f 	bl	80004e4 <xputc>
 8000aa6:	e7cc      	b.n	8000a42 <xgets+0x1a>
 8000aa8:	bf00      	nop
 8000aaa:	68fb      	ldr	r3, [r7, #12]
 8000aac:	687a      	ldr	r2, [r7, #4]
 8000aae:	4413      	add	r3, r2
 8000ab0:	2200      	movs	r2, #0
 8000ab2:	701a      	strb	r2, [r3, #0]
 8000ab4:	200a      	movs	r0, #10
 8000ab6:	f7ff fd15 	bl	80004e4 <xputc>
 8000aba:	2301      	movs	r3, #1
 8000abc:	4618      	mov	r0, r3
 8000abe:	3710      	adds	r7, #16
 8000ac0:	46bd      	mov	sp, r7
 8000ac2:	bd80      	pop	{r7, pc}
 8000ac4:	200000ac 	.word	0x200000ac

08000ac8 <xfgets>:
 8000ac8:	b580      	push	{r7, lr}
 8000aca:	b086      	sub	sp, #24
 8000acc:	af00      	add	r7, sp, #0
 8000ace:	60f8      	str	r0, [r7, #12]
 8000ad0:	60b9      	str	r1, [r7, #8]
 8000ad2:	607a      	str	r2, [r7, #4]
 8000ad4:	4b09      	ldr	r3, [pc, #36]	; (8000afc <xfgets+0x34>)
 8000ad6:	681b      	ldr	r3, [r3, #0]
 8000ad8:	617b      	str	r3, [r7, #20]
 8000ada:	4a08      	ldr	r2, [pc, #32]	; (8000afc <xfgets+0x34>)
 8000adc:	68fb      	ldr	r3, [r7, #12]
 8000ade:	6013      	str	r3, [r2, #0]
 8000ae0:	6879      	ldr	r1, [r7, #4]
 8000ae2:	68b8      	ldr	r0, [r7, #8]
 8000ae4:	f7ff ffa0 	bl	8000a28 <xgets>
 8000ae8:	6138      	str	r0, [r7, #16]
 8000aea:	4a04      	ldr	r2, [pc, #16]	; (8000afc <xfgets+0x34>)
 8000aec:	697b      	ldr	r3, [r7, #20]
 8000aee:	6013      	str	r3, [r2, #0]
 8000af0:	693b      	ldr	r3, [r7, #16]
 8000af2:	4618      	mov	r0, r3
 8000af4:	3718      	adds	r7, #24
 8000af6:	46bd      	mov	sp, r7
 8000af8:	bd80      	pop	{r7, pc}
 8000afa:	bf00      	nop
 8000afc:	200000ac 	.word	0x200000ac

08000b00 <xatoi>:
 8000b00:	b480      	push	{r7}
 8000b02:	b085      	sub	sp, #20
 8000b04:	af00      	add	r7, sp, #0
 8000b06:	6078      	str	r0, [r7, #4]
 8000b08:	6039      	str	r1, [r7, #0]
 8000b0a:	2300      	movs	r3, #0
 8000b0c:	727b      	strb	r3, [r7, #9]
 8000b0e:	683b      	ldr	r3, [r7, #0]
 8000b10:	2200      	movs	r2, #0
 8000b12:	601a      	str	r2, [r3, #0]
 8000b14:	e004      	b.n	8000b20 <xatoi+0x20>
 8000b16:	687b      	ldr	r3, [r7, #4]
 8000b18:	681b      	ldr	r3, [r3, #0]
 8000b1a:	1c5a      	adds	r2, r3, #1
 8000b1c:	687b      	ldr	r3, [r7, #4]
 8000b1e:	601a      	str	r2, [r3, #0]
 8000b20:	687b      	ldr	r3, [r7, #4]
 8000b22:	681b      	ldr	r3, [r3, #0]
 8000b24:	781b      	ldrb	r3, [r3, #0]
 8000b26:	72fb      	strb	r3, [r7, #11]
 8000b28:	7afb      	ldrb	r3, [r7, #11]
 8000b2a:	2b20      	cmp	r3, #32
 8000b2c:	d0f3      	beq.n	8000b16 <xatoi+0x16>
 8000b2e:	7afb      	ldrb	r3, [r7, #11]
 8000b30:	2b2d      	cmp	r3, #45	; 0x2d
 8000b32:	d10a      	bne.n	8000b4a <xatoi+0x4a>
 8000b34:	2301      	movs	r3, #1
 8000b36:	727b      	strb	r3, [r7, #9]
 8000b38:	687b      	ldr	r3, [r7, #4]
 8000b3a:	681b      	ldr	r3, [r3, #0]
 8000b3c:	1c5a      	adds	r2, r3, #1
 8000b3e:	687b      	ldr	r3, [r7, #4]
 8000b40:	601a      	str	r2, [r3, #0]
 8000b42:	687b      	ldr	r3, [r7, #4]
 8000b44:	681b      	ldr	r3, [r3, #0]
 8000b46:	781b      	ldrb	r3, [r3, #0]
 8000b48:	72fb      	strb	r3, [r7, #11]
 8000b4a:	7afb      	ldrb	r3, [r7, #11]
 8000b4c:	2b30      	cmp	r3, #48	; 0x30
 8000b4e:	d135      	bne.n	8000bbc <xatoi+0xbc>
 8000b50:	687b      	ldr	r3, [r7, #4]
 8000b52:	681b      	ldr	r3, [r3, #0]
 8000b54:	1c5a      	adds	r2, r3, #1
 8000b56:	687b      	ldr	r3, [r7, #4]
 8000b58:	601a      	str	r2, [r3, #0]
 8000b5a:	687b      	ldr	r3, [r7, #4]
 8000b5c:	681b      	ldr	r3, [r3, #0]
 8000b5e:	781b      	ldrb	r3, [r3, #0]
 8000b60:	72fb      	strb	r3, [r7, #11]
 8000b62:	7afb      	ldrb	r3, [r7, #11]
 8000b64:	2b62      	cmp	r3, #98	; 0x62
 8000b66:	d00d      	beq.n	8000b84 <xatoi+0x84>
 8000b68:	2b78      	cmp	r3, #120	; 0x78
 8000b6a:	d117      	bne.n	8000b9c <xatoi+0x9c>
 8000b6c:	2310      	movs	r3, #16
 8000b6e:	72bb      	strb	r3, [r7, #10]
 8000b70:	687b      	ldr	r3, [r7, #4]
 8000b72:	681b      	ldr	r3, [r3, #0]
 8000b74:	1c5a      	adds	r2, r3, #1
 8000b76:	687b      	ldr	r3, [r7, #4]
 8000b78:	601a      	str	r2, [r3, #0]
 8000b7a:	687b      	ldr	r3, [r7, #4]
 8000b7c:	681b      	ldr	r3, [r3, #0]
 8000b7e:	781b      	ldrb	r3, [r3, #0]
 8000b80:	72fb      	strb	r3, [r7, #11]
 8000b82:	e025      	b.n	8000bd0 <xatoi+0xd0>
 8000b84:	2302      	movs	r3, #2
 8000b86:	72bb      	strb	r3, [r7, #10]
 8000b88:	687b      	ldr	r3, [r7, #4]
 8000b8a:	681b      	ldr	r3, [r3, #0]
 8000b8c:	1c5a      	adds	r2, r3, #1
 8000b8e:	687b      	ldr	r3, [r7, #4]
 8000b90:	601a      	str	r2, [r3, #0]
 8000b92:	687b      	ldr	r3, [r7, #4]
 8000b94:	681b      	ldr	r3, [r3, #0]
 8000b96:	781b      	ldrb	r3, [r3, #0]
 8000b98:	72fb      	strb	r3, [r7, #11]
 8000b9a:	e019      	b.n	8000bd0 <xatoi+0xd0>
 8000b9c:	7afb      	ldrb	r3, [r7, #11]
 8000b9e:	2b20      	cmp	r3, #32
 8000ba0:	d801      	bhi.n	8000ba6 <xatoi+0xa6>
 8000ba2:	2301      	movs	r3, #1
 8000ba4:	e04e      	b.n	8000c44 <xatoi+0x144>
 8000ba6:	7afb      	ldrb	r3, [r7, #11]
 8000ba8:	2b2f      	cmp	r3, #47	; 0x2f
 8000baa:	d902      	bls.n	8000bb2 <xatoi+0xb2>
 8000bac:	7afb      	ldrb	r3, [r7, #11]
 8000bae:	2b39      	cmp	r3, #57	; 0x39
 8000bb0:	d901      	bls.n	8000bb6 <xatoi+0xb6>
 8000bb2:	2300      	movs	r3, #0
 8000bb4:	e046      	b.n	8000c44 <xatoi+0x144>
 8000bb6:	2308      	movs	r3, #8
 8000bb8:	72bb      	strb	r3, [r7, #10]
 8000bba:	e009      	b.n	8000bd0 <xatoi+0xd0>
 8000bbc:	7afb      	ldrb	r3, [r7, #11]
 8000bbe:	2b2f      	cmp	r3, #47	; 0x2f
 8000bc0:	d902      	bls.n	8000bc8 <xatoi+0xc8>
 8000bc2:	7afb      	ldrb	r3, [r7, #11]
 8000bc4:	2b39      	cmp	r3, #57	; 0x39
 8000bc6:	d901      	bls.n	8000bcc <xatoi+0xcc>
 8000bc8:	2300      	movs	r3, #0
 8000bca:	e03b      	b.n	8000c44 <xatoi+0x144>
 8000bcc:	230a      	movs	r3, #10
 8000bce:	72bb      	strb	r3, [r7, #10]
 8000bd0:	2300      	movs	r3, #0
 8000bd2:	60fb      	str	r3, [r7, #12]
 8000bd4:	e029      	b.n	8000c2a <xatoi+0x12a>
 8000bd6:	7afb      	ldrb	r3, [r7, #11]
 8000bd8:	2b60      	cmp	r3, #96	; 0x60
 8000bda:	d902      	bls.n	8000be2 <xatoi+0xe2>
 8000bdc:	7afb      	ldrb	r3, [r7, #11]
 8000bde:	3b20      	subs	r3, #32
 8000be0:	72fb      	strb	r3, [r7, #11]
 8000be2:	7afb      	ldrb	r3, [r7, #11]
 8000be4:	3b30      	subs	r3, #48	; 0x30
 8000be6:	72fb      	strb	r3, [r7, #11]
 8000be8:	7afb      	ldrb	r3, [r7, #11]
 8000bea:	2b10      	cmp	r3, #16
 8000bec:	d907      	bls.n	8000bfe <xatoi+0xfe>
 8000bee:	7afb      	ldrb	r3, [r7, #11]
 8000bf0:	3b07      	subs	r3, #7
 8000bf2:	72fb      	strb	r3, [r7, #11]
 8000bf4:	7afb      	ldrb	r3, [r7, #11]
 8000bf6:	2b09      	cmp	r3, #9
 8000bf8:	d801      	bhi.n	8000bfe <xatoi+0xfe>
 8000bfa:	2300      	movs	r3, #0
 8000bfc:	e022      	b.n	8000c44 <xatoi+0x144>
 8000bfe:	7afa      	ldrb	r2, [r7, #11]
 8000c00:	7abb      	ldrb	r3, [r7, #10]
 8000c02:	429a      	cmp	r2, r3
 8000c04:	d301      	bcc.n	8000c0a <xatoi+0x10a>
 8000c06:	2300      	movs	r3, #0
 8000c08:	e01c      	b.n	8000c44 <xatoi+0x144>
 8000c0a:	7abb      	ldrb	r3, [r7, #10]
 8000c0c:	68fa      	ldr	r2, [r7, #12]
 8000c0e:	fb02 f203 	mul.w	r2, r2, r3
 8000c12:	7afb      	ldrb	r3, [r7, #11]
 8000c14:	4413      	add	r3, r2
 8000c16:	60fb      	str	r3, [r7, #12]
 8000c18:	687b      	ldr	r3, [r7, #4]
 8000c1a:	681b      	ldr	r3, [r3, #0]
 8000c1c:	1c5a      	adds	r2, r3, #1
 8000c1e:	687b      	ldr	r3, [r7, #4]
 8000c20:	601a      	str	r2, [r3, #0]
 8000c22:	687b      	ldr	r3, [r7, #4]
 8000c24:	681b      	ldr	r3, [r3, #0]
 8000c26:	781b      	ldrb	r3, [r3, #0]
 8000c28:	72fb      	strb	r3, [r7, #11]
 8000c2a:	7afb      	ldrb	r3, [r7, #11]
 8000c2c:	2b20      	cmp	r3, #32
 8000c2e:	d8d2      	bhi.n	8000bd6 <xatoi+0xd6>
 8000c30:	7a7b      	ldrb	r3, [r7, #9]
 8000c32:	2b00      	cmp	r3, #0
 8000c34:	d002      	beq.n	8000c3c <xatoi+0x13c>
 8000c36:	68fb      	ldr	r3, [r7, #12]
 8000c38:	425b      	negs	r3, r3
 8000c3a:	60fb      	str	r3, [r7, #12]
 8000c3c:	68fa      	ldr	r2, [r7, #12]
 8000c3e:	683b      	ldr	r3, [r7, #0]
 8000c40:	601a      	str	r2, [r3, #0]
 8000c42:	2301      	movs	r3, #1
 8000c44:	4618      	mov	r0, r3
 8000c46:	3714      	adds	r7, #20
 8000c48:	46bd      	mov	sp, r7
 8000c4a:	bc80      	pop	{r7}
 8000c4c:	4770      	bx	lr
 8000c4e:	bf00      	nop

08000c50 <NVIC_EnableIRQ>:
 8000c50:	b480      	push	{r7}
 8000c52:	b083      	sub	sp, #12
 8000c54:	af00      	add	r7, sp, #0
 8000c56:	4603      	mov	r3, r0
 8000c58:	71fb      	strb	r3, [r7, #7]
 8000c5a:	4908      	ldr	r1, [pc, #32]	; (8000c7c <NVIC_EnableIRQ+0x2c>)
 8000c5c:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000c60:	095b      	lsrs	r3, r3, #5
 8000c62:	79fa      	ldrb	r2, [r7, #7]
 8000c64:	f002 021f 	and.w	r2, r2, #31
 8000c68:	2001      	movs	r0, #1
 8000c6a:	fa00 f202 	lsl.w	r2, r0, r2
 8000c6e:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8000c72:	bf00      	nop
 8000c74:	370c      	adds	r7, #12
 8000c76:	46bd      	mov	sp, r7
 8000c78:	bc80      	pop	{r7}
 8000c7a:	4770      	bx	lr
 8000c7c:	e000e100 	.word	0xe000e100

08000c80 <dbg_init>:
 8000c80:	b580      	push	{r7, lr}
 8000c82:	af00      	add	r7, sp, #0
 8000c84:	4a1a      	ldr	r2, [pc, #104]	; (8000cf0 <dbg_init+0x70>)
 8000c86:	4b1a      	ldr	r3, [pc, #104]	; (8000cf0 <dbg_init+0x70>)
 8000c88:	685b      	ldr	r3, [r3, #4]
 8000c8a:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
 8000c8e:	6053      	str	r3, [r2, #4]
 8000c90:	4a17      	ldr	r2, [pc, #92]	; (8000cf0 <dbg_init+0x70>)
 8000c92:	4b17      	ldr	r3, [pc, #92]	; (8000cf0 <dbg_init+0x70>)
 8000c94:	685b      	ldr	r3, [r3, #4]
 8000c96:	f043 03b0 	orr.w	r3, r3, #176	; 0xb0
 8000c9a:	6053      	str	r3, [r2, #4]
 8000c9c:	4a15      	ldr	r2, [pc, #84]	; (8000cf4 <dbg_init+0x74>)
 8000c9e:	4b15      	ldr	r3, [pc, #84]	; (8000cf4 <dbg_init+0x74>)
 8000ca0:	899b      	ldrh	r3, [r3, #12]
 8000ca2:	b29b      	uxth	r3, r3
 8000ca4:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000ca8:	b29b      	uxth	r3, r3
 8000caa:	8193      	strh	r3, [r2, #12]
 8000cac:	4a11      	ldr	r2, [pc, #68]	; (8000cf4 <dbg_init+0x74>)
 8000cae:	4b11      	ldr	r3, [pc, #68]	; (8000cf4 <dbg_init+0x74>)
 8000cb0:	899b      	ldrh	r3, [r3, #12]
 8000cb2:	b29b      	uxth	r3, r3
 8000cb4:	f043 0304 	orr.w	r3, r3, #4
 8000cb8:	b29b      	uxth	r3, r3
 8000cba:	8193      	strh	r3, [r2, #12]
 8000cbc:	4a0d      	ldr	r2, [pc, #52]	; (8000cf4 <dbg_init+0x74>)
 8000cbe:	4b0d      	ldr	r3, [pc, #52]	; (8000cf4 <dbg_init+0x74>)
 8000cc0:	899b      	ldrh	r3, [r3, #12]
 8000cc2:	b29b      	uxth	r3, r3
 8000cc4:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8000cc8:	b29b      	uxth	r3, r3
 8000cca:	8193      	strh	r3, [r2, #12]
 8000ccc:	2025      	movs	r0, #37	; 0x25
 8000cce:	f7ff ffbf 	bl	8000c50 <NVIC_EnableIRQ>
 8000cd2:	4b08      	ldr	r3, [pc, #32]	; (8000cf4 <dbg_init+0x74>)
 8000cd4:	f240 2271 	movw	r2, #625	; 0x271
 8000cd8:	811a      	strh	r2, [r3, #8]
 8000cda:	4b07      	ldr	r3, [pc, #28]	; (8000cf8 <dbg_init+0x78>)
 8000cdc:	2200      	movs	r2, #0
 8000cde:	601a      	str	r2, [r3, #0]
 8000ce0:	4b06      	ldr	r3, [pc, #24]	; (8000cfc <dbg_init+0x7c>)
 8000ce2:	2200      	movs	r2, #0
 8000ce4:	601a      	str	r2, [r3, #0]
 8000ce6:	4b06      	ldr	r3, [pc, #24]	; (8000d00 <dbg_init+0x80>)
 8000ce8:	4a06      	ldr	r2, [pc, #24]	; (8000d04 <dbg_init+0x84>)
 8000cea:	601a      	str	r2, [r3, #0]
 8000cec:	bf00      	nop
 8000cee:	bd80      	pop	{r7, pc}
 8000cf0:	40010800 	.word	0x40010800
 8000cf4:	40013800 	.word	0x40013800
 8000cf8:	200004b0 	.word	0x200004b0
 8000cfc:	200004b4 	.word	0x200004b4
 8000d00:	200000a4 	.word	0x200000a4
 8000d04:	08000d09 	.word	0x08000d09

08000d08 <uart1_putch>:
 8000d08:	b480      	push	{r7}
 8000d0a:	b083      	sub	sp, #12
 8000d0c:	af00      	add	r7, sp, #0
 8000d0e:	4603      	mov	r3, r0
 8000d10:	71fb      	strb	r3, [r7, #7]
 8000d12:	4b13      	ldr	r3, [pc, #76]	; (8000d60 <uart1_putch+0x58>)
 8000d14:	681a      	ldr	r2, [r3, #0]
 8000d16:	4b13      	ldr	r3, [pc, #76]	; (8000d64 <uart1_putch+0x5c>)
 8000d18:	681b      	ldr	r3, [r3, #0]
 8000d1a:	429a      	cmp	r2, r3
 8000d1c:	d107      	bne.n	8000d2e <uart1_putch+0x26>
 8000d1e:	4a12      	ldr	r2, [pc, #72]	; (8000d68 <uart1_putch+0x60>)
 8000d20:	4b11      	ldr	r3, [pc, #68]	; (8000d68 <uart1_putch+0x60>)
 8000d22:	899b      	ldrh	r3, [r3, #12]
 8000d24:	b29b      	uxth	r3, r3
 8000d26:	f043 0308 	orr.w	r3, r3, #8
 8000d2a:	b29b      	uxth	r3, r3
 8000d2c:	8193      	strh	r3, [r2, #12]
 8000d2e:	4b0c      	ldr	r3, [pc, #48]	; (8000d60 <uart1_putch+0x58>)
 8000d30:	681b      	ldr	r3, [r3, #0]
 8000d32:	490e      	ldr	r1, [pc, #56]	; (8000d6c <uart1_putch+0x64>)
 8000d34:	79fa      	ldrb	r2, [r7, #7]
 8000d36:	54ca      	strb	r2, [r1, r3]
 8000d38:	4b09      	ldr	r3, [pc, #36]	; (8000d60 <uart1_putch+0x58>)
 8000d3a:	681b      	ldr	r3, [r3, #0]
 8000d3c:	3301      	adds	r3, #1
 8000d3e:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8000d42:	4a07      	ldr	r2, [pc, #28]	; (8000d60 <uart1_putch+0x58>)
 8000d44:	6013      	str	r3, [r2, #0]
 8000d46:	4a08      	ldr	r2, [pc, #32]	; (8000d68 <uart1_putch+0x60>)
 8000d48:	4b07      	ldr	r3, [pc, #28]	; (8000d68 <uart1_putch+0x60>)
 8000d4a:	899b      	ldrh	r3, [r3, #12]
 8000d4c:	b29b      	uxth	r3, r3
 8000d4e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8000d52:	b29b      	uxth	r3, r3
 8000d54:	8193      	strh	r3, [r2, #12]
 8000d56:	bf00      	nop
 8000d58:	370c      	adds	r7, #12
 8000d5a:	46bd      	mov	sp, r7
 8000d5c:	bc80      	pop	{r7}
 8000d5e:	4770      	bx	lr
 8000d60:	200004b4 	.word	0x200004b4
 8000d64:	200004b0 	.word	0x200004b0
 8000d68:	40013800 	.word	0x40013800
 8000d6c:	200000b0 	.word	0x200000b0

08000d70 <USART1_IRQHandler>:
 8000d70:	b480      	push	{r7}
 8000d72:	af00      	add	r7, sp, #0
 8000d74:	4b13      	ldr	r3, [pc, #76]	; (8000dc4 <USART1_IRQHandler+0x54>)
 8000d76:	881b      	ldrh	r3, [r3, #0]
 8000d78:	b29b      	uxth	r3, r3
 8000d7a:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8000d7e:	2b00      	cmp	r3, #0
 8000d80:	d01c      	beq.n	8000dbc <USART1_IRQHandler+0x4c>
 8000d82:	4b11      	ldr	r3, [pc, #68]	; (8000dc8 <USART1_IRQHandler+0x58>)
 8000d84:	681a      	ldr	r2, [r3, #0]
 8000d86:	4b11      	ldr	r3, [pc, #68]	; (8000dcc <USART1_IRQHandler+0x5c>)
 8000d88:	681b      	ldr	r3, [r3, #0]
 8000d8a:	429a      	cmp	r2, r3
 8000d8c:	d108      	bne.n	8000da0 <USART1_IRQHandler+0x30>
 8000d8e:	4a0d      	ldr	r2, [pc, #52]	; (8000dc4 <USART1_IRQHandler+0x54>)
 8000d90:	4b0c      	ldr	r3, [pc, #48]	; (8000dc4 <USART1_IRQHandler+0x54>)
 8000d92:	899b      	ldrh	r3, [r3, #12]
 8000d94:	b29b      	uxth	r3, r3
 8000d96:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 8000d9a:	b29b      	uxth	r3, r3
 8000d9c:	8193      	strh	r3, [r2, #12]
 8000d9e:	e00d      	b.n	8000dbc <USART1_IRQHandler+0x4c>
 8000da0:	4a08      	ldr	r2, [pc, #32]	; (8000dc4 <USART1_IRQHandler+0x54>)
 8000da2:	4b09      	ldr	r3, [pc, #36]	; (8000dc8 <USART1_IRQHandler+0x58>)
 8000da4:	681b      	ldr	r3, [r3, #0]
 8000da6:	490a      	ldr	r1, [pc, #40]	; (8000dd0 <USART1_IRQHandler+0x60>)
 8000da8:	5ccb      	ldrb	r3, [r1, r3]
 8000daa:	b29b      	uxth	r3, r3
 8000dac:	8093      	strh	r3, [r2, #4]
 8000dae:	4b06      	ldr	r3, [pc, #24]	; (8000dc8 <USART1_IRQHandler+0x58>)
 8000db0:	681b      	ldr	r3, [r3, #0]
 8000db2:	3301      	adds	r3, #1
 8000db4:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8000db8:	4a03      	ldr	r2, [pc, #12]	; (8000dc8 <USART1_IRQHandler+0x58>)
 8000dba:	6013      	str	r3, [r2, #0]
 8000dbc:	bf00      	nop
 8000dbe:	46bd      	mov	sp, r7
 8000dc0:	bc80      	pop	{r7}
 8000dc2:	4770      	bx	lr
 8000dc4:	40013800 	.word	0x40013800
 8000dc8:	200004b0 	.word	0x200004b0
 8000dcc:	200004b4 	.word	0x200004b4
 8000dd0:	200000b0 	.word	0x200000b0

08000dd4 <NVIC_EnableIRQ>:
 8000dd4:	b480      	push	{r7}
 8000dd6:	b083      	sub	sp, #12
 8000dd8:	af00      	add	r7, sp, #0
 8000dda:	4603      	mov	r3, r0
 8000ddc:	71fb      	strb	r3, [r7, #7]
 8000dde:	4908      	ldr	r1, [pc, #32]	; (8000e00 <NVIC_EnableIRQ+0x2c>)
 8000de0:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000de4:	095b      	lsrs	r3, r3, #5
 8000de6:	79fa      	ldrb	r2, [r7, #7]
 8000de8:	f002 021f 	and.w	r2, r2, #31
 8000dec:	2001      	movs	r0, #1
 8000dee:	fa00 f202 	lsl.w	r2, r0, r2
 8000df2:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8000df6:	bf00      	nop
 8000df8:	370c      	adds	r7, #12
 8000dfa:	46bd      	mov	sp, r7
 8000dfc:	bc80      	pop	{r7}
 8000dfe:	4770      	bx	lr
 8000e00:	e000e100 	.word	0xe000e100

08000e04 <uart_init>:
 8000e04:	b580      	push	{r7, lr}
 8000e06:	af00      	add	r7, sp, #0
 8000e08:	4a1a      	ldr	r2, [pc, #104]	; (8000e74 <uart_init+0x70>)
 8000e0a:	4b1a      	ldr	r3, [pc, #104]	; (8000e74 <uart_init+0x70>)
 8000e0c:	681b      	ldr	r3, [r3, #0]
 8000e0e:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
 8000e12:	6013      	str	r3, [r2, #0]
 8000e14:	4a17      	ldr	r2, [pc, #92]	; (8000e74 <uart_init+0x70>)
 8000e16:	4b17      	ldr	r3, [pc, #92]	; (8000e74 <uart_init+0x70>)
 8000e18:	681b      	ldr	r3, [r3, #0]
 8000e1a:	f443 6330 	orr.w	r3, r3, #2816	; 0xb00
 8000e1e:	6013      	str	r3, [r2, #0]
 8000e20:	4a15      	ldr	r2, [pc, #84]	; (8000e78 <uart_init+0x74>)
 8000e22:	4b15      	ldr	r3, [pc, #84]	; (8000e78 <uart_init+0x74>)
 8000e24:	899b      	ldrh	r3, [r3, #12]
 8000e26:	b29b      	uxth	r3, r3
 8000e28:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000e2c:	b29b      	uxth	r3, r3
 8000e2e:	8193      	strh	r3, [r2, #12]
 8000e30:	4a11      	ldr	r2, [pc, #68]	; (8000e78 <uart_init+0x74>)
 8000e32:	4b11      	ldr	r3, [pc, #68]	; (8000e78 <uart_init+0x74>)
 8000e34:	899b      	ldrh	r3, [r3, #12]
 8000e36:	b29b      	uxth	r3, r3
 8000e38:	f043 0304 	orr.w	r3, r3, #4
 8000e3c:	b29b      	uxth	r3, r3
 8000e3e:	8193      	strh	r3, [r2, #12]
 8000e40:	4a0d      	ldr	r2, [pc, #52]	; (8000e78 <uart_init+0x74>)
 8000e42:	4b0d      	ldr	r3, [pc, #52]	; (8000e78 <uart_init+0x74>)
 8000e44:	899b      	ldrh	r3, [r3, #12]
 8000e46:	b29b      	uxth	r3, r3
 8000e48:	f043 0320 	orr.w	r3, r3, #32
 8000e4c:	b29b      	uxth	r3, r3
 8000e4e:	8193      	strh	r3, [r2, #12]
 8000e50:	4a09      	ldr	r2, [pc, #36]	; (8000e78 <uart_init+0x74>)
 8000e52:	4b09      	ldr	r3, [pc, #36]	; (8000e78 <uart_init+0x74>)
 8000e54:	899b      	ldrh	r3, [r3, #12]
 8000e56:	b29b      	uxth	r3, r3
 8000e58:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8000e5c:	b29b      	uxth	r3, r3
 8000e5e:	8193      	strh	r3, [r2, #12]
 8000e60:	2026      	movs	r0, #38	; 0x26
 8000e62:	f7ff ffb7 	bl	8000dd4 <NVIC_EnableIRQ>
 8000e66:	4b04      	ldr	r3, [pc, #16]	; (8000e78 <uart_init+0x74>)
 8000e68:	f44f 729c 	mov.w	r2, #312	; 0x138
 8000e6c:	811a      	strh	r2, [r3, #8]
 8000e6e:	bf00      	nop
 8000e70:	bd80      	pop	{r7, pc}
 8000e72:	bf00      	nop
 8000e74:	40010800 	.word	0x40010800
 8000e78:	40004400 	.word	0x40004400

08000e7c <uart_send>:
 8000e7c:	b480      	push	{r7}
 8000e7e:	b085      	sub	sp, #20
 8000e80:	af00      	add	r7, sp, #0
 8000e82:	6078      	str	r0, [r7, #4]
 8000e84:	6039      	str	r1, [r7, #0]
 8000e86:	4b1f      	ldr	r3, [pc, #124]	; (8000f04 <uart_send+0x88>)
 8000e88:	681a      	ldr	r2, [r3, #0]
 8000e8a:	4b1f      	ldr	r3, [pc, #124]	; (8000f08 <uart_send+0x8c>)
 8000e8c:	681b      	ldr	r3, [r3, #0]
 8000e8e:	429a      	cmp	r2, r3
 8000e90:	d107      	bne.n	8000ea2 <uart_send+0x26>
 8000e92:	4a1e      	ldr	r2, [pc, #120]	; (8000f0c <uart_send+0x90>)
 8000e94:	4b1d      	ldr	r3, [pc, #116]	; (8000f0c <uart_send+0x90>)
 8000e96:	899b      	ldrh	r3, [r3, #12]
 8000e98:	b29b      	uxth	r3, r3
 8000e9a:	f043 0308 	orr.w	r3, r3, #8
 8000e9e:	b29b      	uxth	r3, r3
 8000ea0:	8193      	strh	r3, [r2, #12]
 8000ea2:	2300      	movs	r3, #0
 8000ea4:	60fb      	str	r3, [r7, #12]
 8000ea6:	e01b      	b.n	8000ee0 <uart_send+0x64>
 8000ea8:	4b16      	ldr	r3, [pc, #88]	; (8000f04 <uart_send+0x88>)
 8000eaa:	681b      	ldr	r3, [r3, #0]
 8000eac:	68fa      	ldr	r2, [r7, #12]
 8000eae:	6879      	ldr	r1, [r7, #4]
 8000eb0:	440a      	add	r2, r1
 8000eb2:	7811      	ldrb	r1, [r2, #0]
 8000eb4:	4a16      	ldr	r2, [pc, #88]	; (8000f10 <uart_send+0x94>)
 8000eb6:	54d1      	strb	r1, [r2, r3]
 8000eb8:	4b12      	ldr	r3, [pc, #72]	; (8000f04 <uart_send+0x88>)
 8000eba:	681b      	ldr	r3, [r3, #0]
 8000ebc:	3301      	adds	r3, #1
 8000ebe:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8000ec2:	4a10      	ldr	r2, [pc, #64]	; (8000f04 <uart_send+0x88>)
 8000ec4:	6013      	str	r3, [r2, #0]
 8000ec6:	4b0f      	ldr	r3, [pc, #60]	; (8000f04 <uart_send+0x88>)
 8000ec8:	681a      	ldr	r2, [r3, #0]
 8000eca:	4b0f      	ldr	r3, [pc, #60]	; (8000f08 <uart_send+0x8c>)
 8000ecc:	681b      	ldr	r3, [r3, #0]
 8000ece:	429a      	cmp	r2, r3
 8000ed0:	d103      	bne.n	8000eda <uart_send+0x5e>
 8000ed2:	68fb      	ldr	r3, [r7, #12]
 8000ed4:	3301      	adds	r3, #1
 8000ed6:	60fb      	str	r3, [r7, #12]
 8000ed8:	e006      	b.n	8000ee8 <uart_send+0x6c>
 8000eda:	68fb      	ldr	r3, [r7, #12]
 8000edc:	3301      	adds	r3, #1
 8000ede:	60fb      	str	r3, [r7, #12]
 8000ee0:	68fa      	ldr	r2, [r7, #12]
 8000ee2:	683b      	ldr	r3, [r7, #0]
 8000ee4:	429a      	cmp	r2, r3
 8000ee6:	dbdf      	blt.n	8000ea8 <uart_send+0x2c>
 8000ee8:	4a08      	ldr	r2, [pc, #32]	; (8000f0c <uart_send+0x90>)
 8000eea:	4b08      	ldr	r3, [pc, #32]	; (8000f0c <uart_send+0x90>)
 8000eec:	899b      	ldrh	r3, [r3, #12]
 8000eee:	b29b      	uxth	r3, r3
 8000ef0:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8000ef4:	b29b      	uxth	r3, r3
 8000ef6:	8193      	strh	r3, [r2, #12]
 8000ef8:	68fb      	ldr	r3, [r7, #12]
 8000efa:	4618      	mov	r0, r3
 8000efc:	3714      	adds	r7, #20
 8000efe:	46bd      	mov	sp, r7
 8000f00:	bc80      	pop	{r7}
 8000f02:	4770      	bx	lr
 8000f04:	200008bc 	.word	0x200008bc
 8000f08:	200008b8 	.word	0x200008b8
 8000f0c:	40004400 	.word	0x40004400
 8000f10:	200004b8 	.word	0x200004b8

08000f14 <uart_send_str>:
 8000f14:	b480      	push	{r7}
 8000f16:	b085      	sub	sp, #20
 8000f18:	af00      	add	r7, sp, #0
 8000f1a:	6078      	str	r0, [r7, #4]
 8000f1c:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000f20:	60bb      	str	r3, [r7, #8]
 8000f22:	4b24      	ldr	r3, [pc, #144]	; (8000fb4 <uart_send_str+0xa0>)
 8000f24:	681a      	ldr	r2, [r3, #0]
 8000f26:	4b24      	ldr	r3, [pc, #144]	; (8000fb8 <uart_send_str+0xa4>)
 8000f28:	681b      	ldr	r3, [r3, #0]
 8000f2a:	1ad3      	subs	r3, r2, r3
 8000f2c:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8000f30:	68ba      	ldr	r2, [r7, #8]
 8000f32:	1ad3      	subs	r3, r2, r3
 8000f34:	60bb      	str	r3, [r7, #8]
 8000f36:	4b1f      	ldr	r3, [pc, #124]	; (8000fb4 <uart_send_str+0xa0>)
 8000f38:	681a      	ldr	r2, [r3, #0]
 8000f3a:	4b1f      	ldr	r3, [pc, #124]	; (8000fb8 <uart_send_str+0xa4>)
 8000f3c:	681b      	ldr	r3, [r3, #0]
 8000f3e:	429a      	cmp	r2, r3
 8000f40:	d107      	bne.n	8000f52 <uart_send_str+0x3e>
 8000f42:	4a1e      	ldr	r2, [pc, #120]	; (8000fbc <uart_send_str+0xa8>)
 8000f44:	4b1d      	ldr	r3, [pc, #116]	; (8000fbc <uart_send_str+0xa8>)
 8000f46:	899b      	ldrh	r3, [r3, #12]
 8000f48:	b29b      	uxth	r3, r3
 8000f4a:	f043 0308 	orr.w	r3, r3, #8
 8000f4e:	b29b      	uxth	r3, r3
 8000f50:	8193      	strh	r3, [r2, #12]
 8000f52:	2300      	movs	r3, #0
 8000f54:	60fb      	str	r3, [r7, #12]
 8000f56:	e01b      	b.n	8000f90 <uart_send_str+0x7c>
 8000f58:	68fb      	ldr	r3, [r7, #12]
 8000f5a:	687a      	ldr	r2, [r7, #4]
 8000f5c:	4413      	add	r3, r2
 8000f5e:	781b      	ldrb	r3, [r3, #0]
 8000f60:	2b00      	cmp	r3, #0
 8000f62:	d103      	bne.n	8000f6c <uart_send_str+0x58>
 8000f64:	68fb      	ldr	r3, [r7, #12]
 8000f66:	3301      	adds	r3, #1
 8000f68:	60fb      	str	r3, [r7, #12]
 8000f6a:	e015      	b.n	8000f98 <uart_send_str+0x84>
 8000f6c:	4b11      	ldr	r3, [pc, #68]	; (8000fb4 <uart_send_str+0xa0>)
 8000f6e:	681b      	ldr	r3, [r3, #0]
 8000f70:	68fa      	ldr	r2, [r7, #12]
 8000f72:	6879      	ldr	r1, [r7, #4]
 8000f74:	440a      	add	r2, r1
 8000f76:	7811      	ldrb	r1, [r2, #0]
 8000f78:	4a11      	ldr	r2, [pc, #68]	; (8000fc0 <uart_send_str+0xac>)
 8000f7a:	54d1      	strb	r1, [r2, r3]
 8000f7c:	4b0d      	ldr	r3, [pc, #52]	; (8000fb4 <uart_send_str+0xa0>)
 8000f7e:	681b      	ldr	r3, [r3, #0]
 8000f80:	3301      	adds	r3, #1
 8000f82:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8000f86:	4a0b      	ldr	r2, [pc, #44]	; (8000fb4 <uart_send_str+0xa0>)
 8000f88:	6013      	str	r3, [r2, #0]
 8000f8a:	68fb      	ldr	r3, [r7, #12]
 8000f8c:	3301      	adds	r3, #1
 8000f8e:	60fb      	str	r3, [r7, #12]
 8000f90:	68fa      	ldr	r2, [r7, #12]
 8000f92:	68bb      	ldr	r3, [r7, #8]
 8000f94:	429a      	cmp	r2, r3
 8000f96:	dbdf      	blt.n	8000f58 <uart_send_str+0x44>
 8000f98:	4a08      	ldr	r2, [pc, #32]	; (8000fbc <uart_send_str+0xa8>)
 8000f9a:	4b08      	ldr	r3, [pc, #32]	; (8000fbc <uart_send_str+0xa8>)
 8000f9c:	899b      	ldrh	r3, [r3, #12]
 8000f9e:	b29b      	uxth	r3, r3
 8000fa0:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8000fa4:	b29b      	uxth	r3, r3
 8000fa6:	8193      	strh	r3, [r2, #12]
 8000fa8:	68fb      	ldr	r3, [r7, #12]
 8000faa:	4618      	mov	r0, r3
 8000fac:	3714      	adds	r7, #20
 8000fae:	46bd      	mov	sp, r7
 8000fb0:	bc80      	pop	{r7}
 8000fb2:	4770      	bx	lr
 8000fb4:	200008bc 	.word	0x200008bc
 8000fb8:	200008b8 	.word	0x200008b8
 8000fbc:	40004400 	.word	0x40004400
 8000fc0:	200004b8 	.word	0x200004b8

08000fc4 <uart_read>:
 8000fc4:	b480      	push	{r7}
 8000fc6:	b085      	sub	sp, #20
 8000fc8:	af00      	add	r7, sp, #0
 8000fca:	6078      	str	r0, [r7, #4]
 8000fcc:	6039      	str	r1, [r7, #0]
 8000fce:	4b18      	ldr	r3, [pc, #96]	; (8001030 <uart_read+0x6c>)
 8000fd0:	681a      	ldr	r2, [r3, #0]
 8000fd2:	4b18      	ldr	r3, [pc, #96]	; (8001034 <uart_read+0x70>)
 8000fd4:	681b      	ldr	r3, [r3, #0]
 8000fd6:	429a      	cmp	r2, r3
 8000fd8:	d101      	bne.n	8000fde <uart_read+0x1a>
 8000fda:	2300      	movs	r3, #0
 8000fdc:	e023      	b.n	8001026 <uart_read+0x62>
 8000fde:	2300      	movs	r3, #0
 8000fe0:	60fb      	str	r3, [r7, #12]
 8000fe2:	e01b      	b.n	800101c <uart_read+0x58>
 8000fe4:	68fb      	ldr	r3, [r7, #12]
 8000fe6:	687a      	ldr	r2, [r7, #4]
 8000fe8:	4413      	add	r3, r2
 8000fea:	4a11      	ldr	r2, [pc, #68]	; (8001030 <uart_read+0x6c>)
 8000fec:	6812      	ldr	r2, [r2, #0]
 8000fee:	4912      	ldr	r1, [pc, #72]	; (8001038 <uart_read+0x74>)
 8000ff0:	5c8a      	ldrb	r2, [r1, r2]
 8000ff2:	701a      	strb	r2, [r3, #0]
 8000ff4:	4b0e      	ldr	r3, [pc, #56]	; (8001030 <uart_read+0x6c>)
 8000ff6:	681b      	ldr	r3, [r3, #0]
 8000ff8:	3301      	adds	r3, #1
 8000ffa:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8000ffe:	4a0c      	ldr	r2, [pc, #48]	; (8001030 <uart_read+0x6c>)
 8001000:	6013      	str	r3, [r2, #0]
 8001002:	4b0b      	ldr	r3, [pc, #44]	; (8001030 <uart_read+0x6c>)
 8001004:	681a      	ldr	r2, [r3, #0]
 8001006:	4b0b      	ldr	r3, [pc, #44]	; (8001034 <uart_read+0x70>)
 8001008:	681b      	ldr	r3, [r3, #0]
 800100a:	429a      	cmp	r2, r3
 800100c:	d103      	bne.n	8001016 <uart_read+0x52>
 800100e:	68fb      	ldr	r3, [r7, #12]
 8001010:	3301      	adds	r3, #1
 8001012:	60fb      	str	r3, [r7, #12]
 8001014:	e006      	b.n	8001024 <uart_read+0x60>
 8001016:	68fb      	ldr	r3, [r7, #12]
 8001018:	3301      	adds	r3, #1
 800101a:	60fb      	str	r3, [r7, #12]
 800101c:	68fa      	ldr	r2, [r7, #12]
 800101e:	683b      	ldr	r3, [r7, #0]
 8001020:	429a      	cmp	r2, r3
 8001022:	dbdf      	blt.n	8000fe4 <uart_read+0x20>
 8001024:	68fb      	ldr	r3, [r7, #12]
 8001026:	4618      	mov	r0, r3
 8001028:	3714      	adds	r7, #20
 800102a:	46bd      	mov	sp, r7
 800102c:	bc80      	pop	{r7}
 800102e:	4770      	bx	lr
 8001030:	20000cc4 	.word	0x20000cc4
 8001034:	20000cc0 	.word	0x20000cc0
 8001038:	200008c0 	.word	0x200008c0

0800103c <USART2_IRQHandler>:
 800103c:	b480      	push	{r7}
 800103e:	af00      	add	r7, sp, #0
 8001040:	4b1e      	ldr	r3, [pc, #120]	; (80010bc <USART2_IRQHandler+0x80>)
 8001042:	881b      	ldrh	r3, [r3, #0]
 8001044:	b29b      	uxth	r3, r3
 8001046:	f003 0380 	and.w	r3, r3, #128	; 0x80
 800104a:	2b00      	cmp	r3, #0
 800104c:	d01c      	beq.n	8001088 <USART2_IRQHandler+0x4c>
 800104e:	4b1c      	ldr	r3, [pc, #112]	; (80010c0 <USART2_IRQHandler+0x84>)
 8001050:	681a      	ldr	r2, [r3, #0]
 8001052:	4b1c      	ldr	r3, [pc, #112]	; (80010c4 <USART2_IRQHandler+0x88>)
 8001054:	681b      	ldr	r3, [r3, #0]
 8001056:	429a      	cmp	r2, r3
 8001058:	d108      	bne.n	800106c <USART2_IRQHandler+0x30>
 800105a:	4a18      	ldr	r2, [pc, #96]	; (80010bc <USART2_IRQHandler+0x80>)
 800105c:	4b17      	ldr	r3, [pc, #92]	; (80010bc <USART2_IRQHandler+0x80>)
 800105e:	899b      	ldrh	r3, [r3, #12]
 8001060:	b29b      	uxth	r3, r3
 8001062:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 8001066:	b29b      	uxth	r3, r3
 8001068:	8193      	strh	r3, [r2, #12]
 800106a:	e00d      	b.n	8001088 <USART2_IRQHandler+0x4c>
 800106c:	4a13      	ldr	r2, [pc, #76]	; (80010bc <USART2_IRQHandler+0x80>)
 800106e:	4b14      	ldr	r3, [pc, #80]	; (80010c0 <USART2_IRQHandler+0x84>)
 8001070:	681b      	ldr	r3, [r3, #0]
 8001072:	4915      	ldr	r1, [pc, #84]	; (80010c8 <USART2_IRQHandler+0x8c>)
 8001074:	5ccb      	ldrb	r3, [r1, r3]
 8001076:	b29b      	uxth	r3, r3
 8001078:	8093      	strh	r3, [r2, #4]
 800107a:	4b11      	ldr	r3, [pc, #68]	; (80010c0 <USART2_IRQHandler+0x84>)
 800107c:	681b      	ldr	r3, [r3, #0]
 800107e:	3301      	adds	r3, #1
 8001080:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8001084:	4a0e      	ldr	r2, [pc, #56]	; (80010c0 <USART2_IRQHandler+0x84>)
 8001086:	6013      	str	r3, [r2, #0]
 8001088:	4b0c      	ldr	r3, [pc, #48]	; (80010bc <USART2_IRQHandler+0x80>)
 800108a:	881b      	ldrh	r3, [r3, #0]
 800108c:	b29b      	uxth	r3, r3
 800108e:	f003 0320 	and.w	r3, r3, #32
 8001092:	2b00      	cmp	r3, #0
 8001094:	d00e      	beq.n	80010b4 <USART2_IRQHandler+0x78>
 8001096:	4b0d      	ldr	r3, [pc, #52]	; (80010cc <USART2_IRQHandler+0x90>)
 8001098:	681b      	ldr	r3, [r3, #0]
 800109a:	4a08      	ldr	r2, [pc, #32]	; (80010bc <USART2_IRQHandler+0x80>)
 800109c:	8892      	ldrh	r2, [r2, #4]
 800109e:	b292      	uxth	r2, r2
 80010a0:	b2d1      	uxtb	r1, r2
 80010a2:	4a0b      	ldr	r2, [pc, #44]	; (80010d0 <USART2_IRQHandler+0x94>)
 80010a4:	54d1      	strb	r1, [r2, r3]
 80010a6:	4b09      	ldr	r3, [pc, #36]	; (80010cc <USART2_IRQHandler+0x90>)
 80010a8:	681b      	ldr	r3, [r3, #0]
 80010aa:	3301      	adds	r3, #1
 80010ac:	f3c3 0309 	ubfx	r3, r3, #0, #10
 80010b0:	4a06      	ldr	r2, [pc, #24]	; (80010cc <USART2_IRQHandler+0x90>)
 80010b2:	6013      	str	r3, [r2, #0]
 80010b4:	bf00      	nop
 80010b6:	46bd      	mov	sp, r7
 80010b8:	bc80      	pop	{r7}
 80010ba:	4770      	bx	lr
 80010bc:	40004400 	.word	0x40004400
 80010c0:	200008b8 	.word	0x200008b8
 80010c4:	200008bc 	.word	0x200008bc
 80010c8:	200004b8 	.word	0x200004b8
 80010cc:	20000cc0 	.word	0x20000cc0
 80010d0:	200008c0 	.word	0x200008c0
 80010d4:	00000000 	.word	0x00000000

080010d8 <NVIC_EnableIRQ>:
 80010d8:	b480      	push	{r7}
 80010da:	b083      	sub	sp, #12
 80010dc:	af00      	add	r7, sp, #0
 80010de:	4603      	mov	r3, r0
 80010e0:	71fb      	strb	r3, [r7, #7]
 80010e2:	4908      	ldr	r1, [pc, #32]	; (8001104 <NVIC_EnableIRQ+0x2c>)
 80010e4:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80010e8:	095b      	lsrs	r3, r3, #5
 80010ea:	79fa      	ldrb	r2, [r7, #7]
 80010ec:	f002 021f 	and.w	r2, r2, #31
 80010f0:	2001      	movs	r0, #1
 80010f2:	fa00 f202 	lsl.w	r2, r0, r2
 80010f6:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 80010fa:	bf00      	nop
 80010fc:	370c      	adds	r7, #12
 80010fe:	46bd      	mov	sp, r7
 8001100:	bc80      	pop	{r7}
 8001102:	4770      	bx	lr
 8001104:	e000e100 	.word	0xe000e100

08001108 <NVIC_DisableIRQ>:
 8001108:	b480      	push	{r7}
 800110a:	b083      	sub	sp, #12
 800110c:	af00      	add	r7, sp, #0
 800110e:	4603      	mov	r3, r0
 8001110:	71fb      	strb	r3, [r7, #7]
 8001112:	4909      	ldr	r1, [pc, #36]	; (8001138 <NVIC_DisableIRQ+0x30>)
 8001114:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8001118:	095b      	lsrs	r3, r3, #5
 800111a:	79fa      	ldrb	r2, [r7, #7]
 800111c:	f002 021f 	and.w	r2, r2, #31
 8001120:	2001      	movs	r0, #1
 8001122:	fa00 f202 	lsl.w	r2, r0, r2
 8001126:	3320      	adds	r3, #32
 8001128:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 800112c:	bf00      	nop
 800112e:	370c      	adds	r7, #12
 8001130:	46bd      	mov	sp, r7
 8001132:	bc80      	pop	{r7}
 8001134:	4770      	bx	lr
 8001136:	bf00      	nop
 8001138:	e000e100 	.word	0xe000e100

0800113c <deln>:
 800113c:	b480      	push	{r7}
 800113e:	b083      	sub	sp, #12
 8001140:	af00      	add	r7, sp, #0
 8001142:	6078      	str	r0, [r7, #4]
 8001144:	e000      	b.n	8001148 <deln+0xc>
 8001146:	bf00      	nop
 8001148:	687b      	ldr	r3, [r7, #4]
 800114a:	1e5a      	subs	r2, r3, #1
 800114c:	607a      	str	r2, [r7, #4]
 800114e:	2b00      	cmp	r3, #0
 8001150:	d1f9      	bne.n	8001146 <deln+0xa>
 8001152:	bf00      	nop
 8001154:	370c      	adds	r7, #12
 8001156:	46bd      	mov	sp, r7
 8001158:	bc80      	pop	{r7}
 800115a:	4770      	bx	lr

0800115c <init_adc_flt>:
 800115c:	b480      	push	{r7}
 800115e:	b083      	sub	sp, #12
 8001160:	af00      	add	r7, sp, #0
 8001162:	2300      	movs	r3, #0
 8001164:	607b      	str	r3, [r7, #4]
 8001166:	e007      	b.n	8001178 <init_adc_flt+0x1c>
 8001168:	4a07      	ldr	r2, [pc, #28]	; (8001188 <init_adc_flt+0x2c>)
 800116a:	687b      	ldr	r3, [r7, #4]
 800116c:	2100      	movs	r1, #0
 800116e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001172:	687b      	ldr	r3, [r7, #4]
 8001174:	3301      	adds	r3, #1
 8001176:	607b      	str	r3, [r7, #4]
 8001178:	687b      	ldr	r3, [r7, #4]
 800117a:	2b1f      	cmp	r3, #31
 800117c:	ddf4      	ble.n	8001168 <init_adc_flt+0xc>
 800117e:	bf00      	nop
 8001180:	370c      	adds	r7, #12
 8001182:	46bd      	mov	sp, r7
 8001184:	bc80      	pop	{r7}
 8001186:	4770      	bx	lr
 8001188:	20000cdc 	.word	0x20000cdc

0800118c <system_init>:
 800118c:	b580      	push	{r7, lr}
 800118e:	af00      	add	r7, sp, #0
 8001190:	4a9f      	ldr	r2, [pc, #636]	; (8001410 <system_init+0x284>)
 8001192:	4b9f      	ldr	r3, [pc, #636]	; (8001410 <system_init+0x284>)
 8001194:	681b      	ldr	r3, [r3, #0]
 8001196:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 800119a:	6013      	str	r3, [r2, #0]
 800119c:	bf00      	nop
 800119e:	4b9c      	ldr	r3, [pc, #624]	; (8001410 <system_init+0x284>)
 80011a0:	681b      	ldr	r3, [r3, #0]
 80011a2:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 80011a6:	2b00      	cmp	r3, #0
 80011a8:	d0f9      	beq.n	800119e <system_init+0x12>
 80011aa:	4a99      	ldr	r2, [pc, #612]	; (8001410 <system_init+0x284>)
 80011ac:	4b98      	ldr	r3, [pc, #608]	; (8001410 <system_init+0x284>)
 80011ae:	685b      	ldr	r3, [r3, #4]
 80011b0:	f423 137c 	bic.w	r3, r3, #4128768	; 0x3f0000
 80011b4:	6053      	str	r3, [r2, #4]
 80011b6:	4a96      	ldr	r2, [pc, #600]	; (8001410 <system_init+0x284>)
 80011b8:	4b95      	ldr	r3, [pc, #596]	; (8001410 <system_init+0x284>)
 80011ba:	685b      	ldr	r3, [r3, #4]
 80011bc:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 80011c0:	6053      	str	r3, [r2, #4]
 80011c2:	4a93      	ldr	r2, [pc, #588]	; (8001410 <system_init+0x284>)
 80011c4:	4b92      	ldr	r3, [pc, #584]	; (8001410 <system_init+0x284>)
 80011c6:	685b      	ldr	r3, [r3, #4]
 80011c8:	f443 13e0 	orr.w	r3, r3, #1835008	; 0x1c0000
 80011cc:	6053      	str	r3, [r2, #4]
 80011ce:	4a90      	ldr	r2, [pc, #576]	; (8001410 <system_init+0x284>)
 80011d0:	4b8f      	ldr	r3, [pc, #572]	; (8001410 <system_init+0x284>)
 80011d2:	685b      	ldr	r3, [r3, #4]
 80011d4:	f423 0380 	bic.w	r3, r3, #4194304	; 0x400000
 80011d8:	6053      	str	r3, [r2, #4]
 80011da:	4a8d      	ldr	r2, [pc, #564]	; (8001410 <system_init+0x284>)
 80011dc:	4b8c      	ldr	r3, [pc, #560]	; (8001410 <system_init+0x284>)
 80011de:	681b      	ldr	r3, [r3, #0]
 80011e0:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
 80011e4:	6013      	str	r3, [r2, #0]
 80011e6:	bf00      	nop
 80011e8:	4b89      	ldr	r3, [pc, #548]	; (8001410 <system_init+0x284>)
 80011ea:	681b      	ldr	r3, [r3, #0]
 80011ec:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
 80011f0:	2b00      	cmp	r3, #0
 80011f2:	d0f9      	beq.n	80011e8 <system_init+0x5c>
 80011f4:	4a87      	ldr	r2, [pc, #540]	; (8001414 <system_init+0x288>)
 80011f6:	4b87      	ldr	r3, [pc, #540]	; (8001414 <system_init+0x288>)
 80011f8:	681b      	ldr	r3, [r3, #0]
 80011fa:	f043 0310 	orr.w	r3, r3, #16
 80011fe:	6013      	str	r3, [r2, #0]
 8001200:	4a84      	ldr	r2, [pc, #528]	; (8001414 <system_init+0x288>)
 8001202:	4b84      	ldr	r3, [pc, #528]	; (8001414 <system_init+0x288>)
 8001204:	681b      	ldr	r3, [r3, #0]
 8001206:	f023 0303 	bic.w	r3, r3, #3
 800120a:	6013      	str	r3, [r2, #0]
 800120c:	4a81      	ldr	r2, [pc, #516]	; (8001414 <system_init+0x288>)
 800120e:	4b81      	ldr	r3, [pc, #516]	; (8001414 <system_init+0x288>)
 8001210:	681b      	ldr	r3, [r3, #0]
 8001212:	f043 0302 	orr.w	r3, r3, #2
 8001216:	6013      	str	r3, [r2, #0]
 8001218:	4a7d      	ldr	r2, [pc, #500]	; (8001410 <system_init+0x284>)
 800121a:	4b7d      	ldr	r3, [pc, #500]	; (8001410 <system_init+0x284>)
 800121c:	685b      	ldr	r3, [r3, #4]
 800121e:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 8001222:	6053      	str	r3, [r2, #4]
 8001224:	4a7a      	ldr	r2, [pc, #488]	; (8001410 <system_init+0x284>)
 8001226:	4b7a      	ldr	r3, [pc, #488]	; (8001410 <system_init+0x284>)
 8001228:	685b      	ldr	r3, [r3, #4]
 800122a:	f023 0303 	bic.w	r3, r3, #3
 800122e:	6053      	str	r3, [r2, #4]
 8001230:	4a77      	ldr	r2, [pc, #476]	; (8001410 <system_init+0x284>)
 8001232:	4b77      	ldr	r3, [pc, #476]	; (8001410 <system_init+0x284>)
 8001234:	685b      	ldr	r3, [r3, #4]
 8001236:	f043 0302 	orr.w	r3, r3, #2
 800123a:	6053      	str	r3, [r2, #4]
 800123c:	bf00      	nop
 800123e:	4b74      	ldr	r3, [pc, #464]	; (8001410 <system_init+0x284>)
 8001240:	685b      	ldr	r3, [r3, #4]
 8001242:	f003 030c 	and.w	r3, r3, #12
 8001246:	2b08      	cmp	r3, #8
 8001248:	d1f9      	bne.n	800123e <system_init+0xb2>
 800124a:	4a71      	ldr	r2, [pc, #452]	; (8001410 <system_init+0x284>)
 800124c:	4b70      	ldr	r3, [pc, #448]	; (8001410 <system_init+0x284>)
 800124e:	699b      	ldr	r3, [r3, #24]
 8001250:	f043 0305 	orr.w	r3, r3, #5
 8001254:	6193      	str	r3, [r2, #24]
 8001256:	4a6e      	ldr	r2, [pc, #440]	; (8001410 <system_init+0x284>)
 8001258:	4b6d      	ldr	r3, [pc, #436]	; (8001410 <system_init+0x284>)
 800125a:	69db      	ldr	r3, [r3, #28]
 800125c:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
 8001260:	61d3      	str	r3, [r2, #28]
 8001262:	4a6b      	ldr	r2, [pc, #428]	; (8001410 <system_init+0x284>)
 8001264:	4b6a      	ldr	r3, [pc, #424]	; (8001410 <system_init+0x284>)
 8001266:	699b      	ldr	r3, [r3, #24]
 8001268:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
 800126c:	6193      	str	r3, [r2, #24]
 800126e:	4a68      	ldr	r2, [pc, #416]	; (8001410 <system_init+0x284>)
 8001270:	4b67      	ldr	r3, [pc, #412]	; (8001410 <system_init+0x284>)
 8001272:	69db      	ldr	r3, [r3, #28]
 8001274:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 8001278:	61d3      	str	r3, [r2, #28]
 800127a:	4a65      	ldr	r2, [pc, #404]	; (8001410 <system_init+0x284>)
 800127c:	4b64      	ldr	r3, [pc, #400]	; (8001410 <system_init+0x284>)
 800127e:	699b      	ldr	r3, [r3, #24]
 8001280:	f043 0318 	orr.w	r3, r3, #24
 8001284:	6193      	str	r3, [r2, #24]
 8001286:	4a64      	ldr	r2, [pc, #400]	; (8001418 <system_init+0x28c>)
 8001288:	4b63      	ldr	r3, [pc, #396]	; (8001418 <system_init+0x28c>)
 800128a:	681b      	ldr	r3, [r3, #0]
 800128c:	f423 0370 	bic.w	r3, r3, #15728640	; 0xf00000
 8001290:	6013      	str	r3, [r2, #0]
 8001292:	4a61      	ldr	r2, [pc, #388]	; (8001418 <system_init+0x28c>)
 8001294:	4b60      	ldr	r3, [pc, #384]	; (8001418 <system_init+0x28c>)
 8001296:	681b      	ldr	r3, [r3, #0]
 8001298:	f443 1340 	orr.w	r3, r3, #3145728	; 0x300000
 800129c:	6013      	str	r3, [r2, #0]
 800129e:	4a5e      	ldr	r2, [pc, #376]	; (8001418 <system_init+0x28c>)
 80012a0:	4b5d      	ldr	r3, [pc, #372]	; (8001418 <system_init+0x28c>)
 80012a2:	681b      	ldr	r3, [r3, #0]
 80012a4:	f023 6370 	bic.w	r3, r3, #251658240	; 0xf000000
 80012a8:	6013      	str	r3, [r2, #0]
 80012aa:	4a5b      	ldr	r2, [pc, #364]	; (8001418 <system_init+0x28c>)
 80012ac:	4b5a      	ldr	r3, [pc, #360]	; (8001418 <system_init+0x28c>)
 80012ae:	681b      	ldr	r3, [r3, #0]
 80012b0:	f043 7340 	orr.w	r3, r3, #50331648	; 0x3000000
 80012b4:	6013      	str	r3, [r2, #0]
 80012b6:	4a58      	ldr	r2, [pc, #352]	; (8001418 <system_init+0x28c>)
 80012b8:	4b57      	ldr	r3, [pc, #348]	; (8001418 <system_init+0x28c>)
 80012ba:	681b      	ldr	r3, [r3, #0]
 80012bc:	f043 6380 	orr.w	r3, r3, #67108864	; 0x4000000
 80012c0:	6013      	str	r3, [r2, #0]
 80012c2:	4b56      	ldr	r3, [pc, #344]	; (800141c <system_init+0x290>)
 80012c4:	f242 3227 	movw	r2, #8999	; 0x2327
 80012c8:	605a      	str	r2, [r3, #4]
 80012ca:	4b54      	ldr	r3, [pc, #336]	; (800141c <system_init+0x290>)
 80012cc:	2200      	movs	r2, #0
 80012ce:	609a      	str	r2, [r3, #8]
 80012d0:	4b52      	ldr	r3, [pc, #328]	; (800141c <system_init+0x290>)
 80012d2:	2203      	movs	r2, #3
 80012d4:	601a      	str	r2, [r3, #0]
 80012d6:	4a52      	ldr	r2, [pc, #328]	; (8001420 <system_init+0x294>)
 80012d8:	4b51      	ldr	r3, [pc, #324]	; (8001420 <system_init+0x294>)
 80012da:	681b      	ldr	r3, [r3, #0]
 80012dc:	f043 0310 	orr.w	r3, r3, #16
 80012e0:	6013      	str	r3, [r2, #0]
 80012e2:	4a4f      	ldr	r2, [pc, #316]	; (8001420 <system_init+0x294>)
 80012e4:	4b4e      	ldr	r3, [pc, #312]	; (8001420 <system_init+0x294>)
 80012e6:	689b      	ldr	r3, [r3, #8]
 80012e8:	f043 0310 	orr.w	r3, r3, #16
 80012ec:	6093      	str	r3, [r2, #8]
 80012ee:	4a4c      	ldr	r2, [pc, #304]	; (8001420 <system_init+0x294>)
 80012f0:	4b4b      	ldr	r3, [pc, #300]	; (8001420 <system_init+0x294>)
 80012f2:	68db      	ldr	r3, [r3, #12]
 80012f4:	f043 0310 	orr.w	r3, r3, #16
 80012f8:	60d3      	str	r3, [r2, #12]
 80012fa:	4a4a      	ldr	r2, [pc, #296]	; (8001424 <system_init+0x298>)
 80012fc:	4b49      	ldr	r3, [pc, #292]	; (8001424 <system_init+0x298>)
 80012fe:	68db      	ldr	r3, [r3, #12]
 8001300:	f023 0301 	bic.w	r3, r3, #1
 8001304:	60d3      	str	r3, [r2, #12]
 8001306:	4a47      	ldr	r2, [pc, #284]	; (8001424 <system_init+0x298>)
 8001308:	4b46      	ldr	r3, [pc, #280]	; (8001424 <system_init+0x298>)
 800130a:	68db      	ldr	r3, [r3, #12]
 800130c:	f043 0301 	orr.w	r3, r3, #1
 8001310:	60d3      	str	r3, [r2, #12]
 8001312:	200a      	movs	r0, #10
 8001314:	f7ff fee0 	bl	80010d8 <NVIC_EnableIRQ>
 8001318:	4a3d      	ldr	r2, [pc, #244]	; (8001410 <system_init+0x284>)
 800131a:	4b3d      	ldr	r3, [pc, #244]	; (8001410 <system_init+0x284>)
 800131c:	699b      	ldr	r3, [r3, #24]
 800131e:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 8001322:	6193      	str	r3, [r2, #24]
 8001324:	4a3a      	ldr	r2, [pc, #232]	; (8001410 <system_init+0x284>)
 8001326:	4b3a      	ldr	r3, [pc, #232]	; (8001410 <system_init+0x284>)
 8001328:	685b      	ldr	r3, [r3, #4]
 800132a:	f443 4340 	orr.w	r3, r3, #49152	; 0xc000
 800132e:	6053      	str	r3, [r2, #4]
 8001330:	4a3d      	ldr	r2, [pc, #244]	; (8001428 <system_init+0x29c>)
 8001332:	4b3d      	ldr	r3, [pc, #244]	; (8001428 <system_init+0x29c>)
 8001334:	681b      	ldr	r3, [r3, #0]
 8001336:	f023 030f 	bic.w	r3, r3, #15
 800133a:	6013      	str	r3, [r2, #0]
 800133c:	4a3b      	ldr	r2, [pc, #236]	; (800142c <system_init+0x2a0>)
 800133e:	4b3b      	ldr	r3, [pc, #236]	; (800142c <system_init+0x2a0>)
 8001340:	689b      	ldr	r3, [r3, #8]
 8001342:	f043 0301 	orr.w	r3, r3, #1
 8001346:	6093      	str	r3, [r2, #8]
 8001348:	2014      	movs	r0, #20
 800134a:	f7ff fef7 	bl	800113c <deln>
 800134e:	4a37      	ldr	r2, [pc, #220]	; (800142c <system_init+0x2a0>)
 8001350:	4b36      	ldr	r3, [pc, #216]	; (800142c <system_init+0x2a0>)
 8001352:	691b      	ldr	r3, [r3, #16]
 8001354:	f043 0307 	orr.w	r3, r3, #7
 8001358:	6113      	str	r3, [r2, #16]
 800135a:	4a34      	ldr	r2, [pc, #208]	; (800142c <system_init+0x2a0>)
 800135c:	4b33      	ldr	r3, [pc, #204]	; (800142c <system_init+0x2a0>)
 800135e:	689b      	ldr	r3, [r3, #8]
 8001360:	f423 2360 	bic.w	r3, r3, #917504	; 0xe0000
 8001364:	6093      	str	r3, [r2, #8]
 8001366:	4a31      	ldr	r2, [pc, #196]	; (800142c <system_init+0x2a0>)
 8001368:	4b30      	ldr	r3, [pc, #192]	; (800142c <system_init+0x2a0>)
 800136a:	689b      	ldr	r3, [r3, #8]
 800136c:	f443 13b0 	orr.w	r3, r3, #1441792	; 0x160000
 8001370:	6093      	str	r3, [r2, #8]
 8001372:	4b2e      	ldr	r3, [pc, #184]	; (800142c <system_init+0x2a0>)
 8001374:	f44f 62fa 	mov.w	r2, #2000	; 0x7d0
 8001378:	625a      	str	r2, [r3, #36]	; 0x24
 800137a:	4b2c      	ldr	r3, [pc, #176]	; (800142c <system_init+0x2a0>)
 800137c:	f240 726c 	movw	r2, #1900	; 0x76c
 8001380:	629a      	str	r2, [r3, #40]	; 0x28
 8001382:	4a2a      	ldr	r2, [pc, #168]	; (800142c <system_init+0x2a0>)
 8001384:	4b29      	ldr	r3, [pc, #164]	; (800142c <system_init+0x2a0>)
 8001386:	685b      	ldr	r3, [r3, #4]
 8001388:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
 800138c:	f043 0360 	orr.w	r3, r3, #96	; 0x60
 8001390:	6053      	str	r3, [r2, #4]
 8001392:	2012      	movs	r0, #18
 8001394:	f7ff fea0 	bl	80010d8 <NVIC_EnableIRQ>
 8001398:	4a24      	ldr	r2, [pc, #144]	; (800142c <system_init+0x2a0>)
 800139a:	4b24      	ldr	r3, [pc, #144]	; (800142c <system_init+0x2a0>)
 800139c:	689b      	ldr	r3, [r3, #8]
 800139e:	f043 0308 	orr.w	r3, r3, #8
 80013a2:	6093      	str	r3, [r2, #8]
 80013a4:	bf00      	nop
 80013a6:	4b21      	ldr	r3, [pc, #132]	; (800142c <system_init+0x2a0>)
 80013a8:	689b      	ldr	r3, [r3, #8]
 80013aa:	f003 0308 	and.w	r3, r3, #8
 80013ae:	2b00      	cmp	r3, #0
 80013b0:	d1f9      	bne.n	80013a6 <system_init+0x21a>
 80013b2:	4a1e      	ldr	r2, [pc, #120]	; (800142c <system_init+0x2a0>)
 80013b4:	4b1d      	ldr	r3, [pc, #116]	; (800142c <system_init+0x2a0>)
 80013b6:	689b      	ldr	r3, [r3, #8]
 80013b8:	f043 0304 	orr.w	r3, r3, #4
 80013bc:	6093      	str	r3, [r2, #8]
 80013be:	bf00      	nop
 80013c0:	4b1a      	ldr	r3, [pc, #104]	; (800142c <system_init+0x2a0>)
 80013c2:	689b      	ldr	r3, [r3, #8]
 80013c4:	f003 0304 	and.w	r3, r3, #4
 80013c8:	2b00      	cmp	r3, #0
 80013ca:	d1f9      	bne.n	80013c0 <system_init+0x234>
 80013cc:	4b17      	ldr	r3, [pc, #92]	; (800142c <system_init+0x2a0>)
 80013ce:	2200      	movs	r2, #0
 80013d0:	601a      	str	r2, [r3, #0]
 80013d2:	4b16      	ldr	r3, [pc, #88]	; (800142c <system_init+0x2a0>)
 80013d4:	f44f 62fa 	mov.w	r2, #2000	; 0x7d0
 80013d8:	625a      	str	r2, [r3, #36]	; 0x24
 80013da:	4b14      	ldr	r3, [pc, #80]	; (800142c <system_init+0x2a0>)
 80013dc:	f240 726c 	movw	r2, #1900	; 0x76c
 80013e0:	629a      	str	r2, [r3, #40]	; 0x28
 80013e2:	4a12      	ldr	r2, [pc, #72]	; (800142c <system_init+0x2a0>)
 80013e4:	4b11      	ldr	r3, [pc, #68]	; (800142c <system_init+0x2a0>)
 80013e6:	685b      	ldr	r3, [r3, #4]
 80013e8:	f443 0300 	orr.w	r3, r3, #8388608	; 0x800000
 80013ec:	f043 0360 	orr.w	r3, r3, #96	; 0x60
 80013f0:	6053      	str	r3, [r2, #4]
 80013f2:	2012      	movs	r0, #18
 80013f4:	f7ff fe70 	bl	80010d8 <NVIC_EnableIRQ>
 80013f8:	4a05      	ldr	r2, [pc, #20]	; (8001410 <system_init+0x284>)
 80013fa:	4b05      	ldr	r3, [pc, #20]	; (8001410 <system_init+0x284>)
 80013fc:	69db      	ldr	r3, [r3, #28]
 80013fe:	f043 0301 	orr.w	r3, r3, #1
 8001402:	61d3      	str	r3, [r2, #28]
 8001404:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8001408:	f640 620f 	movw	r2, #3599	; 0xe0f
 800140c:	851a      	strh	r2, [r3, #40]	; 0x28
 800140e:	e00f      	b.n	8001430 <system_init+0x2a4>
 8001410:	40021000 	.word	0x40021000
 8001414:	40022000 	.word	0x40022000
 8001418:	40010c00 	.word	0x40010c00
 800141c:	e000e010 	.word	0xe000e010
 8001420:	40010400 	.word	0x40010400
 8001424:	40010000 	.word	0x40010000
 8001428:	40010800 	.word	0x40010800
 800142c:	40012400 	.word	0x40012400
 8001430:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8001434:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 8001438:	859a      	strh	r2, [r3, #44]	; 0x2c
 800143a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 800143e:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8001442:	871a      	strh	r2, [r3, #56]	; 0x38
 8001444:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8001448:	2200      	movs	r2, #0
 800144a:	831a      	strh	r2, [r3, #24]
 800144c:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
 8001450:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8001454:	8b1b      	ldrh	r3, [r3, #24]
 8001456:	b29b      	uxth	r3, r3
 8001458:	f443 43d0 	orr.w	r3, r3, #26624	; 0x6800
 800145c:	b29b      	uxth	r3, r3
 800145e:	8313      	strh	r3, [r2, #24]
 8001460:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
 8001464:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8001468:	8c1b      	ldrh	r3, [r3, #32]
 800146a:	b29b      	uxth	r3, r3
 800146c:	f043 0310 	orr.w	r3, r3, #16
 8001470:	b29b      	uxth	r3, r3
 8001472:	8413      	strh	r3, [r2, #32]
 8001474:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
 8001478:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 800147c:	881b      	ldrh	r3, [r3, #0]
 800147e:	b29b      	uxth	r3, r3
 8001480:	f043 0301 	orr.w	r3, r3, #1
 8001484:	b29b      	uxth	r3, r3
 8001486:	8013      	strh	r3, [r2, #0]
 8001488:	f7ff fe68 	bl	800115c <init_adc_flt>
 800148c:	4b09      	ldr	r3, [pc, #36]	; (80014b4 <system_init+0x328>)
 800148e:	f245 5255 	movw	r2, #21845	; 0x5555
 8001492:	601a      	str	r2, [r3, #0]
 8001494:	4b07      	ldr	r3, [pc, #28]	; (80014b4 <system_init+0x328>)
 8001496:	2204      	movs	r2, #4
 8001498:	605a      	str	r2, [r3, #4]
 800149a:	4b06      	ldr	r3, [pc, #24]	; (80014b4 <system_init+0x328>)
 800149c:	f64c 42cc 	movw	r2, #52428	; 0xcccc
 80014a0:	601a      	str	r2, [r3, #0]
 80014a2:	4a05      	ldr	r2, [pc, #20]	; (80014b8 <system_init+0x32c>)
 80014a4:	4b04      	ldr	r3, [pc, #16]	; (80014b8 <system_init+0x32c>)
 80014a6:	69db      	ldr	r3, [r3, #28]
 80014a8:	f043 53c0 	orr.w	r3, r3, #402653184	; 0x18000000
 80014ac:	61d3      	str	r3, [r2, #28]
 80014ae:	bf00      	nop
 80014b0:	bd80      	pop	{r7, pc}
 80014b2:	bf00      	nop
 80014b4:	40003000 	.word	0x40003000
 80014b8:	40021000 	.word	0x40021000

080014bc <code2temp>:
 80014bc:	b590      	push	{r4, r7, lr}
 80014be:	b085      	sub	sp, #20
 80014c0:	af00      	add	r7, sp, #0
 80014c2:	4603      	mov	r3, r0
 80014c4:	80fb      	strh	r3, [r7, #6]
 80014c6:	88fb      	ldrh	r3, [r7, #6]
 80014c8:	4618      	mov	r0, r3
 80014ca:	f001 fdbb 	bl	8003044 <__aeabi_i2d>
 80014ce:	a316      	add	r3, pc, #88	; (adr r3, 8001528 <code2temp+0x6c>)
 80014d0:	e9d3 2300 	ldrd	r2, r3, [r3]
 80014d4:	f001 fe1c 	bl	8003110 <__aeabi_dmul>
 80014d8:	4603      	mov	r3, r0
 80014da:	460c      	mov	r4, r1
 80014dc:	4618      	mov	r0, r3
 80014de:	4621      	mov	r1, r4
 80014e0:	f04f 0200 	mov.w	r2, #0
 80014e4:	4b12      	ldr	r3, [pc, #72]	; (8001530 <code2temp+0x74>)
 80014e6:	f001 fc5f 	bl	8002da8 <__aeabi_dsub>
 80014ea:	4603      	mov	r3, r0
 80014ec:	460c      	mov	r4, r1
 80014ee:	4618      	mov	r0, r3
 80014f0:	4621      	mov	r1, r4
 80014f2:	f002 f867 	bl	80035c4 <__aeabi_d2f>
 80014f6:	4603      	mov	r3, r0
 80014f8:	60fb      	str	r3, [r7, #12]
 80014fa:	68f8      	ldr	r0, [r7, #12]
 80014fc:	f001 fdb4 	bl	8003068 <__aeabi_f2d>
 8001500:	4603      	mov	r3, r0
 8001502:	460c      	mov	r4, r1
 8001504:	4618      	mov	r0, r3
 8001506:	4621      	mov	r1, r4
 8001508:	f002 f8ac 	bl	8003664 <round>
 800150c:	4603      	mov	r3, r0
 800150e:	460c      	mov	r4, r1
 8001510:	4618      	mov	r0, r3
 8001512:	4621      	mov	r1, r4
 8001514:	f002 f80e 	bl	8003534 <__aeabi_d2iz>
 8001518:	4603      	mov	r3, r0
 800151a:	4618      	mov	r0, r3
 800151c:	3714      	adds	r7, #20
 800151e:	46bd      	mov	sp, r7
 8001520:	bd90      	pop	{r4, r7, pc}
 8001522:	bf00      	nop
 8001524:	f3af 8000 	nop.w
 8001528:	9c0ebee0 	.word	0x9c0ebee0
 800152c:	3fb4a233 	.word	0x3fb4a233
 8001530:	40490000 	.word	0x40490000

08001534 <temp2code>:
 8001534:	b590      	push	{r4, r7, lr}
 8001536:	b083      	sub	sp, #12
 8001538:	af00      	add	r7, sp, #0
 800153a:	6078      	str	r0, [r7, #4]
 800153c:	6878      	ldr	r0, [r7, #4]
 800153e:	f001 fd81 	bl	8003044 <__aeabi_i2d>
 8001542:	a319      	add	r3, pc, #100	; (adr r3, 80015a8 <temp2code+0x74>)
 8001544:	e9d3 2300 	ldrd	r2, r3, [r3]
 8001548:	f001 fde2 	bl	8003110 <__aeabi_dmul>
 800154c:	4603      	mov	r3, r0
 800154e:	460c      	mov	r4, r1
 8001550:	4618      	mov	r0, r3
 8001552:	4621      	mov	r1, r4
 8001554:	f04f 0200 	mov.w	r2, #0
 8001558:	4b19      	ldr	r3, [pc, #100]	; (80015c0 <temp2code+0x8c>)
 800155a:	f001 fc27 	bl	8002dac <__adddf3>
 800155e:	4603      	mov	r3, r0
 8001560:	460c      	mov	r4, r1
 8001562:	4618      	mov	r0, r3
 8001564:	4621      	mov	r1, r4
 8001566:	a312      	add	r3, pc, #72	; (adr r3, 80015b0 <temp2code+0x7c>)
 8001568:	e9d3 2300 	ldrd	r2, r3, [r3]
 800156c:	f001 fdd0 	bl	8003110 <__aeabi_dmul>
 8001570:	4603      	mov	r3, r0
 8001572:	460c      	mov	r4, r1
 8001574:	4618      	mov	r0, r3
 8001576:	4621      	mov	r1, r4
 8001578:	a30f      	add	r3, pc, #60	; (adr r3, 80015b8 <temp2code+0x84>)
 800157a:	e9d3 2300 	ldrd	r2, r3, [r3]
 800157e:	f001 fef1 	bl	8003364 <__aeabi_ddiv>
 8001582:	4603      	mov	r3, r0
 8001584:	460c      	mov	r4, r1
 8001586:	4618      	mov	r0, r3
 8001588:	4621      	mov	r1, r4
 800158a:	f002 f86b 	bl	8003664 <round>
 800158e:	4603      	mov	r3, r0
 8001590:	460c      	mov	r4, r1
 8001592:	4618      	mov	r0, r3
 8001594:	4621      	mov	r1, r4
 8001596:	f001 fff5 	bl	8003584 <__aeabi_d2uiz>
 800159a:	4603      	mov	r3, r0
 800159c:	b29b      	uxth	r3, r3
 800159e:	4618      	mov	r0, r3
 80015a0:	370c      	adds	r7, #12
 80015a2:	46bd      	mov	sp, r7
 80015a4:	bd90      	pop	{r4, r7, pc}
 80015a6:	bf00      	nop
 80015a8:	47ae147b 	.word	0x47ae147b
 80015ac:	3f847ae1 	.word	0x3f847ae1
 80015b0:	00000000 	.word	0x00000000
 80015b4:	40affe00 	.word	0x40affe00
 80015b8:	66666666 	.word	0x66666666
 80015bc:	400a6666 	.word	0x400a6666
 80015c0:	3fe00000 	.word	0x3fe00000

080015c4 <comp_get_threshold>:
 80015c4:	b480      	push	{r7}
 80015c6:	af00      	add	r7, sp, #0
 80015c8:	4b03      	ldr	r3, [pc, #12]	; (80015d8 <comp_get_threshold+0x14>)
 80015ca:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80015cc:	b29b      	uxth	r3, r3
 80015ce:	4618      	mov	r0, r3
 80015d0:	46bd      	mov	sp, r7
 80015d2:	bc80      	pop	{r7}
 80015d4:	4770      	bx	lr
 80015d6:	bf00      	nop
 80015d8:	40012400 	.word	0x40012400

080015dc <comp_set_alarm_range>:
 80015dc:	b480      	push	{r7}
 80015de:	b083      	sub	sp, #12
 80015e0:	af00      	add	r7, sp, #0
 80015e2:	4603      	mov	r3, r0
 80015e4:	460a      	mov	r2, r1
 80015e6:	80fb      	strh	r3, [r7, #6]
 80015e8:	4613      	mov	r3, r2
 80015ea:	80bb      	strh	r3, [r7, #4]
 80015ec:	88bb      	ldrh	r3, [r7, #4]
 80015ee:	f3c3 030b 	ubfx	r3, r3, #0, #12
 80015f2:	80bb      	strh	r3, [r7, #4]
 80015f4:	88fb      	ldrh	r3, [r7, #6]
 80015f6:	f3c3 030b 	ubfx	r3, r3, #0, #12
 80015fa:	80fb      	strh	r3, [r7, #6]
 80015fc:	4a05      	ldr	r2, [pc, #20]	; (8001614 <comp_set_alarm_range+0x38>)
 80015fe:	88bb      	ldrh	r3, [r7, #4]
 8001600:	8013      	strh	r3, [r2, #0]
 8001602:	4a05      	ldr	r2, [pc, #20]	; (8001618 <comp_set_alarm_range+0x3c>)
 8001604:	88fb      	ldrh	r3, [r7, #6]
 8001606:	8013      	strh	r3, [r2, #0]
 8001608:	bf00      	nop
 800160a:	370c      	adds	r7, #12
 800160c:	46bd      	mov	sp, r7
 800160e:	bc80      	pop	{r7}
 8001610:	4770      	bx	lr
 8001612:	bf00      	nop
 8001614:	20000002 	.word	0x20000002
 8001618:	20000004 	.word	0x20000004

0800161c <comp_set_threshold>:
 800161c:	b580      	push	{r7, lr}
 800161e:	b084      	sub	sp, #16
 8001620:	af00      	add	r7, sp, #0
 8001622:	4603      	mov	r3, r0
 8001624:	80fb      	strh	r3, [r7, #6]
 8001626:	88fb      	ldrh	r3, [r7, #6]
 8001628:	3b64      	subs	r3, #100	; 0x64
 800162a:	81fb      	strh	r3, [r7, #14]
 800162c:	2012      	movs	r0, #18
 800162e:	f7ff fd6b 	bl	8001108 <NVIC_DisableIRQ>
 8001632:	88fb      	ldrh	r3, [r7, #6]
 8001634:	f3c3 030b 	ubfx	r3, r3, #0, #12
 8001638:	80fb      	strh	r3, [r7, #6]
 800163a:	89fb      	ldrh	r3, [r7, #14]
 800163c:	f3c3 030b 	ubfx	r3, r3, #0, #12
 8001640:	81fb      	strh	r3, [r7, #14]
 8001642:	4a06      	ldr	r2, [pc, #24]	; (800165c <comp_set_threshold+0x40>)
 8001644:	88fb      	ldrh	r3, [r7, #6]
 8001646:	6253      	str	r3, [r2, #36]	; 0x24
 8001648:	4a04      	ldr	r2, [pc, #16]	; (800165c <comp_set_threshold+0x40>)
 800164a:	89fb      	ldrh	r3, [r7, #14]
 800164c:	6293      	str	r3, [r2, #40]	; 0x28
 800164e:	2012      	movs	r0, #18
 8001650:	f7ff fd42 	bl	80010d8 <NVIC_EnableIRQ>
 8001654:	bf00      	nop
 8001656:	3710      	adds	r7, #16
 8001658:	46bd      	mov	sp, r7
 800165a:	bd80      	pop	{r7, pc}
 800165c:	40012400 	.word	0x40012400

08001660 <system_PB5_on>:
 8001660:	b480      	push	{r7}
 8001662:	af00      	add	r7, sp, #0
 8001664:	4a04      	ldr	r2, [pc, #16]	; (8001678 <system_PB5_on+0x18>)
 8001666:	4b04      	ldr	r3, [pc, #16]	; (8001678 <system_PB5_on+0x18>)
 8001668:	68db      	ldr	r3, [r3, #12]
 800166a:	f043 0320 	orr.w	r3, r3, #32
 800166e:	60d3      	str	r3, [r2, #12]
 8001670:	bf00      	nop
 8001672:	46bd      	mov	sp, r7
 8001674:	bc80      	pop	{r7}
 8001676:	4770      	bx	lr
 8001678:	40010c00 	.word	0x40010c00

0800167c <system_PB5_off>:
 800167c:	b480      	push	{r7}
 800167e:	af00      	add	r7, sp, #0
 8001680:	4a04      	ldr	r2, [pc, #16]	; (8001694 <system_PB5_off+0x18>)
 8001682:	4b04      	ldr	r3, [pc, #16]	; (8001694 <system_PB5_off+0x18>)
 8001684:	68db      	ldr	r3, [r3, #12]
 8001686:	f023 0320 	bic.w	r3, r3, #32
 800168a:	60d3      	str	r3, [r2, #12]
 800168c:	bf00      	nop
 800168e:	46bd      	mov	sp, r7
 8001690:	bc80      	pop	{r7}
 8001692:	4770      	bx	lr
 8001694:	40010c00 	.word	0x40010c00

08001698 <system_PB6_on>:
 8001698:	b480      	push	{r7}
 800169a:	af00      	add	r7, sp, #0
 800169c:	4a04      	ldr	r2, [pc, #16]	; (80016b0 <system_PB6_on+0x18>)
 800169e:	4b04      	ldr	r3, [pc, #16]	; (80016b0 <system_PB6_on+0x18>)
 80016a0:	68db      	ldr	r3, [r3, #12]
 80016a2:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 80016a6:	60d3      	str	r3, [r2, #12]
 80016a8:	bf00      	nop
 80016aa:	46bd      	mov	sp, r7
 80016ac:	bc80      	pop	{r7}
 80016ae:	4770      	bx	lr
 80016b0:	40010c00 	.word	0x40010c00

080016b4 <system_PB6_off>:
 80016b4:	b480      	push	{r7}
 80016b6:	af00      	add	r7, sp, #0
 80016b8:	4a04      	ldr	r2, [pc, #16]	; (80016cc <system_PB6_off+0x18>)
 80016ba:	4b04      	ldr	r3, [pc, #16]	; (80016cc <system_PB6_off+0x18>)
 80016bc:	68db      	ldr	r3, [r3, #12]
 80016be:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 80016c2:	60d3      	str	r3, [r2, #12]
 80016c4:	bf00      	nop
 80016c6:	46bd      	mov	sp, r7
 80016c8:	bc80      	pop	{r7}
 80016ca:	4770      	bx	lr
 80016cc:	40010c00 	.word	0x40010c00

080016d0 <system_restore_params>:
 80016d0:	b590      	push	{r4, r7, lr}
 80016d2:	b083      	sub	sp, #12
 80016d4:	af00      	add	r7, sp, #0
 80016d6:	2300      	movs	r3, #0
 80016d8:	607b      	str	r3, [r7, #4]
 80016da:	4a29      	ldr	r2, [pc, #164]	; (8001780 <system_restore_params+0xb0>)
 80016dc:	4b28      	ldr	r3, [pc, #160]	; (8001780 <system_restore_params+0xb0>)
 80016de:	681b      	ldr	r3, [r3, #0]
 80016e0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 80016e4:	6013      	str	r3, [r2, #0]
 80016e6:	4b27      	ldr	r3, [pc, #156]	; (8001784 <system_restore_params+0xb4>)
 80016e8:	889b      	ldrh	r3, [r3, #4]
 80016ea:	b29b      	uxth	r3, r3
 80016ec:	f244 5267 	movw	r2, #17767	; 0x4567
 80016f0:	4293      	cmp	r3, r2
 80016f2:	d112      	bne.n	800171a <system_restore_params+0x4a>
 80016f4:	4b23      	ldr	r3, [pc, #140]	; (8001784 <system_restore_params+0xb4>)
 80016f6:	891b      	ldrh	r3, [r3, #8]
 80016f8:	b29b      	uxth	r3, r3
 80016fa:	4618      	mov	r0, r3
 80016fc:	f7ff ff8e 	bl	800161c <comp_set_threshold>
 8001700:	4b20      	ldr	r3, [pc, #128]	; (8001784 <system_restore_params+0xb4>)
 8001702:	899b      	ldrh	r3, [r3, #12]
 8001704:	b29a      	uxth	r2, r3
 8001706:	4b1f      	ldr	r3, [pc, #124]	; (8001784 <system_restore_params+0xb4>)
 8001708:	8a1b      	ldrh	r3, [r3, #16]
 800170a:	b29b      	uxth	r3, r3
 800170c:	4619      	mov	r1, r3
 800170e:	4610      	mov	r0, r2
 8001710:	f7ff ff64 	bl	80015dc <comp_set_alarm_range>
 8001714:	2301      	movs	r3, #1
 8001716:	607b      	str	r3, [r7, #4]
 8001718:	e026      	b.n	8001768 <system_restore_params+0x98>
 800171a:	2032      	movs	r0, #50	; 0x32
 800171c:	f7ff ff0a 	bl	8001534 <temp2code>
 8001720:	4603      	mov	r3, r0
 8001722:	4618      	mov	r0, r3
 8001724:	f7ff ff7a 	bl	800161c <comp_set_threshold>
 8001728:	200f      	movs	r0, #15
 800172a:	f7ff ff03 	bl	8001534 <temp2code>
 800172e:	4603      	mov	r3, r0
 8001730:	461c      	mov	r4, r3
 8001732:	2046      	movs	r0, #70	; 0x46
 8001734:	f7ff fefe 	bl	8001534 <temp2code>
 8001738:	4603      	mov	r3, r0
 800173a:	4619      	mov	r1, r3
 800173c:	4620      	mov	r0, r4
 800173e:	f7ff ff4d 	bl	80015dc <comp_set_alarm_range>
 8001742:	4b10      	ldr	r3, [pc, #64]	; (8001784 <system_restore_params+0xb4>)
 8001744:	4a10      	ldr	r2, [pc, #64]	; (8001788 <system_restore_params+0xb8>)
 8001746:	6a52      	ldr	r2, [r2, #36]	; 0x24
 8001748:	b292      	uxth	r2, r2
 800174a:	811a      	strh	r2, [r3, #8]
 800174c:	4b0d      	ldr	r3, [pc, #52]	; (8001784 <system_restore_params+0xb4>)
 800174e:	4a0f      	ldr	r2, [pc, #60]	; (800178c <system_restore_params+0xbc>)
 8001750:	8812      	ldrh	r2, [r2, #0]
 8001752:	819a      	strh	r2, [r3, #12]
 8001754:	4b0b      	ldr	r3, [pc, #44]	; (8001784 <system_restore_params+0xb4>)
 8001756:	4a0e      	ldr	r2, [pc, #56]	; (8001790 <system_restore_params+0xc0>)
 8001758:	8812      	ldrh	r2, [r2, #0]
 800175a:	821a      	strh	r2, [r3, #16]
 800175c:	4b09      	ldr	r3, [pc, #36]	; (8001784 <system_restore_params+0xb4>)
 800175e:	f244 5267 	movw	r2, #17767	; 0x4567
 8001762:	809a      	strh	r2, [r3, #4]
 8001764:	2300      	movs	r3, #0
 8001766:	607b      	str	r3, [r7, #4]
 8001768:	4a05      	ldr	r2, [pc, #20]	; (8001780 <system_restore_params+0xb0>)
 800176a:	4b05      	ldr	r3, [pc, #20]	; (8001780 <system_restore_params+0xb0>)
 800176c:	681b      	ldr	r3, [r3, #0]
 800176e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 8001772:	6013      	str	r3, [r2, #0]
 8001774:	687b      	ldr	r3, [r7, #4]
 8001776:	4618      	mov	r0, r3
 8001778:	370c      	adds	r7, #12
 800177a:	46bd      	mov	sp, r7
 800177c:	bd90      	pop	{r4, r7, pc}
 800177e:	bf00      	nop
 8001780:	40007000 	.word	0x40007000
 8001784:	40006c00 	.word	0x40006c00
 8001788:	40012400 	.word	0x40012400
 800178c:	20000004 	.word	0x20000004
 8001790:	20000002 	.word	0x20000002

08001794 <system_backup_params>:
 8001794:	b480      	push	{r7}
 8001796:	af00      	add	r7, sp, #0
 8001798:	4a10      	ldr	r2, [pc, #64]	; (80017dc <system_backup_params+0x48>)
 800179a:	4b10      	ldr	r3, [pc, #64]	; (80017dc <system_backup_params+0x48>)
 800179c:	681b      	ldr	r3, [r3, #0]
 800179e:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 80017a2:	6013      	str	r3, [r2, #0]
 80017a4:	4b0e      	ldr	r3, [pc, #56]	; (80017e0 <system_backup_params+0x4c>)
 80017a6:	4a0f      	ldr	r2, [pc, #60]	; (80017e4 <system_backup_params+0x50>)
 80017a8:	6a52      	ldr	r2, [r2, #36]	; 0x24
 80017aa:	b292      	uxth	r2, r2
 80017ac:	811a      	strh	r2, [r3, #8]
 80017ae:	4b0c      	ldr	r3, [pc, #48]	; (80017e0 <system_backup_params+0x4c>)
 80017b0:	4a0d      	ldr	r2, [pc, #52]	; (80017e8 <system_backup_params+0x54>)
 80017b2:	8812      	ldrh	r2, [r2, #0]
 80017b4:	819a      	strh	r2, [r3, #12]
 80017b6:	4b0a      	ldr	r3, [pc, #40]	; (80017e0 <system_backup_params+0x4c>)
 80017b8:	4a0c      	ldr	r2, [pc, #48]	; (80017ec <system_backup_params+0x58>)
 80017ba:	8812      	ldrh	r2, [r2, #0]
 80017bc:	821a      	strh	r2, [r3, #16]
 80017be:	4b08      	ldr	r3, [pc, #32]	; (80017e0 <system_backup_params+0x4c>)
 80017c0:	f244 5267 	movw	r2, #17767	; 0x4567
 80017c4:	809a      	strh	r2, [r3, #4]
 80017c6:	4a05      	ldr	r2, [pc, #20]	; (80017dc <system_backup_params+0x48>)
 80017c8:	4b04      	ldr	r3, [pc, #16]	; (80017dc <system_backup_params+0x48>)
 80017ca:	681b      	ldr	r3, [r3, #0]
 80017cc:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 80017d0:	6013      	str	r3, [r2, #0]
 80017d2:	bf00      	nop
 80017d4:	46bd      	mov	sp, r7
 80017d6:	bc80      	pop	{r7}
 80017d8:	4770      	bx	lr
 80017da:	bf00      	nop
 80017dc:	40007000 	.word	0x40007000
 80017e0:	40006c00 	.word	0x40006c00
 80017e4:	40012400 	.word	0x40012400
 80017e8:	20000004 	.word	0x20000004
 80017ec:	20000002 	.word	0x20000002

080017f0 <get_fault_flag>:
 80017f0:	b480      	push	{r7}
 80017f2:	b083      	sub	sp, #12
 80017f4:	af00      	add	r7, sp, #0
 80017f6:	4a0e      	ldr	r2, [pc, #56]	; (8001830 <get_fault_flag+0x40>)
 80017f8:	4b0d      	ldr	r3, [pc, #52]	; (8001830 <get_fault_flag+0x40>)
 80017fa:	681b      	ldr	r3, [r3, #0]
 80017fc:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 8001800:	6013      	str	r3, [r2, #0]
 8001802:	4b0c      	ldr	r3, [pc, #48]	; (8001834 <get_fault_flag+0x44>)
 8001804:	8a9b      	ldrh	r3, [r3, #20]
 8001806:	80fb      	strh	r3, [r7, #6]
 8001808:	4a09      	ldr	r2, [pc, #36]	; (8001830 <get_fault_flag+0x40>)
 800180a:	4b09      	ldr	r3, [pc, #36]	; (8001830 <get_fault_flag+0x40>)
 800180c:	681b      	ldr	r3, [r3, #0]
 800180e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 8001812:	6013      	str	r3, [r2, #0]
 8001814:	88fb      	ldrh	r3, [r7, #6]
 8001816:	f244 5267 	movw	r2, #17767	; 0x4567
 800181a:	4293      	cmp	r3, r2
 800181c:	d101      	bne.n	8001822 <get_fault_flag+0x32>
 800181e:	2301      	movs	r3, #1
 8001820:	e000      	b.n	8001824 <get_fault_flag+0x34>
 8001822:	2300      	movs	r3, #0
 8001824:	4618      	mov	r0, r3
 8001826:	370c      	adds	r7, #12
 8001828:	46bd      	mov	sp, r7
 800182a:	bc80      	pop	{r7}
 800182c:	4770      	bx	lr
 800182e:	bf00      	nop
 8001830:	40007000 	.word	0x40007000
 8001834:	40006c00 	.word	0x40006c00

08001838 <clr_fault_flag>:
 8001838:	b480      	push	{r7}
 800183a:	af00      	add	r7, sp, #0
 800183c:	4a09      	ldr	r2, [pc, #36]	; (8001864 <clr_fault_flag+0x2c>)
 800183e:	4b09      	ldr	r3, [pc, #36]	; (8001864 <clr_fault_flag+0x2c>)
 8001840:	681b      	ldr	r3, [r3, #0]
 8001842:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 8001846:	6013      	str	r3, [r2, #0]
 8001848:	4b07      	ldr	r3, [pc, #28]	; (8001868 <clr_fault_flag+0x30>)
 800184a:	2200      	movs	r2, #0
 800184c:	829a      	strh	r2, [r3, #20]
 800184e:	4a05      	ldr	r2, [pc, #20]	; (8001864 <clr_fault_flag+0x2c>)
 8001850:	4b04      	ldr	r3, [pc, #16]	; (8001864 <clr_fault_flag+0x2c>)
 8001852:	681b      	ldr	r3, [r3, #0]
 8001854:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 8001858:	6013      	str	r3, [r2, #0]
 800185a:	bf00      	nop
 800185c:	46bd      	mov	sp, r7
 800185e:	bc80      	pop	{r7}
 8001860:	4770      	bx	lr
 8001862:	bf00      	nop
 8001864:	40007000 	.word	0x40007000
 8001868:	40006c00 	.word	0x40006c00

0800186c <set_fault_flag>:
 800186c:	b480      	push	{r7}
 800186e:	af00      	add	r7, sp, #0
 8001870:	4a09      	ldr	r2, [pc, #36]	; (8001898 <set_fault_flag+0x2c>)
 8001872:	4b09      	ldr	r3, [pc, #36]	; (8001898 <set_fault_flag+0x2c>)
 8001874:	681b      	ldr	r3, [r3, #0]
 8001876:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 800187a:	6013      	str	r3, [r2, #0]
 800187c:	4b07      	ldr	r3, [pc, #28]	; (800189c <set_fault_flag+0x30>)
 800187e:	f244 5267 	movw	r2, #17767	; 0x4567
 8001882:	829a      	strh	r2, [r3, #20]
 8001884:	4a04      	ldr	r2, [pc, #16]	; (8001898 <set_fault_flag+0x2c>)
 8001886:	4b04      	ldr	r3, [pc, #16]	; (8001898 <set_fault_flag+0x2c>)
 8001888:	681b      	ldr	r3, [r3, #0]
 800188a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 800188e:	6013      	str	r3, [r2, #0]
 8001890:	bf00      	nop
 8001892:	46bd      	mov	sp, r7
 8001894:	bc80      	pop	{r7}
 8001896:	4770      	bx	lr
 8001898:	40007000 	.word	0x40007000
 800189c:	40006c00 	.word	0x40006c00

080018a0 <SysTick_Handler>:
 80018a0:	b480      	push	{r7}
 80018a2:	af00      	add	r7, sp, #0
 80018a4:	4b04      	ldr	r3, [pc, #16]	; (80018b8 <SysTick_Handler+0x18>)
 80018a6:	681b      	ldr	r3, [r3, #0]
 80018a8:	3301      	adds	r3, #1
 80018aa:	4a03      	ldr	r2, [pc, #12]	; (80018b8 <SysTick_Handler+0x18>)
 80018ac:	6013      	str	r3, [r2, #0]
 80018ae:	bf00      	nop
 80018b0:	46bd      	mov	sp, r7
 80018b2:	bc80      	pop	{r7}
 80018b4:	4770      	bx	lr
 80018b6:	bf00      	nop
 80018b8:	20000cc8 	.word	0x20000cc8

080018bc <EXTI4_IRQHandler>:
 80018bc:	b480      	push	{r7}
 80018be:	af00      	add	r7, sp, #0
 80018c0:	4b0e      	ldr	r3, [pc, #56]	; (80018fc <EXTI4_IRQHandler+0x40>)
 80018c2:	695b      	ldr	r3, [r3, #20]
 80018c4:	f003 0310 	and.w	r3, r3, #16
 80018c8:	2b00      	cmp	r3, #0
 80018ca:	d011      	beq.n	80018f0 <EXTI4_IRQHandler+0x34>
 80018cc:	4a0b      	ldr	r2, [pc, #44]	; (80018fc <EXTI4_IRQHandler+0x40>)
 80018ce:	4b0b      	ldr	r3, [pc, #44]	; (80018fc <EXTI4_IRQHandler+0x40>)
 80018d0:	695b      	ldr	r3, [r3, #20]
 80018d2:	f043 0310 	orr.w	r3, r3, #16
 80018d6:	6153      	str	r3, [r2, #20]
 80018d8:	4b09      	ldr	r3, [pc, #36]	; (8001900 <EXTI4_IRQHandler+0x44>)
 80018da:	681b      	ldr	r3, [r3, #0]
 80018dc:	f083 0301 	eor.w	r3, r3, #1
 80018e0:	4a07      	ldr	r2, [pc, #28]	; (8001900 <EXTI4_IRQHandler+0x44>)
 80018e2:	6013      	str	r3, [r2, #0]
 80018e4:	4b07      	ldr	r3, [pc, #28]	; (8001904 <EXTI4_IRQHandler+0x48>)
 80018e6:	2200      	movs	r2, #0
 80018e8:	601a      	str	r2, [r3, #0]
 80018ea:	4b07      	ldr	r3, [pc, #28]	; (8001908 <EXTI4_IRQHandler+0x4c>)
 80018ec:	2200      	movs	r2, #0
 80018ee:	601a      	str	r2, [r3, #0]
 80018f0:	bf00      	nop
 80018f2:	4618      	mov	r0, r3
 80018f4:	46bd      	mov	sp, r7
 80018f6:	bc80      	pop	{r7}
 80018f8:	4770      	bx	lr
 80018fa:	bf00      	nop
 80018fc:	40010400 	.word	0x40010400
 8001900:	20000ccc 	.word	0x20000ccc
 8001904:	20000d28 	.word	0x20000d28
 8001908:	20000d24 	.word	0x20000d24

0800190c <ADC1_2_IRQHandler>:
 800190c:	b580      	push	{r7, lr}
 800190e:	af00      	add	r7, sp, #0
 8001910:	4b45      	ldr	r3, [pc, #276]	; (8001a28 <ADC1_2_IRQHandler+0x11c>)
 8001912:	689b      	ldr	r3, [r3, #8]
 8001914:	f003 0310 	and.w	r3, r3, #16
 8001918:	2b00      	cmp	r3, #0
 800191a:	d105      	bne.n	8001928 <ADC1_2_IRQHandler+0x1c>
 800191c:	4b43      	ldr	r3, [pc, #268]	; (8001a2c <ADC1_2_IRQHandler+0x120>)
 800191e:	681b      	ldr	r3, [r3, #0]
 8001920:	3301      	adds	r3, #1
 8001922:	4a42      	ldr	r2, [pc, #264]	; (8001a2c <ADC1_2_IRQHandler+0x120>)
 8001924:	6013      	str	r3, [r2, #0]
 8001926:	e004      	b.n	8001932 <ADC1_2_IRQHandler+0x26>
 8001928:	4b41      	ldr	r3, [pc, #260]	; (8001a30 <ADC1_2_IRQHandler+0x124>)
 800192a:	681b      	ldr	r3, [r3, #0]
 800192c:	3301      	adds	r3, #1
 800192e:	4a40      	ldr	r2, [pc, #256]	; (8001a30 <ADC1_2_IRQHandler+0x124>)
 8001930:	6013      	str	r3, [r2, #0]
 8001932:	4b40      	ldr	r3, [pc, #256]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 8001934:	681b      	ldr	r3, [r3, #0]
 8001936:	f003 0302 	and.w	r3, r3, #2
 800193a:	2b00      	cmp	r3, #0
 800193c:	d054      	beq.n	80019e8 <ADC1_2_IRQHandler+0xdc>
 800193e:	4b3d      	ldr	r3, [pc, #244]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 8001940:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 8001942:	b29b      	uxth	r3, r3
 8001944:	461a      	mov	r2, r3
 8001946:	4b3c      	ldr	r3, [pc, #240]	; (8001a38 <ADC1_2_IRQHandler+0x12c>)
 8001948:	681b      	ldr	r3, [r3, #0]
 800194a:	4413      	add	r3, r2
 800194c:	4a3a      	ldr	r2, [pc, #232]	; (8001a38 <ADC1_2_IRQHandler+0x12c>)
 800194e:	6013      	str	r3, [r2, #0]
 8001950:	4b39      	ldr	r3, [pc, #228]	; (8001a38 <ADC1_2_IRQHandler+0x12c>)
 8001952:	681b      	ldr	r3, [r3, #0]
 8001954:	4a39      	ldr	r2, [pc, #228]	; (8001a3c <ADC1_2_IRQHandler+0x130>)
 8001956:	6812      	ldr	r2, [r2, #0]
 8001958:	4939      	ldr	r1, [pc, #228]	; (8001a40 <ADC1_2_IRQHandler+0x134>)
 800195a:	f831 2012 	ldrh.w	r2, [r1, r2, lsl #1]
 800195e:	1a9b      	subs	r3, r3, r2
 8001960:	4a35      	ldr	r2, [pc, #212]	; (8001a38 <ADC1_2_IRQHandler+0x12c>)
 8001962:	6013      	str	r3, [r2, #0]
 8001964:	4b35      	ldr	r3, [pc, #212]	; (8001a3c <ADC1_2_IRQHandler+0x130>)
 8001966:	681b      	ldr	r3, [r3, #0]
 8001968:	4a32      	ldr	r2, [pc, #200]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 800196a:	6cd2      	ldr	r2, [r2, #76]	; 0x4c
 800196c:	b291      	uxth	r1, r2
 800196e:	4a34      	ldr	r2, [pc, #208]	; (8001a40 <ADC1_2_IRQHandler+0x134>)
 8001970:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001974:	4b31      	ldr	r3, [pc, #196]	; (8001a3c <ADC1_2_IRQHandler+0x130>)
 8001976:	681b      	ldr	r3, [r3, #0]
 8001978:	3301      	adds	r3, #1
 800197a:	f003 031f 	and.w	r3, r3, #31
 800197e:	4a2f      	ldr	r2, [pc, #188]	; (8001a3c <ADC1_2_IRQHandler+0x130>)
 8001980:	6013      	str	r3, [r2, #0]
 8001982:	4b2d      	ldr	r3, [pc, #180]	; (8001a38 <ADC1_2_IRQHandler+0x12c>)
 8001984:	681b      	ldr	r3, [r3, #0]
 8001986:	095b      	lsrs	r3, r3, #5
 8001988:	b29a      	uxth	r2, r3
 800198a:	4b2e      	ldr	r3, [pc, #184]	; (8001a44 <ADC1_2_IRQHandler+0x138>)
 800198c:	801a      	strh	r2, [r3, #0]
 800198e:	4b2e      	ldr	r3, [pc, #184]	; (8001a48 <ADC1_2_IRQHandler+0x13c>)
 8001990:	881b      	ldrh	r3, [r3, #0]
 8001992:	2b00      	cmp	r3, #0
 8001994:	d016      	beq.n	80019c4 <ADC1_2_IRQHandler+0xb8>
 8001996:	4b2b      	ldr	r3, [pc, #172]	; (8001a44 <ADC1_2_IRQHandler+0x138>)
 8001998:	881b      	ldrh	r3, [r3, #0]
 800199a:	461a      	mov	r2, r3
 800199c:	4b2b      	ldr	r3, [pc, #172]	; (8001a4c <ADC1_2_IRQHandler+0x140>)
 800199e:	881b      	ldrh	r3, [r3, #0]
 80019a0:	3b32      	subs	r3, #50	; 0x32
 80019a2:	429a      	cmp	r2, r3
 80019a4:	dc07      	bgt.n	80019b6 <ADC1_2_IRQHandler+0xaa>
 80019a6:	4b27      	ldr	r3, [pc, #156]	; (8001a44 <ADC1_2_IRQHandler+0x138>)
 80019a8:	881b      	ldrh	r3, [r3, #0]
 80019aa:	461a      	mov	r2, r3
 80019ac:	4b28      	ldr	r3, [pc, #160]	; (8001a50 <ADC1_2_IRQHandler+0x144>)
 80019ae:	881b      	ldrh	r3, [r3, #0]
 80019b0:	3332      	adds	r3, #50	; 0x32
 80019b2:	429a      	cmp	r2, r3
 80019b4:	da01      	bge.n	80019ba <ADC1_2_IRQHandler+0xae>
 80019b6:	2301      	movs	r3, #1
 80019b8:	e000      	b.n	80019bc <ADC1_2_IRQHandler+0xb0>
 80019ba:	2300      	movs	r3, #0
 80019bc:	b29a      	uxth	r2, r3
 80019be:	4b22      	ldr	r3, [pc, #136]	; (8001a48 <ADC1_2_IRQHandler+0x13c>)
 80019c0:	801a      	strh	r2, [r3, #0]
 80019c2:	e011      	b.n	80019e8 <ADC1_2_IRQHandler+0xdc>
 80019c4:	4b1f      	ldr	r3, [pc, #124]	; (8001a44 <ADC1_2_IRQHandler+0x138>)
 80019c6:	881a      	ldrh	r2, [r3, #0]
 80019c8:	4b20      	ldr	r3, [pc, #128]	; (8001a4c <ADC1_2_IRQHandler+0x140>)
 80019ca:	881b      	ldrh	r3, [r3, #0]
 80019cc:	429a      	cmp	r2, r3
 80019ce:	d805      	bhi.n	80019dc <ADC1_2_IRQHandler+0xd0>
 80019d0:	4b1c      	ldr	r3, [pc, #112]	; (8001a44 <ADC1_2_IRQHandler+0x138>)
 80019d2:	881a      	ldrh	r2, [r3, #0]
 80019d4:	4b1e      	ldr	r3, [pc, #120]	; (8001a50 <ADC1_2_IRQHandler+0x144>)
 80019d6:	881b      	ldrh	r3, [r3, #0]
 80019d8:	429a      	cmp	r2, r3
 80019da:	d201      	bcs.n	80019e0 <ADC1_2_IRQHandler+0xd4>
 80019dc:	2301      	movs	r3, #1
 80019de:	e000      	b.n	80019e2 <ADC1_2_IRQHandler+0xd6>
 80019e0:	2300      	movs	r3, #0
 80019e2:	b29a      	uxth	r2, r3
 80019e4:	4b18      	ldr	r3, [pc, #96]	; (8001a48 <ADC1_2_IRQHandler+0x13c>)
 80019e6:	801a      	strh	r2, [r3, #0]
 80019e8:	4b12      	ldr	r3, [pc, #72]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 80019ea:	681b      	ldr	r3, [r3, #0]
 80019ec:	f003 0301 	and.w	r3, r3, #1
 80019f0:	2b00      	cmp	r3, #0
 80019f2:	d016      	beq.n	8001a22 <ADC1_2_IRQHandler+0x116>
 80019f4:	4a0f      	ldr	r2, [pc, #60]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 80019f6:	4b0f      	ldr	r3, [pc, #60]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 80019f8:	681b      	ldr	r3, [r3, #0]
 80019fa:	f023 0301 	bic.w	r3, r3, #1
 80019fe:	6013      	str	r3, [r2, #0]
 8001a00:	4b0c      	ldr	r3, [pc, #48]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 8001a02:	6cda      	ldr	r2, [r3, #76]	; 0x4c
 8001a04:	4b0b      	ldr	r3, [pc, #44]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 8001a06:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8001a08:	429a      	cmp	r2, r3
 8001a0a:	d902      	bls.n	8001a12 <ADC1_2_IRQHandler+0x106>
 8001a0c:	f001 f978 	bl	8002d00 <led_off>
 8001a10:	e007      	b.n	8001a22 <ADC1_2_IRQHandler+0x116>
 8001a12:	4b08      	ldr	r3, [pc, #32]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 8001a14:	6cda      	ldr	r2, [r3, #76]	; 0x4c
 8001a16:	4b07      	ldr	r3, [pc, #28]	; (8001a34 <ADC1_2_IRQHandler+0x128>)
 8001a18:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 8001a1a:	429a      	cmp	r2, r3
 8001a1c:	d201      	bcs.n	8001a22 <ADC1_2_IRQHandler+0x116>
 8001a1e:	f001 f961 	bl	8002ce4 <led_on>
 8001a22:	bf00      	nop
 8001a24:	4618      	mov	r0, r3
 8001a26:	bd80      	pop	{r7, pc}
 8001a28:	40010c00 	.word	0x40010c00
 8001a2c:	20000d28 	.word	0x20000d28
 8001a30:	20000d24 	.word	0x20000d24
 8001a34:	40012400 	.word	0x40012400
 8001a38:	20000d1c 	.word	0x20000d1c
 8001a3c:	20000d20 	.word	0x20000d20
 8001a40:	20000cdc 	.word	0x20000cdc
 8001a44:	20000cd0 	.word	0x20000cd0
 8001a48:	20000cd2 	.word	0x20000cd2
 8001a4c:	20000002 	.word	0x20000002
 8001a50:	20000004 	.word	0x20000004

08001a54 <TIM2_IRQHandler>:
 8001a54:	b480      	push	{r7}
 8001a56:	af00      	add	r7, sp, #0
 8001a58:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8001a5c:	8a1b      	ldrh	r3, [r3, #16]
 8001a5e:	b29b      	uxth	r3, r3
 8001a60:	f003 0304 	and.w	r3, r3, #4
 8001a64:	2b00      	cmp	r3, #0
 8001a66:	d009      	beq.n	8001a7c <TIM2_IRQHandler+0x28>
 8001a68:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
 8001a6c:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 8001a70:	8a1b      	ldrh	r3, [r3, #16]
 8001a72:	b29b      	uxth	r3, r3
 8001a74:	f023 0304 	bic.w	r3, r3, #4
 8001a78:	b29b      	uxth	r3, r3
 8001a7a:	8213      	strh	r3, [r2, #16]
 8001a7c:	bf00      	nop
 8001a7e:	46bd      	mov	sp, r7
 8001a80:	bc80      	pop	{r7}
 8001a82:	4770      	bx	lr

08001a84 <null_promt>:
 8001a84:	b480      	push	{r7}
 8001a86:	af00      	add	r7, sp, #0
 8001a88:	bf00      	nop
 8001a8a:	46bd      	mov	sp, r7
 8001a8c:	bc80      	pop	{r7}
 8001a8e:	4770      	bx	lr

08001a90 <null_resp>:
 8001a90:	b480      	push	{r7}
 8001a92:	b083      	sub	sp, #12
 8001a94:	af00      	add	r7, sp, #0
 8001a96:	6078      	str	r0, [r7, #4]
 8001a98:	bf00      	nop
 8001a9a:	370c      	adds	r7, #12
 8001a9c:	46bd      	mov	sp, r7
 8001a9e:	bc80      	pop	{r7}
 8001aa0:	4770      	bx	lr
 8001aa2:	bf00      	nop

08001aa4 <null_ok>:
 8001aa4:	b480      	push	{r7}
 8001aa6:	af00      	add	r7, sp, #0
 8001aa8:	bf00      	nop
 8001aaa:	46bd      	mov	sp, r7
 8001aac:	bc80      	pop	{r7}
 8001aae:	4770      	bx	lr

08001ab0 <null_error>:
 8001ab0:	b480      	push	{r7}
 8001ab2:	af00      	add	r7, sp, #0
 8001ab4:	bf00      	nop
 8001ab6:	46bd      	mov	sp, r7
 8001ab8:	bc80      	pop	{r7}
 8001aba:	4770      	bx	lr

08001abc <sim900_update>:
 8001abc:	b580      	push	{r7, lr}
 8001abe:	b082      	sub	sp, #8
 8001ac0:	af00      	add	r7, sp, #0
 8001ac2:	2300      	movs	r3, #0
 8001ac4:	607b      	str	r3, [r7, #4]
 8001ac6:	1cfb      	adds	r3, r7, #3
 8001ac8:	2101      	movs	r1, #1
 8001aca:	4618      	mov	r0, r3
 8001acc:	f7ff fa7a 	bl	8000fc4 <uart_read>
 8001ad0:	4603      	mov	r3, r0
 8001ad2:	2b01      	cmp	r3, #1
 8001ad4:	d144      	bne.n	8001b60 <sim900_update+0xa4>
 8001ad6:	78fb      	ldrb	r3, [r7, #3]
 8001ad8:	2b3e      	cmp	r3, #62	; 0x3e
 8001ada:	d103      	bne.n	8001ae4 <sim900_update+0x28>
 8001adc:	4b23      	ldr	r3, [pc, #140]	; (8001b6c <sim900_update+0xb0>)
 8001ade:	681b      	ldr	r3, [r3, #0]
 8001ae0:	4798      	blx	r3
 8001ae2:	e03a      	b.n	8001b5a <sim900_update+0x9e>
 8001ae4:	4b22      	ldr	r3, [pc, #136]	; (8001b70 <sim900_update+0xb4>)
 8001ae6:	781b      	ldrb	r3, [r3, #0]
 8001ae8:	2b0d      	cmp	r3, #13
 8001aea:	d12e      	bne.n	8001b4a <sim900_update+0x8e>
 8001aec:	78fb      	ldrb	r3, [r7, #3]
 8001aee:	2b0a      	cmp	r3, #10
 8001af0:	d12b      	bne.n	8001b4a <sim900_update+0x8e>
 8001af2:	4b20      	ldr	r3, [pc, #128]	; (8001b74 <sim900_update+0xb8>)
 8001af4:	681b      	ldr	r3, [r3, #0]
 8001af6:	4a20      	ldr	r2, [pc, #128]	; (8001b78 <sim900_update+0xbc>)
 8001af8:	2100      	movs	r1, #0
 8001afa:	54d1      	strb	r1, [r2, r3]
 8001afc:	4b1d      	ldr	r3, [pc, #116]	; (8001b74 <sim900_update+0xb8>)
 8001afe:	681b      	ldr	r3, [r3, #0]
 8001b00:	3b01      	subs	r3, #1
 8001b02:	607b      	str	r3, [r7, #4]
 8001b04:	4b1b      	ldr	r3, [pc, #108]	; (8001b74 <sim900_update+0xb8>)
 8001b06:	2200      	movs	r2, #0
 8001b08:	601a      	str	r2, [r3, #0]
 8001b0a:	687b      	ldr	r3, [r7, #4]
 8001b0c:	2b00      	cmp	r3, #0
 8001b0e:	dd24      	ble.n	8001b5a <sim900_update+0x9e>
 8001b10:	2202      	movs	r2, #2
 8001b12:	491a      	ldr	r1, [pc, #104]	; (8001b7c <sim900_update+0xc0>)
 8001b14:	4818      	ldr	r0, [pc, #96]	; (8001b78 <sim900_update+0xbc>)
 8001b16:	f7fe fb0d 	bl	8000134 <strncmp>
 8001b1a:	4603      	mov	r3, r0
 8001b1c:	2b00      	cmp	r3, #0
 8001b1e:	d103      	bne.n	8001b28 <sim900_update+0x6c>
 8001b20:	4b17      	ldr	r3, [pc, #92]	; (8001b80 <sim900_update+0xc4>)
 8001b22:	681b      	ldr	r3, [r3, #0]
 8001b24:	4798      	blx	r3
 8001b26:	e018      	b.n	8001b5a <sim900_update+0x9e>
 8001b28:	2205      	movs	r2, #5
 8001b2a:	4916      	ldr	r1, [pc, #88]	; (8001b84 <sim900_update+0xc8>)
 8001b2c:	4812      	ldr	r0, [pc, #72]	; (8001b78 <sim900_update+0xbc>)
 8001b2e:	f7fe fb01 	bl	8000134 <strncmp>
 8001b32:	4603      	mov	r3, r0
 8001b34:	2b00      	cmp	r3, #0
 8001b36:	d103      	bne.n	8001b40 <sim900_update+0x84>
 8001b38:	4b13      	ldr	r3, [pc, #76]	; (8001b88 <sim900_update+0xcc>)
 8001b3a:	681b      	ldr	r3, [r3, #0]
 8001b3c:	4798      	blx	r3
 8001b3e:	e00c      	b.n	8001b5a <sim900_update+0x9e>
 8001b40:	4b12      	ldr	r3, [pc, #72]	; (8001b8c <sim900_update+0xd0>)
 8001b42:	681b      	ldr	r3, [r3, #0]
 8001b44:	6878      	ldr	r0, [r7, #4]
 8001b46:	4798      	blx	r3
 8001b48:	e007      	b.n	8001b5a <sim900_update+0x9e>
 8001b4a:	4b0a      	ldr	r3, [pc, #40]	; (8001b74 <sim900_update+0xb8>)
 8001b4c:	681b      	ldr	r3, [r3, #0]
 8001b4e:	1c5a      	adds	r2, r3, #1
 8001b50:	4908      	ldr	r1, [pc, #32]	; (8001b74 <sim900_update+0xb8>)
 8001b52:	600a      	str	r2, [r1, #0]
 8001b54:	78f9      	ldrb	r1, [r7, #3]
 8001b56:	4a08      	ldr	r2, [pc, #32]	; (8001b78 <sim900_update+0xbc>)
 8001b58:	54d1      	strb	r1, [r2, r3]
 8001b5a:	78fa      	ldrb	r2, [r7, #3]
 8001b5c:	4b04      	ldr	r3, [pc, #16]	; (8001b70 <sim900_update+0xb4>)
 8001b5e:	701a      	strb	r2, [r3, #0]
 8001b60:	687b      	ldr	r3, [r7, #4]
 8001b62:	4618      	mov	r0, r3
 8001b64:	3708      	adds	r7, #8
 8001b66:	46bd      	mov	sp, r7
 8001b68:	bd80      	pop	{r7, pc}
 8001b6a:	bf00      	nop
 8001b6c:	20000020 	.word	0x20000020
 8001b70:	20001370 	.word	0x20001370
 8001b74:	20001374 	.word	0x20001374
 8001b78:	20000f70 	.word	0x20000f70
 8001b7c:	08003724 	.word	0x08003724
 8001b80:	20000018 	.word	0x20000018
 8001b84:	08003728 	.word	0x08003728
 8001b88:	2000001c 	.word	0x2000001c
 8001b8c:	20000014 	.word	0x20000014

08001b90 <print_response>:
 8001b90:	b580      	push	{r7, lr}
 8001b92:	b084      	sub	sp, #16
 8001b94:	af00      	add	r7, sp, #0
 8001b96:	6078      	str	r0, [r7, #4]
 8001b98:	2300      	movs	r3, #0
 8001b9a:	60fb      	str	r3, [r7, #12]
 8001b9c:	e00a      	b.n	8001bb4 <print_response+0x24>
 8001b9e:	4a0b      	ldr	r2, [pc, #44]	; (8001bcc <print_response+0x3c>)
 8001ba0:	68fb      	ldr	r3, [r7, #12]
 8001ba2:	4413      	add	r3, r2
 8001ba4:	781b      	ldrb	r3, [r3, #0]
 8001ba6:	4619      	mov	r1, r3
 8001ba8:	4809      	ldr	r0, [pc, #36]	; (8001bd0 <print_response+0x40>)
 8001baa:	f7fe fe73 	bl	8000894 <xprintf>
 8001bae:	68fb      	ldr	r3, [r7, #12]
 8001bb0:	3301      	adds	r3, #1
 8001bb2:	60fb      	str	r3, [r7, #12]
 8001bb4:	68fa      	ldr	r2, [r7, #12]
 8001bb6:	687b      	ldr	r3, [r7, #4]
 8001bb8:	429a      	cmp	r2, r3
 8001bba:	dbf0      	blt.n	8001b9e <print_response+0xe>
 8001bbc:	4805      	ldr	r0, [pc, #20]	; (8001bd4 <print_response+0x44>)
 8001bbe:	f7fe fe69 	bl	8000894 <xprintf>
 8001bc2:	bf00      	nop
 8001bc4:	3710      	adds	r7, #16
 8001bc6:	46bd      	mov	sp, r7
 8001bc8:	bd80      	pop	{r7, pc}
 8001bca:	bf00      	nop
 8001bcc:	20000f70 	.word	0x20000f70
 8001bd0:	08003730 	.word	0x08003730
 8001bd4:	08003734 	.word	0x08003734

08001bd8 <print_response_hex>:
 8001bd8:	b580      	push	{r7, lr}
 8001bda:	b084      	sub	sp, #16
 8001bdc:	af00      	add	r7, sp, #0
 8001bde:	6078      	str	r0, [r7, #4]
 8001be0:	2300      	movs	r3, #0
 8001be2:	60fb      	str	r3, [r7, #12]
 8001be4:	e00a      	b.n	8001bfc <print_response_hex+0x24>
 8001be6:	4a0b      	ldr	r2, [pc, #44]	; (8001c14 <print_response_hex+0x3c>)
 8001be8:	68fb      	ldr	r3, [r7, #12]
 8001bea:	4413      	add	r3, r2
 8001bec:	781b      	ldrb	r3, [r3, #0]
 8001bee:	4619      	mov	r1, r3
 8001bf0:	4809      	ldr	r0, [pc, #36]	; (8001c18 <print_response_hex+0x40>)
 8001bf2:	f7fe fe4f 	bl	8000894 <xprintf>
 8001bf6:	68fb      	ldr	r3, [r7, #12]
 8001bf8:	3301      	adds	r3, #1
 8001bfa:	60fb      	str	r3, [r7, #12]
 8001bfc:	68fa      	ldr	r2, [r7, #12]
 8001bfe:	687b      	ldr	r3, [r7, #4]
 8001c00:	429a      	cmp	r2, r3
 8001c02:	dbf0      	blt.n	8001be6 <print_response_hex+0xe>
 8001c04:	4805      	ldr	r0, [pc, #20]	; (8001c1c <print_response_hex+0x44>)
 8001c06:	f7fe fe45 	bl	8000894 <xprintf>
 8001c0a:	bf00      	nop
 8001c0c:	3710      	adds	r7, #16
 8001c0e:	46bd      	mov	sp, r7
 8001c10:	bd80      	pop	{r7, pc}
 8001c12:	bf00      	nop
 8001c14:	20000f70 	.word	0x20000f70
 8001c18:	08003738 	.word	0x08003738
 8001c1c:	08003734 	.word	0x08003734

08001c20 <itsok>:
 8001c20:	b580      	push	{r7, lr}
 8001c22:	af00      	add	r7, sp, #0
 8001c24:	4802      	ldr	r0, [pc, #8]	; (8001c30 <itsok+0x10>)
 8001c26:	f7fe fe35 	bl	8000894 <xprintf>
 8001c2a:	bf00      	nop
 8001c2c:	bd80      	pop	{r7, pc}
 8001c2e:	bf00      	nop
 8001c30:	08003740 	.word	0x08003740

08001c34 <itserror>:
 8001c34:	b580      	push	{r7, lr}
 8001c36:	af00      	add	r7, sp, #0
 8001c38:	4803      	ldr	r0, [pc, #12]	; (8001c48 <itserror+0x14>)
 8001c3a:	f7fe fe2b 	bl	8000894 <xprintf>
 8001c3e:	4b03      	ldr	r3, [pc, #12]	; (8001c4c <itserror+0x18>)
 8001c40:	2201      	movs	r2, #1
 8001c42:	601a      	str	r2, [r3, #0]
 8001c44:	bf00      	nop
 8001c46:	bd80      	pop	{r7, pc}
 8001c48:	08003744 	.word	0x08003744
 8001c4c:	20000d44 	.word	0x20000d44

08001c50 <sim900_command>:
 8001c50:	b580      	push	{r7, lr}
 8001c52:	b082      	sub	sp, #8
 8001c54:	af00      	add	r7, sp, #0
 8001c56:	6078      	str	r0, [r7, #4]
 8001c58:	6878      	ldr	r0, [r7, #4]
 8001c5a:	f7fe fa91 	bl	8000180 <strlen>
 8001c5e:	4603      	mov	r3, r0
 8001c60:	4619      	mov	r1, r3
 8001c62:	6878      	ldr	r0, [r7, #4]
 8001c64:	f7ff f90a 	bl	8000e7c <uart_send>
 8001c68:	bf00      	nop
 8001c6a:	3708      	adds	r7, #8
 8001c6c:	46bd      	mov	sp, r7
 8001c6e:	bd80      	pop	{r7, pc}

08001c70 <encode_adress>:
 8001c70:	b580      	push	{r7, lr}
 8001c72:	b08a      	sub	sp, #40	; 0x28
 8001c74:	af00      	add	r7, sp, #0
 8001c76:	60f8      	str	r0, [r7, #12]
 8001c78:	60b9      	str	r1, [r7, #8]
 8001c7a:	607a      	str	r2, [r7, #4]
 8001c7c:	70fb      	strb	r3, [r7, #3]
 8001c7e:	68f8      	ldr	r0, [r7, #12]
 8001c80:	f7fe fa7e 	bl	8000180 <strlen>
 8001c84:	4603      	mov	r3, r0
 8001c86:	61bb      	str	r3, [r7, #24]
 8001c88:	69bb      	ldr	r3, [r7, #24]
 8001c8a:	085b      	lsrs	r3, r3, #1
 8001c8c:	617b      	str	r3, [r7, #20]
 8001c8e:	78fb      	ldrb	r3, [r7, #3]
 8001c90:	2b00      	cmp	r3, #0
 8001c92:	d113      	bne.n	8001cbc <encode_adress+0x4c>
 8001c94:	69bb      	ldr	r3, [r7, #24]
 8001c96:	f003 0301 	and.w	r3, r3, #1
 8001c9a:	2b00      	cmp	r3, #0
 8001c9c:	d007      	beq.n	8001cae <encode_adress+0x3e>
 8001c9e:	697b      	ldr	r3, [r7, #20]
 8001ca0:	3302      	adds	r3, #2
 8001ca2:	2202      	movs	r2, #2
 8001ca4:	6879      	ldr	r1, [r7, #4]
 8001ca6:	4618      	mov	r0, r3
 8001ca8:	f7fe fb1e 	bl	80002e8 <tohex>
 8001cac:	e006      	b.n	8001cbc <encode_adress+0x4c>
 8001cae:	697b      	ldr	r3, [r7, #20]
 8001cb0:	3301      	adds	r3, #1
 8001cb2:	2202      	movs	r2, #2
 8001cb4:	6879      	ldr	r1, [r7, #4]
 8001cb6:	4618      	mov	r0, r3
 8001cb8:	f7fe fb16 	bl	80002e8 <tohex>
 8001cbc:	78fb      	ldrb	r3, [r7, #3]
 8001cbe:	2b01      	cmp	r3, #1
 8001cc0:	d104      	bne.n	8001ccc <encode_adress+0x5c>
 8001cc2:	2202      	movs	r2, #2
 8001cc4:	6879      	ldr	r1, [r7, #4]
 8001cc6:	69b8      	ldr	r0, [r7, #24]
 8001cc8:	f7fe fb0e 	bl	80002e8 <tohex>
 8001ccc:	687b      	ldr	r3, [r7, #4]
 8001cce:	3302      	adds	r3, #2
 8001cd0:	2202      	movs	r2, #2
 8001cd2:	4619      	mov	r1, r3
 8001cd4:	68b8      	ldr	r0, [r7, #8]
 8001cd6:	f7fe fb07 	bl	80002e8 <tohex>
 8001cda:	2300      	movs	r3, #0
 8001cdc:	627b      	str	r3, [r7, #36]	; 0x24
 8001cde:	e01a      	b.n	8001d16 <encode_adress+0xa6>
 8001ce0:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8001ce2:	005b      	lsls	r3, r3, #1
 8001ce4:	623b      	str	r3, [r7, #32]
 8001ce6:	6a3b      	ldr	r3, [r7, #32]
 8001ce8:	3304      	adds	r3, #4
 8001cea:	61fb      	str	r3, [r7, #28]
 8001cec:	687a      	ldr	r2, [r7, #4]
 8001cee:	69fb      	ldr	r3, [r7, #28]
 8001cf0:	4413      	add	r3, r2
 8001cf2:	6a3a      	ldr	r2, [r7, #32]
 8001cf4:	3201      	adds	r2, #1
 8001cf6:	68f9      	ldr	r1, [r7, #12]
 8001cf8:	440a      	add	r2, r1
 8001cfa:	7812      	ldrb	r2, [r2, #0]
 8001cfc:	701a      	strb	r2, [r3, #0]
 8001cfe:	69fb      	ldr	r3, [r7, #28]
 8001d00:	3301      	adds	r3, #1
 8001d02:	687a      	ldr	r2, [r7, #4]
 8001d04:	4413      	add	r3, r2
 8001d06:	68f9      	ldr	r1, [r7, #12]
 8001d08:	6a3a      	ldr	r2, [r7, #32]
 8001d0a:	440a      	add	r2, r1
 8001d0c:	7812      	ldrb	r2, [r2, #0]
 8001d0e:	701a      	strb	r2, [r3, #0]
 8001d10:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8001d12:	3301      	adds	r3, #1
 8001d14:	627b      	str	r3, [r7, #36]	; 0x24
 8001d16:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 8001d18:	697b      	ldr	r3, [r7, #20]
 8001d1a:	429a      	cmp	r2, r3
 8001d1c:	d3e0      	bcc.n	8001ce0 <encode_adress+0x70>
 8001d1e:	69bb      	ldr	r3, [r7, #24]
 8001d20:	f003 0301 	and.w	r3, r3, #1
 8001d24:	2b00      	cmp	r3, #0
 8001d26:	d00f      	beq.n	8001d48 <encode_adress+0xd8>
 8001d28:	69fb      	ldr	r3, [r7, #28]
 8001d2a:	3302      	adds	r3, #2
 8001d2c:	687a      	ldr	r2, [r7, #4]
 8001d2e:	4413      	add	r3, r2
 8001d30:	2246      	movs	r2, #70	; 0x46
 8001d32:	701a      	strb	r2, [r3, #0]
 8001d34:	69fb      	ldr	r3, [r7, #28]
 8001d36:	3303      	adds	r3, #3
 8001d38:	687a      	ldr	r2, [r7, #4]
 8001d3a:	4413      	add	r3, r2
 8001d3c:	6a3a      	ldr	r2, [r7, #32]
 8001d3e:	3202      	adds	r2, #2
 8001d40:	68f9      	ldr	r1, [r7, #12]
 8001d42:	440a      	add	r2, r1
 8001d44:	7812      	ldrb	r2, [r2, #0]
 8001d46:	701a      	strb	r2, [r3, #0]
 8001d48:	69fb      	ldr	r3, [r7, #28]
 8001d4a:	3304      	adds	r3, #4
 8001d4c:	687a      	ldr	r2, [r7, #4]
 8001d4e:	4413      	add	r3, r2
 8001d50:	2200      	movs	r2, #0
 8001d52:	701a      	strb	r2, [r3, #0]
 8001d54:	69fb      	ldr	r3, [r7, #28]
 8001d56:	3304      	adds	r3, #4
 8001d58:	4618      	mov	r0, r3
 8001d5a:	3728      	adds	r7, #40	; 0x28
 8001d5c:	46bd      	mov	sp, r7
 8001d5e:	bd80      	pop	{r7, pc}

08001d60 <compress_7bit>:
 8001d60:	b480      	push	{r7}
 8001d62:	b089      	sub	sp, #36	; 0x24
 8001d64:	af00      	add	r7, sp, #0
 8001d66:	60f8      	str	r0, [r7, #12]
 8001d68:	60b9      	str	r1, [r7, #8]
 8001d6a:	607a      	str	r2, [r7, #4]
 8001d6c:	2300      	movs	r3, #0
 8001d6e:	61fb      	str	r3, [r7, #28]
 8001d70:	2300      	movs	r3, #0
 8001d72:	61bb      	str	r3, [r7, #24]
 8001d74:	2300      	movs	r3, #0
 8001d76:	617b      	str	r3, [r7, #20]
 8001d78:	687a      	ldr	r2, [r7, #4]
 8001d7a:	69bb      	ldr	r3, [r7, #24]
 8001d7c:	1ad3      	subs	r3, r2, r3
 8001d7e:	613b      	str	r3, [r7, #16]
 8001d80:	693b      	ldr	r3, [r7, #16]
 8001d82:	2b07      	cmp	r3, #7
 8001d84:	dd02      	ble.n	8001d8c <compress_7bit+0x2c>
 8001d86:	2307      	movs	r3, #7
 8001d88:	613b      	str	r3, [r7, #16]
 8001d8a:	e002      	b.n	8001d92 <compress_7bit+0x32>
 8001d8c:	693b      	ldr	r3, [r7, #16]
 8001d8e:	2b00      	cmp	r3, #0
 8001d90:	dd4f      	ble.n	8001e32 <compress_7bit+0xd2>
 8001d92:	2300      	movs	r3, #0
 8001d94:	61fb      	str	r3, [r7, #28]
 8001d96:	e044      	b.n	8001e22 <compress_7bit+0xc2>
 8001d98:	69ba      	ldr	r2, [r7, #24]
 8001d9a:	69fb      	ldr	r3, [r7, #28]
 8001d9c:	4413      	add	r3, r2
 8001d9e:	461a      	mov	r2, r3
 8001da0:	68bb      	ldr	r3, [r7, #8]
 8001da2:	4413      	add	r3, r2
 8001da4:	69b9      	ldr	r1, [r7, #24]
 8001da6:	69fa      	ldr	r2, [r7, #28]
 8001da8:	440a      	add	r2, r1
 8001daa:	4611      	mov	r1, r2
 8001dac:	68ba      	ldr	r2, [r7, #8]
 8001dae:	440a      	add	r2, r1
 8001db0:	7812      	ldrb	r2, [r2, #0]
 8001db2:	b251      	sxtb	r1, r2
 8001db4:	69b8      	ldr	r0, [r7, #24]
 8001db6:	69fa      	ldr	r2, [r7, #28]
 8001db8:	4402      	add	r2, r0
 8001dba:	3201      	adds	r2, #1
 8001dbc:	68b8      	ldr	r0, [r7, #8]
 8001dbe:	4402      	add	r2, r0
 8001dc0:	7812      	ldrb	r2, [r2, #0]
 8001dc2:	4610      	mov	r0, r2
 8001dc4:	69fa      	ldr	r2, [r7, #28]
 8001dc6:	f1c2 0207 	rsb	r2, r2, #7
 8001dca:	fa00 f202 	lsl.w	r2, r0, r2
 8001dce:	b252      	sxtb	r2, r2
 8001dd0:	430a      	orrs	r2, r1
 8001dd2:	b252      	sxtb	r2, r2
 8001dd4:	b2d2      	uxtb	r2, r2
 8001dd6:	701a      	strb	r2, [r3, #0]
 8001dd8:	697b      	ldr	r3, [r7, #20]
 8001dda:	68fa      	ldr	r2, [r7, #12]
 8001ddc:	4413      	add	r3, r2
 8001dde:	69b9      	ldr	r1, [r7, #24]
 8001de0:	69fa      	ldr	r2, [r7, #28]
 8001de2:	440a      	add	r2, r1
 8001de4:	4611      	mov	r1, r2
 8001de6:	68ba      	ldr	r2, [r7, #8]
 8001de8:	440a      	add	r2, r1
 8001dea:	7812      	ldrb	r2, [r2, #0]
 8001dec:	701a      	strb	r2, [r3, #0]
 8001dee:	69ba      	ldr	r2, [r7, #24]
 8001df0:	69fb      	ldr	r3, [r7, #28]
 8001df2:	4413      	add	r3, r2
 8001df4:	3301      	adds	r3, #1
 8001df6:	68ba      	ldr	r2, [r7, #8]
 8001df8:	4413      	add	r3, r2
 8001dfa:	69b9      	ldr	r1, [r7, #24]
 8001dfc:	69fa      	ldr	r2, [r7, #28]
 8001dfe:	440a      	add	r2, r1
 8001e00:	3201      	adds	r2, #1
 8001e02:	68b9      	ldr	r1, [r7, #8]
 8001e04:	440a      	add	r2, r1
 8001e06:	7812      	ldrb	r2, [r2, #0]
 8001e08:	4611      	mov	r1, r2
 8001e0a:	69fa      	ldr	r2, [r7, #28]
 8001e0c:	3201      	adds	r2, #1
 8001e0e:	fa41 f202 	asr.w	r2, r1, r2
 8001e12:	b2d2      	uxtb	r2, r2
 8001e14:	701a      	strb	r2, [r3, #0]
 8001e16:	697b      	ldr	r3, [r7, #20]
 8001e18:	3301      	adds	r3, #1
 8001e1a:	617b      	str	r3, [r7, #20]
 8001e1c:	69fb      	ldr	r3, [r7, #28]
 8001e1e:	3301      	adds	r3, #1
 8001e20:	61fb      	str	r3, [r7, #28]
 8001e22:	69fa      	ldr	r2, [r7, #28]
 8001e24:	693b      	ldr	r3, [r7, #16]
 8001e26:	429a      	cmp	r2, r3
 8001e28:	dbb6      	blt.n	8001d98 <compress_7bit+0x38>
 8001e2a:	69bb      	ldr	r3, [r7, #24]
 8001e2c:	3308      	adds	r3, #8
 8001e2e:	61bb      	str	r3, [r7, #24]
 8001e30:	e7a2      	b.n	8001d78 <compress_7bit+0x18>
 8001e32:	bf00      	nop
 8001e34:	697b      	ldr	r3, [r7, #20]
 8001e36:	4618      	mov	r0, r3
 8001e38:	3724      	adds	r7, #36	; 0x24
 8001e3a:	46bd      	mov	sp, r7
 8001e3c:	bc80      	pop	{r7}
 8001e3e:	4770      	bx	lr

08001e40 <encode_message>:
 8001e40:	b580      	push	{r7, lr}
 8001e42:	b08c      	sub	sp, #48	; 0x30
 8001e44:	af00      	add	r7, sp, #0
 8001e46:	60f8      	str	r0, [r7, #12]
 8001e48:	60b9      	str	r1, [r7, #8]
 8001e4a:	4613      	mov	r3, r2
 8001e4c:	71fb      	strb	r3, [r7, #7]
 8001e4e:	2300      	movs	r3, #0
 8001e50:	62bb      	str	r3, [r7, #40]	; 0x28
 8001e52:	68f8      	ldr	r0, [r7, #12]
 8001e54:	f7fe f994 	bl	8000180 <strlen>
 8001e58:	6238      	str	r0, [r7, #32]
 8001e5a:	79f8      	ldrb	r0, [r7, #7]
 8001e5c:	68ba      	ldr	r2, [r7, #8]
 8001e5e:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001e60:	4413      	add	r3, r2
 8001e62:	2202      	movs	r2, #2
 8001e64:	4619      	mov	r1, r3
 8001e66:	f7fe fa3f 	bl	80002e8 <tohex>
 8001e6a:	4603      	mov	r3, r0
 8001e6c:	461a      	mov	r2, r3
 8001e6e:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001e70:	4413      	add	r3, r2
 8001e72:	62bb      	str	r3, [r7, #40]	; 0x28
 8001e74:	79fb      	ldrb	r3, [r7, #7]
 8001e76:	2b00      	cmp	r3, #0
 8001e78:	d134      	bne.n	8001ee4 <encode_message+0xa4>
 8001e7a:	68ba      	ldr	r2, [r7, #8]
 8001e7c:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001e7e:	4413      	add	r3, r2
 8001e80:	2202      	movs	r2, #2
 8001e82:	4619      	mov	r1, r3
 8001e84:	6a38      	ldr	r0, [r7, #32]
 8001e86:	f7fe fa2f 	bl	80002e8 <tohex>
 8001e8a:	4603      	mov	r3, r0
 8001e8c:	461a      	mov	r2, r3
 8001e8e:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001e90:	4413      	add	r3, r2
 8001e92:	62bb      	str	r3, [r7, #40]	; 0x28
 8001e94:	6a3a      	ldr	r2, [r7, #32]
 8001e96:	68f9      	ldr	r1, [r7, #12]
 8001e98:	68f8      	ldr	r0, [r7, #12]
 8001e9a:	f7ff ff61 	bl	8001d60 <compress_7bit>
 8001e9e:	6238      	str	r0, [r7, #32]
 8001ea0:	2300      	movs	r3, #0
 8001ea2:	62fb      	str	r3, [r7, #44]	; 0x2c
 8001ea4:	e013      	b.n	8001ece <encode_message+0x8e>
 8001ea6:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8001ea8:	68fa      	ldr	r2, [r7, #12]
 8001eaa:	4413      	add	r3, r2
 8001eac:	781b      	ldrb	r3, [r3, #0]
 8001eae:	4618      	mov	r0, r3
 8001eb0:	68ba      	ldr	r2, [r7, #8]
 8001eb2:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001eb4:	4413      	add	r3, r2
 8001eb6:	2202      	movs	r2, #2
 8001eb8:	4619      	mov	r1, r3
 8001eba:	f7fe fa15 	bl	80002e8 <tohex>
 8001ebe:	4603      	mov	r3, r0
 8001ec0:	461a      	mov	r2, r3
 8001ec2:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001ec4:	4413      	add	r3, r2
 8001ec6:	62bb      	str	r3, [r7, #40]	; 0x28
 8001ec8:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8001eca:	3301      	adds	r3, #1
 8001ecc:	62fb      	str	r3, [r7, #44]	; 0x2c
 8001ece:	6afa      	ldr	r2, [r7, #44]	; 0x2c
 8001ed0:	6a3b      	ldr	r3, [r7, #32]
 8001ed2:	429a      	cmp	r2, r3
 8001ed4:	dbe7      	blt.n	8001ea6 <encode_message+0x66>
 8001ed6:	68ba      	ldr	r2, [r7, #8]
 8001ed8:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001eda:	4413      	add	r3, r2
 8001edc:	2200      	movs	r2, #0
 8001ede:	701a      	strb	r2, [r3, #0]
 8001ee0:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001ee2:	e057      	b.n	8001f94 <encode_message+0x154>
 8001ee4:	79fb      	ldrb	r3, [r7, #7]
 8001ee6:	2b08      	cmp	r3, #8
 8001ee8:	d150      	bne.n	8001f8c <encode_message+0x14c>
 8001eea:	2300      	movs	r3, #0
 8001eec:	627b      	str	r3, [r7, #36]	; 0x24
 8001eee:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001ef0:	61fb      	str	r3, [r7, #28]
 8001ef2:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001ef4:	3302      	adds	r3, #2
 8001ef6:	62bb      	str	r3, [r7, #40]	; 0x28
 8001ef8:	2300      	movs	r3, #0
 8001efa:	627b      	str	r3, [r7, #36]	; 0x24
 8001efc:	2300      	movs	r3, #0
 8001efe:	62fb      	str	r3, [r7, #44]	; 0x2c
 8001f00:	e024      	b.n	8001f4c <encode_message+0x10c>
 8001f02:	68fa      	ldr	r2, [r7, #12]
 8001f04:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8001f06:	4413      	add	r3, r2
 8001f08:	781b      	ldrb	r3, [r3, #0]
 8001f0a:	2b00      	cmp	r3, #0
 8001f0c:	d023      	beq.n	8001f56 <encode_message+0x116>
 8001f0e:	68fa      	ldr	r2, [r7, #12]
 8001f10:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8001f12:	4413      	add	r3, r2
 8001f14:	f107 0216 	add.w	r2, r7, #22
 8001f18:	4611      	mov	r1, r2
 8001f1a:	4618      	mov	r0, r3
 8001f1c:	f7fe fab0 	bl	8000480 <utf_to_unc>
 8001f20:	4603      	mov	r3, r0
 8001f22:	461a      	mov	r2, r3
 8001f24:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8001f26:	4413      	add	r3, r2
 8001f28:	627b      	str	r3, [r7, #36]	; 0x24
 8001f2a:	8afb      	ldrh	r3, [r7, #22]
 8001f2c:	4618      	mov	r0, r3
 8001f2e:	68ba      	ldr	r2, [r7, #8]
 8001f30:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001f32:	4413      	add	r3, r2
 8001f34:	2204      	movs	r2, #4
 8001f36:	4619      	mov	r1, r3
 8001f38:	f7fe f9d6 	bl	80002e8 <tohex>
 8001f3c:	4603      	mov	r3, r0
 8001f3e:	461a      	mov	r2, r3
 8001f40:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001f42:	4413      	add	r3, r2
 8001f44:	62bb      	str	r3, [r7, #40]	; 0x28
 8001f46:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8001f48:	3301      	adds	r3, #1
 8001f4a:	62fb      	str	r3, [r7, #44]	; 0x2c
 8001f4c:	6afa      	ldr	r2, [r7, #44]	; 0x2c
 8001f4e:	6a3b      	ldr	r3, [r7, #32]
 8001f50:	429a      	cmp	r2, r3
 8001f52:	dbd6      	blt.n	8001f02 <encode_message+0xc2>
 8001f54:	e000      	b.n	8001f58 <encode_message+0x118>
 8001f56:	bf00      	nop
 8001f58:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8001f5a:	005b      	lsls	r3, r3, #1
 8001f5c:	f107 0118 	add.w	r1, r7, #24
 8001f60:	2202      	movs	r2, #2
 8001f62:	4618      	mov	r0, r3
 8001f64:	f7fe f9c0 	bl	80002e8 <tohex>
 8001f68:	68ba      	ldr	r2, [r7, #8]
 8001f6a:	69fb      	ldr	r3, [r7, #28]
 8001f6c:	4413      	add	r3, r2
 8001f6e:	7e3a      	ldrb	r2, [r7, #24]
 8001f70:	701a      	strb	r2, [r3, #0]
 8001f72:	69fb      	ldr	r3, [r7, #28]
 8001f74:	3301      	adds	r3, #1
 8001f76:	68ba      	ldr	r2, [r7, #8]
 8001f78:	4413      	add	r3, r2
 8001f7a:	7e7a      	ldrb	r2, [r7, #25]
 8001f7c:	701a      	strb	r2, [r3, #0]
 8001f7e:	68ba      	ldr	r2, [r7, #8]
 8001f80:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001f82:	4413      	add	r3, r2
 8001f84:	2200      	movs	r2, #0
 8001f86:	701a      	strb	r2, [r3, #0]
 8001f88:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8001f8a:	e003      	b.n	8001f94 <encode_message+0x154>
 8001f8c:	68bb      	ldr	r3, [r7, #8]
 8001f8e:	2200      	movs	r2, #0
 8001f90:	701a      	strb	r2, [r3, #0]
 8001f92:	2300      	movs	r3, #0
 8001f94:	4618      	mov	r0, r3
 8001f96:	3730      	adds	r7, #48	; 0x30
 8001f98:	46bd      	mov	sp, r7
 8001f9a:	bd80      	pop	{r7, pc}

08001f9c <CMGS_ok>:
 8001f9c:	b580      	push	{r7, lr}
 8001f9e:	af00      	add	r7, sp, #0
 8001fa0:	4808      	ldr	r0, [pc, #32]	; (8001fc4 <CMGS_ok+0x28>)
 8001fa2:	f7fe fc77 	bl	8000894 <xprintf>
 8001fa6:	4b08      	ldr	r3, [pc, #32]	; (8001fc8 <CMGS_ok+0x2c>)
 8001fa8:	4a08      	ldr	r2, [pc, #32]	; (8001fcc <CMGS_ok+0x30>)
 8001faa:	601a      	str	r2, [r3, #0]
 8001fac:	4b08      	ldr	r3, [pc, #32]	; (8001fd0 <CMGS_ok+0x34>)
 8001fae:	4a09      	ldr	r2, [pc, #36]	; (8001fd4 <CMGS_ok+0x38>)
 8001fb0:	601a      	str	r2, [r3, #0]
 8001fb2:	4b09      	ldr	r3, [pc, #36]	; (8001fd8 <CMGS_ok+0x3c>)
 8001fb4:	4a09      	ldr	r2, [pc, #36]	; (8001fdc <CMGS_ok+0x40>)
 8001fb6:	601a      	str	r2, [r3, #0]
 8001fb8:	4b09      	ldr	r3, [pc, #36]	; (8001fe0 <CMGS_ok+0x44>)
 8001fba:	2201      	movs	r2, #1
 8001fbc:	601a      	str	r2, [r3, #0]
 8001fbe:	bf00      	nop
 8001fc0:	bd80      	pop	{r7, pc}
 8001fc2:	bf00      	nop
 8001fc4:	08003740 	.word	0x08003740
 8001fc8:	20000014 	.word	0x20000014
 8001fcc:	08001b91 	.word	0x08001b91
 8001fd0:	20000018 	.word	0x20000018
 8001fd4:	08001c21 	.word	0x08001c21
 8001fd8:	2000001c 	.word	0x2000001c
 8001fdc:	08001c35 	.word	0x08001c35
 8001fe0:	20000d40 	.word	0x20000d40

08001fe4 <CMGS_resp>:
 8001fe4:	b580      	push	{r7, lr}
 8001fe6:	b082      	sub	sp, #8
 8001fe8:	af00      	add	r7, sp, #0
 8001fea:	6078      	str	r0, [r7, #4]
 8001fec:	6878      	ldr	r0, [r7, #4]
 8001fee:	f7ff fdcf 	bl	8001b90 <print_response>
 8001ff2:	2206      	movs	r2, #6
 8001ff4:	4909      	ldr	r1, [pc, #36]	; (800201c <CMGS_resp+0x38>)
 8001ff6:	480a      	ldr	r0, [pc, #40]	; (8002020 <CMGS_resp+0x3c>)
 8001ff8:	f7fe f89c 	bl	8000134 <strncmp>
 8001ffc:	4603      	mov	r3, r0
 8001ffe:	2b00      	cmp	r3, #0
 8002000:	d108      	bne.n	8002014 <CMGS_resp+0x30>
 8002002:	4b08      	ldr	r3, [pc, #32]	; (8002024 <CMGS_resp+0x40>)
 8002004:	4a08      	ldr	r2, [pc, #32]	; (8002028 <CMGS_resp+0x44>)
 8002006:	601a      	str	r2, [r3, #0]
 8002008:	4b08      	ldr	r3, [pc, #32]	; (800202c <CMGS_resp+0x48>)
 800200a:	4a09      	ldr	r2, [pc, #36]	; (8002030 <CMGS_resp+0x4c>)
 800200c:	601a      	str	r2, [r3, #0]
 800200e:	4b09      	ldr	r3, [pc, #36]	; (8002034 <CMGS_resp+0x50>)
 8002010:	4a09      	ldr	r2, [pc, #36]	; (8002038 <CMGS_resp+0x54>)
 8002012:	601a      	str	r2, [r3, #0]
 8002014:	bf00      	nop
 8002016:	3708      	adds	r7, #8
 8002018:	46bd      	mov	sp, r7
 800201a:	bd80      	pop	{r7, pc}
 800201c:	0800374c 	.word	0x0800374c
 8002020:	20000f70 	.word	0x20000f70
 8002024:	20000014 	.word	0x20000014
 8002028:	08001b91 	.word	0x08001b91
 800202c:	20000018 	.word	0x20000018
 8002030:	08001f9d 	.word	0x08001f9d
 8002034:	2000001c 	.word	0x2000001c
 8002038:	08001c35 	.word	0x08001c35

0800203c <send_sms_pdu>:
 800203c:	b580      	push	{r7, lr}
 800203e:	af00      	add	r7, sp, #0
 8002040:	480b      	ldr	r0, [pc, #44]	; (8002070 <send_sms_pdu+0x34>)
 8002042:	f7fe fc27 	bl	8000894 <xprintf>
 8002046:	480b      	ldr	r0, [pc, #44]	; (8002074 <send_sms_pdu+0x38>)
 8002048:	f7ff fe02 	bl	8001c50 <sim900_command>
 800204c:	480a      	ldr	r0, [pc, #40]	; (8002078 <send_sms_pdu+0x3c>)
 800204e:	f7ff fdff 	bl	8001c50 <sim900_command>
 8002052:	4b0a      	ldr	r3, [pc, #40]	; (800207c <send_sms_pdu+0x40>)
 8002054:	4a0a      	ldr	r2, [pc, #40]	; (8002080 <send_sms_pdu+0x44>)
 8002056:	601a      	str	r2, [r3, #0]
 8002058:	4b0a      	ldr	r3, [pc, #40]	; (8002084 <send_sms_pdu+0x48>)
 800205a:	4a0b      	ldr	r2, [pc, #44]	; (8002088 <send_sms_pdu+0x4c>)
 800205c:	601a      	str	r2, [r3, #0]
 800205e:	4b0b      	ldr	r3, [pc, #44]	; (800208c <send_sms_pdu+0x50>)
 8002060:	4a0b      	ldr	r2, [pc, #44]	; (8002090 <send_sms_pdu+0x54>)
 8002062:	601a      	str	r2, [r3, #0]
 8002064:	4b0b      	ldr	r3, [pc, #44]	; (8002094 <send_sms_pdu+0x58>)
 8002066:	4a0c      	ldr	r2, [pc, #48]	; (8002098 <send_sms_pdu+0x5c>)
 8002068:	601a      	str	r2, [r3, #0]
 800206a:	bf00      	nop
 800206c:	bd80      	pop	{r7, pc}
 800206e:	bf00      	nop
 8002070:	08003754 	.word	0x08003754
 8002074:	20000d60 	.word	0x20000d60
 8002078:	08003758 	.word	0x08003758
 800207c:	20000020 	.word	0x20000020
 8002080:	08001a85 	.word	0x08001a85
 8002084:	20000014 	.word	0x20000014
 8002088:	08001fe5 	.word	0x08001fe5
 800208c:	20000018 	.word	0x20000018
 8002090:	08001c21 	.word	0x08001c21
 8002094:	2000001c 	.word	0x2000001c
 8002098:	08001c35 	.word	0x08001c35

0800209c <sim900_send_sms_seq>:
 800209c:	b580      	push	{r7, lr}
 800209e:	b08a      	sub	sp, #40	; 0x28
 80020a0:	af00      	add	r7, sp, #0
 80020a2:	2300      	movs	r3, #0
 80020a4:	f887 3027 	strb.w	r3, [r7, #39]	; 0x27
 80020a8:	4b69      	ldr	r3, [pc, #420]	; (8002250 <sim900_send_sms_seq+0x1b4>)
 80020aa:	623b      	str	r3, [r7, #32]
 80020ac:	2300      	movs	r3, #0
 80020ae:	61fb      	str	r3, [r7, #28]
 80020b0:	4a68      	ldr	r2, [pc, #416]	; (8002254 <sim900_send_sms_seq+0x1b8>)
 80020b2:	1d3b      	adds	r3, r7, #4
 80020b4:	ca07      	ldmia	r2, {r0, r1, r2}
 80020b6:	c303      	stmia	r3!, {r0, r1}
 80020b8:	701a      	strb	r2, [r3, #0]
 80020ba:	f107 030d 	add.w	r3, r7, #13
 80020be:	2200      	movs	r2, #0
 80020c0:	601a      	str	r2, [r3, #0]
 80020c2:	f8c3 2003 	str.w	r2, [r3, #3]
 80020c6:	4b64      	ldr	r3, [pc, #400]	; (8002258 <sim900_send_sms_seq+0x1bc>)
 80020c8:	61bb      	str	r3, [r7, #24]
 80020ca:	69bb      	ldr	r3, [r7, #24]
 80020cc:	2b00      	cmp	r3, #0
 80020ce:	f000 80b7 	beq.w	8002240 <sim900_send_sms_seq+0x1a4>
 80020d2:	4b62      	ldr	r3, [pc, #392]	; (800225c <sim900_send_sms_seq+0x1c0>)
 80020d4:	781b      	ldrb	r3, [r3, #0]
 80020d6:	2b00      	cmp	r3, #0
 80020d8:	f000 80b2 	beq.w	8002240 <sim900_send_sms_seq+0x1a4>
 80020dc:	2300      	movs	r3, #0
 80020de:	f887 3027 	strb.w	r3, [r7, #39]	; 0x27
 80020e2:	4b5f      	ldr	r3, [pc, #380]	; (8002260 <sim900_send_sms_seq+0x1c4>)
 80020e4:	6819      	ldr	r1, [r3, #0]
 80020e6:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 80020ea:	69ba      	ldr	r2, [r7, #24]
 80020ec:	441a      	add	r2, r3
 80020ee:	2300      	movs	r3, #0
 80020f0:	485c      	ldr	r0, [pc, #368]	; (8002264 <sim900_send_sms_seq+0x1c8>)
 80020f2:	f7ff fdbd 	bl	8001c70 <encode_adress>
 80020f6:	4603      	mov	r3, r0
 80020f8:	b2da      	uxtb	r2, r3
 80020fa:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 80020fe:	4413      	add	r3, r2
 8002100:	f887 3027 	strb.w	r3, [r7, #39]	; 0x27
 8002104:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 8002108:	61fb      	str	r3, [r7, #28]
 800210a:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 800210e:	1c5a      	adds	r2, r3, #1
 8002110:	f887 2027 	strb.w	r2, [r7, #39]	; 0x27
 8002114:	461a      	mov	r2, r3
 8002116:	69bb      	ldr	r3, [r7, #24]
 8002118:	4413      	add	r3, r2
 800211a:	2230      	movs	r2, #48	; 0x30
 800211c:	701a      	strb	r2, [r3, #0]
 800211e:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 8002122:	1c5a      	adds	r2, r3, #1
 8002124:	f887 2027 	strb.w	r2, [r7, #39]	; 0x27
 8002128:	461a      	mov	r2, r3
 800212a:	69bb      	ldr	r3, [r7, #24]
 800212c:	4413      	add	r3, r2
 800212e:	2231      	movs	r2, #49	; 0x31
 8002130:	701a      	strb	r2, [r3, #0]
 8002132:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 8002136:	1c5a      	adds	r2, r3, #1
 8002138:	f887 2027 	strb.w	r2, [r7, #39]	; 0x27
 800213c:	461a      	mov	r2, r3
 800213e:	69bb      	ldr	r3, [r7, #24]
 8002140:	4413      	add	r3, r2
 8002142:	2230      	movs	r2, #48	; 0x30
 8002144:	701a      	strb	r2, [r3, #0]
 8002146:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 800214a:	1c5a      	adds	r2, r3, #1
 800214c:	f887 2027 	strb.w	r2, [r7, #39]	; 0x27
 8002150:	461a      	mov	r2, r3
 8002152:	69bb      	ldr	r3, [r7, #24]
 8002154:	4413      	add	r3, r2
 8002156:	2230      	movs	r2, #48	; 0x30
 8002158:	701a      	strb	r2, [r3, #0]
 800215a:	4b43      	ldr	r3, [pc, #268]	; (8002268 <sim900_send_sms_seq+0x1cc>)
 800215c:	6819      	ldr	r1, [r3, #0]
 800215e:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 8002162:	69ba      	ldr	r2, [r7, #24]
 8002164:	441a      	add	r2, r3
 8002166:	2301      	movs	r3, #1
 8002168:	4840      	ldr	r0, [pc, #256]	; (800226c <sim900_send_sms_seq+0x1d0>)
 800216a:	f7ff fd81 	bl	8001c70 <encode_adress>
 800216e:	4603      	mov	r3, r0
 8002170:	b2da      	uxtb	r2, r3
 8002172:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 8002176:	4413      	add	r3, r2
 8002178:	f887 3027 	strb.w	r3, [r7, #39]	; 0x27
 800217c:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 8002180:	1c5a      	adds	r2, r3, #1
 8002182:	f887 2027 	strb.w	r2, [r7, #39]	; 0x27
 8002186:	461a      	mov	r2, r3
 8002188:	69bb      	ldr	r3, [r7, #24]
 800218a:	4413      	add	r3, r2
 800218c:	2230      	movs	r2, #48	; 0x30
 800218e:	701a      	strb	r2, [r3, #0]
 8002190:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 8002194:	1c5a      	adds	r2, r3, #1
 8002196:	f887 2027 	strb.w	r2, [r7, #39]	; 0x27
 800219a:	461a      	mov	r2, r3
 800219c:	69bb      	ldr	r3, [r7, #24]
 800219e:	4413      	add	r3, r2
 80021a0:	2230      	movs	r2, #48	; 0x30
 80021a2:	701a      	strb	r2, [r3, #0]
 80021a4:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 80021a8:	69ba      	ldr	r2, [r7, #24]
 80021aa:	4413      	add	r3, r2
 80021ac:	2208      	movs	r2, #8
 80021ae:	4619      	mov	r1, r3
 80021b0:	6a38      	ldr	r0, [r7, #32]
 80021b2:	f7ff fe45 	bl	8001e40 <encode_message>
 80021b6:	4603      	mov	r3, r0
 80021b8:	b2da      	uxtb	r2, r3
 80021ba:	f897 3027 	ldrb.w	r3, [r7, #39]	; 0x27
 80021be:	4413      	add	r3, r2
 80021c0:	f887 3027 	strb.w	r3, [r7, #39]	; 0x27
 80021c4:	f897 2027 	ldrb.w	r2, [r7, #39]	; 0x27
 80021c8:	69fb      	ldr	r3, [r7, #28]
 80021ca:	1ad3      	subs	r3, r2, r3
 80021cc:	085b      	lsrs	r3, r3, #1
 80021ce:	61fb      	str	r3, [r7, #28]
 80021d0:	69fa      	ldr	r2, [r7, #28]
 80021d2:	69b9      	ldr	r1, [r7, #24]
 80021d4:	4826      	ldr	r0, [pc, #152]	; (8002270 <sim900_send_sms_seq+0x1d4>)
 80021d6:	f7fe fb5d 	bl	8000894 <xprintf>
 80021da:	2308      	movs	r3, #8
 80021dc:	617b      	str	r3, [r7, #20]
 80021de:	1d3a      	adds	r2, r7, #4
 80021e0:	697b      	ldr	r3, [r7, #20]
 80021e2:	4413      	add	r3, r2
 80021e4:	69f9      	ldr	r1, [r7, #28]
 80021e6:	4618      	mov	r0, r3
 80021e8:	f7fd ffdc 	bl	80001a4 <itoa>
 80021ec:	4603      	mov	r3, r0
 80021ee:	461a      	mov	r2, r3
 80021f0:	697b      	ldr	r3, [r7, #20]
 80021f2:	4413      	add	r3, r2
 80021f4:	617b      	str	r3, [r7, #20]
 80021f6:	697b      	ldr	r3, [r7, #20]
 80021f8:	2b0f      	cmp	r3, #15
 80021fa:	d80d      	bhi.n	8002218 <sim900_send_sms_seq+0x17c>
 80021fc:	697b      	ldr	r3, [r7, #20]
 80021fe:	1c5a      	adds	r2, r3, #1
 8002200:	617a      	str	r2, [r7, #20]
 8002202:	f107 0228 	add.w	r2, r7, #40	; 0x28
 8002206:	4413      	add	r3, r2
 8002208:	220d      	movs	r2, #13
 800220a:	f803 2c24 	strb.w	r2, [r3, #-36]
 800220e:	1d3a      	adds	r2, r7, #4
 8002210:	697b      	ldr	r3, [r7, #20]
 8002212:	4413      	add	r3, r2
 8002214:	2200      	movs	r2, #0
 8002216:	701a      	strb	r2, [r3, #0]
 8002218:	1d3b      	adds	r3, r7, #4
 800221a:	4618      	mov	r0, r3
 800221c:	f7ff fd18 	bl	8001c50 <sim900_command>
 8002220:	4b14      	ldr	r3, [pc, #80]	; (8002274 <sim900_send_sms_seq+0x1d8>)
 8002222:	4a15      	ldr	r2, [pc, #84]	; (8002278 <sim900_send_sms_seq+0x1dc>)
 8002224:	601a      	str	r2, [r3, #0]
 8002226:	4b15      	ldr	r3, [pc, #84]	; (800227c <sim900_send_sms_seq+0x1e0>)
 8002228:	4a15      	ldr	r2, [pc, #84]	; (8002280 <sim900_send_sms_seq+0x1e4>)
 800222a:	601a      	str	r2, [r3, #0]
 800222c:	4b15      	ldr	r3, [pc, #84]	; (8002284 <sim900_send_sms_seq+0x1e8>)
 800222e:	4a16      	ldr	r2, [pc, #88]	; (8002288 <sim900_send_sms_seq+0x1ec>)
 8002230:	601a      	str	r2, [r3, #0]
 8002232:	4b16      	ldr	r3, [pc, #88]	; (800228c <sim900_send_sms_seq+0x1f0>)
 8002234:	4a16      	ldr	r2, [pc, #88]	; (8002290 <sim900_send_sms_seq+0x1f4>)
 8002236:	601a      	str	r2, [r3, #0]
 8002238:	4b16      	ldr	r3, [pc, #88]	; (8002294 <sim900_send_sms_seq+0x1f8>)
 800223a:	2200      	movs	r2, #0
 800223c:	601a      	str	r2, [r3, #0]
 800223e:	e002      	b.n	8002246 <sim900_send_sms_seq+0x1aa>
 8002240:	4815      	ldr	r0, [pc, #84]	; (8002298 <sim900_send_sms_seq+0x1fc>)
 8002242:	f7fe fb27 	bl	8000894 <xprintf>
 8002246:	bf00      	nop
 8002248:	3728      	adds	r7, #40	; 0x28
 800224a:	46bd      	mov	sp, r7
 800224c:	bd80      	pop	{r7, pc}
 800224e:	bf00      	nop
 8002250:	20000e60 	.word	0x20000e60
 8002254:	08003780 	.word	0x08003780
 8002258:	20000d60 	.word	0x20000d60
 800225c:	20000f60 	.word	0x20000f60
 8002260:	20000d5c 	.word	0x20000d5c
 8002264:	20000d4d 	.word	0x20000d4d
 8002268:	20000010 	.word	0x20000010
 800226c:	20000f61 	.word	0x20000f61
 8002270:	0800375c 	.word	0x0800375c
 8002274:	20000020 	.word	0x20000020
 8002278:	0800203d 	.word	0x0800203d
 800227c:	20000014 	.word	0x20000014
 8002280:	08001b91 	.word	0x08001b91
 8002284:	20000018 	.word	0x20000018
 8002288:	08001c21 	.word	0x08001c21
 800228c:	2000001c 	.word	0x2000001c
 8002290:	08001c35 	.word	0x08001c35
 8002294:	20000d40 	.word	0x20000d40
 8002298:	08003764 	.word	0x08003764

0800229c <decode_adress>:
 800229c:	b580      	push	{r7, lr}
 800229e:	b086      	sub	sp, #24
 80022a0:	af00      	add	r7, sp, #0
 80022a2:	6078      	str	r0, [r7, #4]
 80022a4:	6039      	str	r1, [r7, #0]
 80022a6:	2102      	movs	r1, #2
 80022a8:	6878      	ldr	r0, [r7, #4]
 80022aa:	f7fe f859 	bl	8000360 <hextob>
 80022ae:	60f8      	str	r0, [r7, #12]
 80022b0:	687b      	ldr	r3, [r7, #4]
 80022b2:	3302      	adds	r3, #2
 80022b4:	607b      	str	r3, [r7, #4]
 80022b6:	2102      	movs	r1, #2
 80022b8:	6878      	ldr	r0, [r7, #4]
 80022ba:	f7fe f851 	bl	8000360 <hextob>
 80022be:	4603      	mov	r3, r0
 80022c0:	72fb      	strb	r3, [r7, #11]
 80022c2:	687b      	ldr	r3, [r7, #4]
 80022c4:	3302      	adds	r3, #2
 80022c6:	607b      	str	r3, [r7, #4]
 80022c8:	7afb      	ldrb	r3, [r7, #11]
 80022ca:	2b91      	cmp	r3, #145	; 0x91
 80022cc:	d004      	beq.n	80022d8 <decode_adress+0x3c>
 80022ce:	683b      	ldr	r3, [r7, #0]
 80022d0:	2200      	movs	r2, #0
 80022d2:	701a      	strb	r2, [r3, #0]
 80022d4:	2300      	movs	r3, #0
 80022d6:	e033      	b.n	8002340 <decode_adress+0xa4>
 80022d8:	683b      	ldr	r3, [r7, #0]
 80022da:	3301      	adds	r3, #1
 80022dc:	603b      	str	r3, [r7, #0]
 80022de:	2301      	movs	r3, #1
 80022e0:	613b      	str	r3, [r7, #16]
 80022e2:	2300      	movs	r3, #0
 80022e4:	617b      	str	r3, [r7, #20]
 80022e6:	e010      	b.n	800230a <decode_adress+0x6e>
 80022e8:	697b      	ldr	r3, [r7, #20]
 80022ea:	683a      	ldr	r2, [r7, #0]
 80022ec:	4413      	add	r3, r2
 80022ee:	6979      	ldr	r1, [r7, #20]
 80022f0:	693a      	ldr	r2, [r7, #16]
 80022f2:	440a      	add	r2, r1
 80022f4:	4611      	mov	r1, r2
 80022f6:	687a      	ldr	r2, [r7, #4]
 80022f8:	440a      	add	r2, r1
 80022fa:	7812      	ldrb	r2, [r2, #0]
 80022fc:	701a      	strb	r2, [r3, #0]
 80022fe:	693b      	ldr	r3, [r7, #16]
 8002300:	425b      	negs	r3, r3
 8002302:	613b      	str	r3, [r7, #16]
 8002304:	697b      	ldr	r3, [r7, #20]
 8002306:	3301      	adds	r3, #1
 8002308:	617b      	str	r3, [r7, #20]
 800230a:	68fb      	ldr	r3, [r7, #12]
 800230c:	f003 0201 	and.w	r2, r3, #1
 8002310:	68fb      	ldr	r3, [r7, #12]
 8002312:	441a      	add	r2, r3
 8002314:	697b      	ldr	r3, [r7, #20]
 8002316:	429a      	cmp	r2, r3
 8002318:	dce6      	bgt.n	80022e8 <decode_adress+0x4c>
 800231a:	68fb      	ldr	r3, [r7, #12]
 800231c:	f003 0301 	and.w	r3, r3, #1
 8002320:	2b00      	cmp	r3, #0
 8002322:	d003      	beq.n	800232c <decode_adress+0x90>
 8002324:	697b      	ldr	r3, [r7, #20]
 8002326:	1e5a      	subs	r2, r3, #1
 8002328:	617a      	str	r2, [r7, #20]
 800232a:	2b00      	cmp	r3, #0
 800232c:	683b      	ldr	r3, [r7, #0]
 800232e:	3b01      	subs	r3, #1
 8002330:	222b      	movs	r2, #43	; 0x2b
 8002332:	701a      	strb	r2, [r3, #0]
 8002334:	697b      	ldr	r3, [r7, #20]
 8002336:	683a      	ldr	r2, [r7, #0]
 8002338:	4413      	add	r3, r2
 800233a:	2200      	movs	r2, #0
 800233c:	701a      	strb	r2, [r3, #0]
 800233e:	697b      	ldr	r3, [r7, #20]
 8002340:	4618      	mov	r0, r3
 8002342:	3718      	adds	r7, #24
 8002344:	46bd      	mov	sp, r7
 8002346:	bd80      	pop	{r7, pc}

08002348 <decompress_7bit>:
 8002348:	b480      	push	{r7}
 800234a:	b089      	sub	sp, #36	; 0x24
 800234c:	af00      	add	r7, sp, #0
 800234e:	60f8      	str	r0, [r7, #12]
 8002350:	60b9      	str	r1, [r7, #8]
 8002352:	607a      	str	r2, [r7, #4]
 8002354:	687a      	ldr	r2, [r7, #4]
 8002356:	4613      	mov	r3, r2
 8002358:	00db      	lsls	r3, r3, #3
 800235a:	1a9b      	subs	r3, r3, r2
 800235c:	617b      	str	r3, [r7, #20]
 800235e:	697b      	ldr	r3, [r7, #20]
 8002360:	f003 0307 	and.w	r3, r3, #7
 8002364:	613b      	str	r3, [r7, #16]
 8002366:	697b      	ldr	r3, [r7, #20]
 8002368:	10db      	asrs	r3, r3, #3
 800236a:	617b      	str	r3, [r7, #20]
 800236c:	693b      	ldr	r3, [r7, #16]
 800236e:	2b00      	cmp	r3, #0
 8002370:	d002      	beq.n	8002378 <decompress_7bit+0x30>
 8002372:	697b      	ldr	r3, [r7, #20]
 8002374:	3301      	adds	r3, #1
 8002376:	617b      	str	r3, [r7, #20]
 8002378:	693b      	ldr	r3, [r7, #16]
 800237a:	f1c3 0307 	rsb	r3, r3, #7
 800237e:	613b      	str	r3, [r7, #16]
 8002380:	697b      	ldr	r3, [r7, #20]
 8002382:	3b01      	subs	r3, #1
 8002384:	61fb      	str	r3, [r7, #28]
 8002386:	687b      	ldr	r3, [r7, #4]
 8002388:	3b01      	subs	r3, #1
 800238a:	61bb      	str	r3, [r7, #24]
 800238c:	687b      	ldr	r3, [r7, #4]
 800238e:	68fa      	ldr	r2, [r7, #12]
 8002390:	4413      	add	r3, r2
 8002392:	2200      	movs	r2, #0
 8002394:	701a      	strb	r2, [r3, #0]
 8002396:	e066      	b.n	8002466 <decompress_7bit+0x11e>
 8002398:	693b      	ldr	r3, [r7, #16]
 800239a:	2b00      	cmp	r3, #0
 800239c:	d114      	bne.n	80023c8 <decompress_7bit+0x80>
 800239e:	69bb      	ldr	r3, [r7, #24]
 80023a0:	68fa      	ldr	r2, [r7, #12]
 80023a2:	4413      	add	r3, r2
 80023a4:	69fa      	ldr	r2, [r7, #28]
 80023a6:	68b9      	ldr	r1, [r7, #8]
 80023a8:	440a      	add	r2, r1
 80023aa:	7812      	ldrb	r2, [r2, #0]
 80023ac:	f002 027f 	and.w	r2, r2, #127	; 0x7f
 80023b0:	b2d2      	uxtb	r2, r2
 80023b2:	701a      	strb	r2, [r3, #0]
 80023b4:	69fb      	ldr	r3, [r7, #28]
 80023b6:	3b01      	subs	r3, #1
 80023b8:	61fb      	str	r3, [r7, #28]
 80023ba:	69bb      	ldr	r3, [r7, #24]
 80023bc:	3b01      	subs	r3, #1
 80023be:	61bb      	str	r3, [r7, #24]
 80023c0:	693b      	ldr	r3, [r7, #16]
 80023c2:	3b01      	subs	r3, #1
 80023c4:	613b      	str	r3, [r7, #16]
 80023c6:	e04e      	b.n	8002466 <decompress_7bit+0x11e>
 80023c8:	693b      	ldr	r3, [r7, #16]
 80023ca:	f1b3 3fff 	cmp.w	r3, #4294967295
 80023ce:	d10f      	bne.n	80023f0 <decompress_7bit+0xa8>
 80023d0:	69bb      	ldr	r3, [r7, #24]
 80023d2:	68fa      	ldr	r2, [r7, #12]
 80023d4:	4413      	add	r3, r2
 80023d6:	69fa      	ldr	r2, [r7, #28]
 80023d8:	68b9      	ldr	r1, [r7, #8]
 80023da:	440a      	add	r2, r1
 80023dc:	7812      	ldrb	r2, [r2, #0]
 80023de:	0852      	lsrs	r2, r2, #1
 80023e0:	b2d2      	uxtb	r2, r2
 80023e2:	701a      	strb	r2, [r3, #0]
 80023e4:	2306      	movs	r3, #6
 80023e6:	613b      	str	r3, [r7, #16]
 80023e8:	69bb      	ldr	r3, [r7, #24]
 80023ea:	3b01      	subs	r3, #1
 80023ec:	61bb      	str	r3, [r7, #24]
 80023ee:	e03a      	b.n	8002466 <decompress_7bit+0x11e>
 80023f0:	69bb      	ldr	r3, [r7, #24]
 80023f2:	68fa      	ldr	r2, [r7, #12]
 80023f4:	4413      	add	r3, r2
 80023f6:	69fa      	ldr	r2, [r7, #28]
 80023f8:	68b9      	ldr	r1, [r7, #8]
 80023fa:	440a      	add	r2, r1
 80023fc:	7812      	ldrb	r2, [r2, #0]
 80023fe:	4611      	mov	r1, r2
 8002400:	693a      	ldr	r2, [r7, #16]
 8002402:	fa01 f202 	lsl.w	r2, r1, r2
 8002406:	b2d2      	uxtb	r2, r2
 8002408:	701a      	strb	r2, [r3, #0]
 800240a:	69fb      	ldr	r3, [r7, #28]
 800240c:	3b01      	subs	r3, #1
 800240e:	61fb      	str	r3, [r7, #28]
 8002410:	69fb      	ldr	r3, [r7, #28]
 8002412:	2b00      	cmp	r3, #0
 8002414:	db16      	blt.n	8002444 <decompress_7bit+0xfc>
 8002416:	69bb      	ldr	r3, [r7, #24]
 8002418:	68fa      	ldr	r2, [r7, #12]
 800241a:	4413      	add	r3, r2
 800241c:	69ba      	ldr	r2, [r7, #24]
 800241e:	68f9      	ldr	r1, [r7, #12]
 8002420:	440a      	add	r2, r1
 8002422:	7812      	ldrb	r2, [r2, #0]
 8002424:	b251      	sxtb	r1, r2
 8002426:	69fa      	ldr	r2, [r7, #28]
 8002428:	68b8      	ldr	r0, [r7, #8]
 800242a:	4402      	add	r2, r0
 800242c:	7812      	ldrb	r2, [r2, #0]
 800242e:	4610      	mov	r0, r2
 8002430:	693a      	ldr	r2, [r7, #16]
 8002432:	f1c2 0208 	rsb	r2, r2, #8
 8002436:	fa40 f202 	asr.w	r2, r0, r2
 800243a:	b252      	sxtb	r2, r2
 800243c:	430a      	orrs	r2, r1
 800243e:	b252      	sxtb	r2, r2
 8002440:	b2d2      	uxtb	r2, r2
 8002442:	701a      	strb	r2, [r3, #0]
 8002444:	69bb      	ldr	r3, [r7, #24]
 8002446:	68fa      	ldr	r2, [r7, #12]
 8002448:	4413      	add	r3, r2
 800244a:	69ba      	ldr	r2, [r7, #24]
 800244c:	68f9      	ldr	r1, [r7, #12]
 800244e:	440a      	add	r2, r1
 8002450:	7812      	ldrb	r2, [r2, #0]
 8002452:	f002 027f 	and.w	r2, r2, #127	; 0x7f
 8002456:	b2d2      	uxtb	r2, r2
 8002458:	701a      	strb	r2, [r3, #0]
 800245a:	693b      	ldr	r3, [r7, #16]
 800245c:	3b01      	subs	r3, #1
 800245e:	613b      	str	r3, [r7, #16]
 8002460:	69bb      	ldr	r3, [r7, #24]
 8002462:	3b01      	subs	r3, #1
 8002464:	61bb      	str	r3, [r7, #24]
 8002466:	69bb      	ldr	r3, [r7, #24]
 8002468:	2b00      	cmp	r3, #0
 800246a:	da95      	bge.n	8002398 <decompress_7bit+0x50>
 800246c:	2301      	movs	r3, #1
 800246e:	4618      	mov	r0, r3
 8002470:	3724      	adds	r7, #36	; 0x24
 8002472:	46bd      	mov	sp, r7
 8002474:	bc80      	pop	{r7}
 8002476:	4770      	bx	lr

08002478 <pdu_decode>:
 8002478:	b590      	push	{r4, r7, lr}
 800247a:	b08b      	sub	sp, #44	; 0x2c
 800247c:	af00      	add	r7, sp, #0
 800247e:	60f8      	str	r0, [r7, #12]
 8002480:	60b9      	str	r1, [r7, #8]
 8002482:	4613      	mov	r3, r2
 8002484:	71fb      	strb	r3, [r7, #7]
 8002486:	2300      	movs	r3, #0
 8002488:	627b      	str	r3, [r7, #36]	; 0x24
 800248a:	2102      	movs	r1, #2
 800248c:	68b8      	ldr	r0, [r7, #8]
 800248e:	f7fd ff67 	bl	8000360 <hextob>
 8002492:	61f8      	str	r0, [r7, #28]
 8002494:	79fb      	ldrb	r3, [r7, #7]
 8002496:	2b00      	cmp	r3, #0
 8002498:	d13b      	bne.n	8002512 <pdu_decode+0x9a>
 800249a:	69fa      	ldr	r2, [r7, #28]
 800249c:	4613      	mov	r3, r2
 800249e:	00db      	lsls	r3, r3, #3
 80024a0:	1a9b      	subs	r3, r3, r2
 80024a2:	623b      	str	r3, [r7, #32]
 80024a4:	6a3b      	ldr	r3, [r7, #32]
 80024a6:	f003 0307 	and.w	r3, r3, #7
 80024aa:	61bb      	str	r3, [r7, #24]
 80024ac:	6a3b      	ldr	r3, [r7, #32]
 80024ae:	10db      	asrs	r3, r3, #3
 80024b0:	623b      	str	r3, [r7, #32]
 80024b2:	69bb      	ldr	r3, [r7, #24]
 80024b4:	2b00      	cmp	r3, #0
 80024b6:	d003      	beq.n	80024c0 <pdu_decode+0x48>
 80024b8:	6a3b      	ldr	r3, [r7, #32]
 80024ba:	1c5a      	adds	r2, r3, #1
 80024bc:	623a      	str	r2, [r7, #32]
 80024be:	2b00      	cmp	r3, #0
 80024c0:	69fb      	ldr	r3, [r7, #28]
 80024c2:	2b8c      	cmp	r3, #140	; 0x8c
 80024c4:	dd01      	ble.n	80024ca <pdu_decode+0x52>
 80024c6:	2300      	movs	r3, #0
 80024c8:	e050      	b.n	800256c <pdu_decode+0xf4>
 80024ca:	2300      	movs	r3, #0
 80024cc:	627b      	str	r3, [r7, #36]	; 0x24
 80024ce:	e011      	b.n	80024f4 <pdu_decode+0x7c>
 80024d0:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80024d2:	68fa      	ldr	r2, [r7, #12]
 80024d4:	18d4      	adds	r4, r2, r3
 80024d6:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80024d8:	005b      	lsls	r3, r3, #1
 80024da:	3302      	adds	r3, #2
 80024dc:	68ba      	ldr	r2, [r7, #8]
 80024de:	4413      	add	r3, r2
 80024e0:	2102      	movs	r1, #2
 80024e2:	4618      	mov	r0, r3
 80024e4:	f7fd ff3c 	bl	8000360 <hextob>
 80024e8:	4603      	mov	r3, r0
 80024ea:	b2db      	uxtb	r3, r3
 80024ec:	7023      	strb	r3, [r4, #0]
 80024ee:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80024f0:	3301      	adds	r3, #1
 80024f2:	627b      	str	r3, [r7, #36]	; 0x24
 80024f4:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 80024f6:	6a3b      	ldr	r3, [r7, #32]
 80024f8:	429a      	cmp	r2, r3
 80024fa:	dbe9      	blt.n	80024d0 <pdu_decode+0x58>
 80024fc:	69fa      	ldr	r2, [r7, #28]
 80024fe:	68f9      	ldr	r1, [r7, #12]
 8002500:	68f8      	ldr	r0, [r7, #12]
 8002502:	f7ff ff21 	bl	8002348 <decompress_7bit>
 8002506:	69fb      	ldr	r3, [r7, #28]
 8002508:	68fa      	ldr	r2, [r7, #12]
 800250a:	4413      	add	r3, r2
 800250c:	2200      	movs	r2, #0
 800250e:	701a      	strb	r2, [r3, #0]
 8002510:	e02b      	b.n	800256a <pdu_decode+0xf2>
 8002512:	79fb      	ldrb	r3, [r7, #7]
 8002514:	2b08      	cmp	r3, #8
 8002516:	d123      	bne.n	8002560 <pdu_decode+0xe8>
 8002518:	69fb      	ldr	r3, [r7, #28]
 800251a:	105b      	asrs	r3, r3, #1
 800251c:	617b      	str	r3, [r7, #20]
 800251e:	68bb      	ldr	r3, [r7, #8]
 8002520:	3302      	adds	r3, #2
 8002522:	60bb      	str	r3, [r7, #8]
 8002524:	2300      	movs	r3, #0
 8002526:	627b      	str	r3, [r7, #36]	; 0x24
 8002528:	e012      	b.n	8002550 <pdu_decode+0xd8>
 800252a:	2104      	movs	r1, #4
 800252c:	68b8      	ldr	r0, [r7, #8]
 800252e:	f7fd ff17 	bl	8000360 <hextob>
 8002532:	4603      	mov	r3, r0
 8002534:	827b      	strh	r3, [r7, #18]
 8002536:	68bb      	ldr	r3, [r7, #8]
 8002538:	3304      	adds	r3, #4
 800253a:	60bb      	str	r3, [r7, #8]
 800253c:	8a7b      	ldrh	r3, [r7, #18]
 800253e:	68f9      	ldr	r1, [r7, #12]
 8002540:	4618      	mov	r0, r3
 8002542:	f7fd ff65 	bl	8000410 <unc_to_utf>
 8002546:	4603      	mov	r3, r0
 8002548:	60fb      	str	r3, [r7, #12]
 800254a:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800254c:	3301      	adds	r3, #1
 800254e:	627b      	str	r3, [r7, #36]	; 0x24
 8002550:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 8002552:	697b      	ldr	r3, [r7, #20]
 8002554:	429a      	cmp	r2, r3
 8002556:	dbe8      	blt.n	800252a <pdu_decode+0xb2>
 8002558:	68fb      	ldr	r3, [r7, #12]
 800255a:	2200      	movs	r2, #0
 800255c:	701a      	strb	r2, [r3, #0]
 800255e:	e004      	b.n	800256a <pdu_decode+0xf2>
 8002560:	68fb      	ldr	r3, [r7, #12]
 8002562:	2200      	movs	r2, #0
 8002564:	701a      	strb	r2, [r3, #0]
 8002566:	2300      	movs	r3, #0
 8002568:	e000      	b.n	800256c <pdu_decode+0xf4>
 800256a:	2301      	movs	r3, #1
 800256c:	4618      	mov	r0, r3
 800256e:	372c      	adds	r7, #44	; 0x2c
 8002570:	46bd      	mov	sp, r7
 8002572:	bd90      	pop	{r4, r7, pc}

08002574 <print_pdu>:
 8002574:	b580      	push	{r7, lr}
 8002576:	b086      	sub	sp, #24
 8002578:	af00      	add	r7, sp, #0
 800257a:	6078      	str	r0, [r7, #4]
 800257c:	4b2e      	ldr	r3, [pc, #184]	; (8002638 <print_pdu+0xc4>)
 800257e:	617b      	str	r3, [r7, #20]
 8002580:	6878      	ldr	r0, [r7, #4]
 8002582:	f7ff fb05 	bl	8001b90 <print_response>
 8002586:	4b2d      	ldr	r3, [pc, #180]	; (800263c <print_pdu+0xc8>)
 8002588:	613b      	str	r3, [r7, #16]
 800258a:	2102      	movs	r1, #2
 800258c:	6938      	ldr	r0, [r7, #16]
 800258e:	f7fd fee7 	bl	8000360 <hextob>
 8002592:	4603      	mov	r3, r0
 8002594:	005b      	lsls	r3, r3, #1
 8002596:	3304      	adds	r3, #4
 8002598:	461a      	mov	r2, r3
 800259a:	693b      	ldr	r3, [r7, #16]
 800259c:	4413      	add	r3, r2
 800259e:	613b      	str	r3, [r7, #16]
 80025a0:	4927      	ldr	r1, [pc, #156]	; (8002640 <print_pdu+0xcc>)
 80025a2:	6938      	ldr	r0, [r7, #16]
 80025a4:	f7ff fe7a 	bl	800229c <decode_adress>
 80025a8:	2102      	movs	r1, #2
 80025aa:	6938      	ldr	r0, [r7, #16]
 80025ac:	f7fd fed8 	bl	8000360 <hextob>
 80025b0:	4603      	mov	r3, r0
 80025b2:	73fb      	strb	r3, [r7, #15]
 80025b4:	7bfb      	ldrb	r3, [r7, #15]
 80025b6:	1c9a      	adds	r2, r3, #2
 80025b8:	7bfb      	ldrb	r3, [r7, #15]
 80025ba:	f003 0301 	and.w	r3, r3, #1
 80025be:	4413      	add	r3, r2
 80025c0:	3304      	adds	r3, #4
 80025c2:	693a      	ldr	r2, [r7, #16]
 80025c4:	4413      	add	r3, r2
 80025c6:	613b      	str	r3, [r7, #16]
 80025c8:	2102      	movs	r1, #2
 80025ca:	6938      	ldr	r0, [r7, #16]
 80025cc:	f7fd fec8 	bl	8000360 <hextob>
 80025d0:	4603      	mov	r3, r0
 80025d2:	73bb      	strb	r3, [r7, #14]
 80025d4:	693b      	ldr	r3, [r7, #16]
 80025d6:	3302      	adds	r3, #2
 80025d8:	613b      	str	r3, [r7, #16]
 80025da:	693b      	ldr	r3, [r7, #16]
 80025dc:	330e      	adds	r3, #14
 80025de:	613b      	str	r3, [r7, #16]
 80025e0:	2102      	movs	r1, #2
 80025e2:	6938      	ldr	r0, [r7, #16]
 80025e4:	f7fd febc 	bl	8000360 <hextob>
 80025e8:	4603      	mov	r3, r0
 80025ea:	005b      	lsls	r3, r3, #1
 80025ec:	3302      	adds	r3, #2
 80025ee:	693a      	ldr	r2, [r7, #16]
 80025f0:	4413      	add	r3, r2
 80025f2:	2200      	movs	r2, #0
 80025f4:	701a      	strb	r2, [r3, #0]
 80025f6:	7bbb      	ldrb	r3, [r7, #14]
 80025f8:	461a      	mov	r2, r3
 80025fa:	6939      	ldr	r1, [r7, #16]
 80025fc:	6978      	ldr	r0, [r7, #20]
 80025fe:	f7ff ff3b 	bl	8002478 <pdu_decode>
 8002602:	490f      	ldr	r1, [pc, #60]	; (8002640 <print_pdu+0xcc>)
 8002604:	480f      	ldr	r0, [pc, #60]	; (8002644 <print_pdu+0xd0>)
 8002606:	f7fe f945 	bl	8000894 <xprintf>
 800260a:	6979      	ldr	r1, [r7, #20]
 800260c:	480d      	ldr	r0, [pc, #52]	; (8002644 <print_pdu+0xd0>)
 800260e:	f7fe f941 	bl	8000894 <xprintf>
 8002612:	4b0d      	ldr	r3, [pc, #52]	; (8002648 <print_pdu+0xd4>)
 8002614:	4a0d      	ldr	r2, [pc, #52]	; (800264c <print_pdu+0xd8>)
 8002616:	601a      	str	r2, [r3, #0]
 8002618:	4b0d      	ldr	r3, [pc, #52]	; (8002650 <print_pdu+0xdc>)
 800261a:	4a0e      	ldr	r2, [pc, #56]	; (8002654 <print_pdu+0xe0>)
 800261c:	601a      	str	r2, [r3, #0]
 800261e:	4b0e      	ldr	r3, [pc, #56]	; (8002658 <print_pdu+0xe4>)
 8002620:	4a0e      	ldr	r2, [pc, #56]	; (800265c <print_pdu+0xe8>)
 8002622:	601a      	str	r2, [r3, #0]
 8002624:	4b0e      	ldr	r3, [pc, #56]	; (8002660 <print_pdu+0xec>)
 8002626:	2201      	movs	r2, #1
 8002628:	601a      	str	r2, [r3, #0]
 800262a:	4b0e      	ldr	r3, [pc, #56]	; (8002664 <print_pdu+0xf0>)
 800262c:	2201      	movs	r2, #1
 800262e:	601a      	str	r2, [r3, #0]
 8002630:	bf00      	nop
 8002632:	3718      	adds	r7, #24
 8002634:	46bd      	mov	sp, r7
 8002636:	bd80      	pop	{r7, pc}
 8002638:	20000e60 	.word	0x20000e60
 800263c:	20000f70 	.word	0x20000f70
 8002640:	20000f60 	.word	0x20000f60
 8002644:	08003790 	.word	0x08003790
 8002648:	20000014 	.word	0x20000014
 800264c:	08001b91 	.word	0x08001b91
 8002650:	20000018 	.word	0x20000018
 8002654:	08001c21 	.word	0x08001c21
 8002658:	2000001c 	.word	0x2000001c
 800265c:	08001c35 	.word	0x08001c35
 8002660:	20000d40 	.word	0x20000d40
 8002664:	20000d48 	.word	0x20000d48

08002668 <check_CMT>:
 8002668:	b580      	push	{r7, lr}
 800266a:	b082      	sub	sp, #8
 800266c:	af00      	add	r7, sp, #0
 800266e:	6078      	str	r0, [r7, #4]
 8002670:	6878      	ldr	r0, [r7, #4]
 8002672:	f7ff fa8d 	bl	8001b90 <print_response>
 8002676:	2204      	movs	r2, #4
 8002678:	490b      	ldr	r1, [pc, #44]	; (80026a8 <check_CMT+0x40>)
 800267a:	480c      	ldr	r0, [pc, #48]	; (80026ac <check_CMT+0x44>)
 800267c:	f7fd fd5a 	bl	8000134 <strncmp>
 8002680:	4603      	mov	r3, r0
 8002682:	2b00      	cmp	r3, #0
 8002684:	d10b      	bne.n	800269e <check_CMT+0x36>
 8002686:	4b0a      	ldr	r3, [pc, #40]	; (80026b0 <check_CMT+0x48>)
 8002688:	4a0a      	ldr	r2, [pc, #40]	; (80026b4 <check_CMT+0x4c>)
 800268a:	601a      	str	r2, [r3, #0]
 800268c:	4b0a      	ldr	r3, [pc, #40]	; (80026b8 <check_CMT+0x50>)
 800268e:	4a0b      	ldr	r2, [pc, #44]	; (80026bc <check_CMT+0x54>)
 8002690:	601a      	str	r2, [r3, #0]
 8002692:	4b0b      	ldr	r3, [pc, #44]	; (80026c0 <check_CMT+0x58>)
 8002694:	4a0b      	ldr	r2, [pc, #44]	; (80026c4 <check_CMT+0x5c>)
 8002696:	601a      	str	r2, [r3, #0]
 8002698:	4b0b      	ldr	r3, [pc, #44]	; (80026c8 <check_CMT+0x60>)
 800269a:	2200      	movs	r2, #0
 800269c:	601a      	str	r2, [r3, #0]
 800269e:	bf00      	nop
 80026a0:	3708      	adds	r7, #8
 80026a2:	46bd      	mov	sp, r7
 80026a4:	bd80      	pop	{r7, pc}
 80026a6:	bf00      	nop
 80026a8:	08003794 	.word	0x08003794
 80026ac:	20000f70 	.word	0x20000f70
 80026b0:	20000014 	.word	0x20000014
 80026b4:	08002575 	.word	0x08002575
 80026b8:	20000018 	.word	0x20000018
 80026bc:	08001c21 	.word	0x08001c21
 80026c0:	2000001c 	.word	0x2000001c
 80026c4:	08001c35 	.word	0x08001c35
 80026c8:	20000d40 	.word	0x20000d40

080026cc <wait_SMSC_OK>:
 80026cc:	b580      	push	{r7, lr}
 80026ce:	af00      	add	r7, sp, #0
 80026d0:	4808      	ldr	r0, [pc, #32]	; (80026f4 <wait_SMSC_OK+0x28>)
 80026d2:	f7fe f8df 	bl	8000894 <xprintf>
 80026d6:	4b08      	ldr	r3, [pc, #32]	; (80026f8 <wait_SMSC_OK+0x2c>)
 80026d8:	4a08      	ldr	r2, [pc, #32]	; (80026fc <wait_SMSC_OK+0x30>)
 80026da:	601a      	str	r2, [r3, #0]
 80026dc:	4b08      	ldr	r3, [pc, #32]	; (8002700 <wait_SMSC_OK+0x34>)
 80026de:	4a09      	ldr	r2, [pc, #36]	; (8002704 <wait_SMSC_OK+0x38>)
 80026e0:	601a      	str	r2, [r3, #0]
 80026e2:	4b09      	ldr	r3, [pc, #36]	; (8002708 <wait_SMSC_OK+0x3c>)
 80026e4:	4a09      	ldr	r2, [pc, #36]	; (800270c <wait_SMSC_OK+0x40>)
 80026e6:	601a      	str	r2, [r3, #0]
 80026e8:	4b09      	ldr	r3, [pc, #36]	; (8002710 <wait_SMSC_OK+0x44>)
 80026ea:	2201      	movs	r2, #1
 80026ec:	601a      	str	r2, [r3, #0]
 80026ee:	bf00      	nop
 80026f0:	bd80      	pop	{r7, pc}
 80026f2:	bf00      	nop
 80026f4:	08003740 	.word	0x08003740
 80026f8:	20000014 	.word	0x20000014
 80026fc:	08001b91 	.word	0x08001b91
 8002700:	20000018 	.word	0x20000018
 8002704:	08001c21 	.word	0x08001c21
 8002708:	2000001c 	.word	0x2000001c
 800270c:	08001c35 	.word	0x08001c35
 8002710:	20000d40 	.word	0x20000d40

08002714 <read_SMSC>:
 8002714:	b580      	push	{r7, lr}
 8002716:	b088      	sub	sp, #32
 8002718:	af00      	add	r7, sp, #0
 800271a:	6078      	str	r0, [r7, #4]
 800271c:	6878      	ldr	r0, [r7, #4]
 800271e:	f7ff fa37 	bl	8001b90 <print_response>
 8002722:	2206      	movs	r2, #6
 8002724:	492a      	ldr	r1, [pc, #168]	; (80027d0 <read_SMSC+0xbc>)
 8002726:	482b      	ldr	r0, [pc, #172]	; (80027d4 <read_SMSC+0xc0>)
 8002728:	f7fd fd04 	bl	8000134 <strncmp>
 800272c:	4603      	mov	r3, r0
 800272e:	2b00      	cmp	r3, #0
 8002730:	d149      	bne.n	80027c6 <read_SMSC+0xb2>
 8002732:	2300      	movs	r3, #0
 8002734:	61bb      	str	r3, [r7, #24]
 8002736:	2300      	movs	r3, #0
 8002738:	617b      	str	r3, [r7, #20]
 800273a:	2300      	movs	r3, #0
 800273c:	613b      	str	r3, [r7, #16]
 800273e:	2300      	movs	r3, #0
 8002740:	61fb      	str	r3, [r7, #28]
 8002742:	e029      	b.n	8002798 <read_SMSC+0x84>
 8002744:	69fb      	ldr	r3, [r7, #28]
 8002746:	3306      	adds	r3, #6
 8002748:	4a22      	ldr	r2, [pc, #136]	; (80027d4 <read_SMSC+0xc0>)
 800274a:	4413      	add	r3, r2
 800274c:	781b      	ldrb	r3, [r3, #0]
 800274e:	73fb      	strb	r3, [r7, #15]
 8002750:	7bfb      	ldrb	r3, [r7, #15]
 8002752:	2b2c      	cmp	r3, #44	; 0x2c
 8002754:	d105      	bne.n	8002762 <read_SMSC+0x4e>
 8002756:	4a20      	ldr	r2, [pc, #128]	; (80027d8 <read_SMSC+0xc4>)
 8002758:	697b      	ldr	r3, [r7, #20]
 800275a:	4413      	add	r3, r2
 800275c:	2200      	movs	r2, #0
 800275e:	701a      	strb	r2, [r3, #0]
 8002760:	e01d      	b.n	800279e <read_SMSC+0x8a>
 8002762:	69bb      	ldr	r3, [r7, #24]
 8002764:	2b00      	cmp	r3, #0
 8002766:	d008      	beq.n	800277a <read_SMSC+0x66>
 8002768:	693b      	ldr	r3, [r7, #16]
 800276a:	1c5a      	adds	r2, r3, #1
 800276c:	613a      	str	r2, [r7, #16]
 800276e:	491a      	ldr	r1, [pc, #104]	; (80027d8 <read_SMSC+0xc4>)
 8002770:	7bfa      	ldrb	r2, [r7, #15]
 8002772:	54ca      	strb	r2, [r1, r3]
 8002774:	4a18      	ldr	r2, [pc, #96]	; (80027d8 <read_SMSC+0xc4>)
 8002776:	5cd3      	ldrb	r3, [r2, r3]
 8002778:	2b00      	cmp	r3, #0
 800277a:	7bfb      	ldrb	r3, [r7, #15]
 800277c:	2b22      	cmp	r3, #34	; 0x22
 800277e:	d108      	bne.n	8002792 <read_SMSC+0x7e>
 8002780:	69bb      	ldr	r3, [r7, #24]
 8002782:	f083 0301 	eor.w	r3, r3, #1
 8002786:	61bb      	str	r3, [r7, #24]
 8002788:	693b      	ldr	r3, [r7, #16]
 800278a:	3b01      	subs	r3, #1
 800278c:	617b      	str	r3, [r7, #20]
 800278e:	697b      	ldr	r3, [r7, #20]
 8002790:	2b00      	cmp	r3, #0
 8002792:	69fb      	ldr	r3, [r7, #28]
 8002794:	3301      	adds	r3, #1
 8002796:	61fb      	str	r3, [r7, #28]
 8002798:	69fb      	ldr	r3, [r7, #28]
 800279a:	2b0f      	cmp	r3, #15
 800279c:	d9d2      	bls.n	8002744 <read_SMSC+0x30>
 800279e:	69fb      	ldr	r3, [r7, #28]
 80027a0:	3307      	adds	r3, #7
 80027a2:	4a0c      	ldr	r2, [pc, #48]	; (80027d4 <read_SMSC+0xc0>)
 80027a4:	4413      	add	r3, r2
 80027a6:	4618      	mov	r0, r3
 80027a8:	f7fd fd48 	bl	800023c <atoi>
 80027ac:	4603      	mov	r3, r0
 80027ae:	461a      	mov	r2, r3
 80027b0:	4b0a      	ldr	r3, [pc, #40]	; (80027dc <read_SMSC+0xc8>)
 80027b2:	601a      	str	r2, [r3, #0]
 80027b4:	4b0a      	ldr	r3, [pc, #40]	; (80027e0 <read_SMSC+0xcc>)
 80027b6:	4a0b      	ldr	r2, [pc, #44]	; (80027e4 <read_SMSC+0xd0>)
 80027b8:	601a      	str	r2, [r3, #0]
 80027ba:	4b0b      	ldr	r3, [pc, #44]	; (80027e8 <read_SMSC+0xd4>)
 80027bc:	4a0b      	ldr	r2, [pc, #44]	; (80027ec <read_SMSC+0xd8>)
 80027be:	601a      	str	r2, [r3, #0]
 80027c0:	4b0b      	ldr	r3, [pc, #44]	; (80027f0 <read_SMSC+0xdc>)
 80027c2:	4a0c      	ldr	r2, [pc, #48]	; (80027f4 <read_SMSC+0xe0>)
 80027c4:	601a      	str	r2, [r3, #0]
 80027c6:	bf00      	nop
 80027c8:	3720      	adds	r7, #32
 80027ca:	46bd      	mov	sp, r7
 80027cc:	bd80      	pop	{r7, pc}
 80027ce:	bf00      	nop
 80027d0:	0800379c 	.word	0x0800379c
 80027d4:	20000f70 	.word	0x20000f70
 80027d8:	20000d4c 	.word	0x20000d4c
 80027dc:	20000d5c 	.word	0x20000d5c
 80027e0:	20000014 	.word	0x20000014
 80027e4:	08001b91 	.word	0x08001b91
 80027e8:	20000018 	.word	0x20000018
 80027ec:	080026cd 	.word	0x080026cd
 80027f0:	2000001c 	.word	0x2000001c
 80027f4:	08001c35 	.word	0x08001c35

080027f8 <wait_check_ready>:
 80027f8:	b580      	push	{r7, lr}
 80027fa:	b082      	sub	sp, #8
 80027fc:	af00      	add	r7, sp, #0
 80027fe:	6078      	str	r0, [r7, #4]
 8002800:	6878      	ldr	r0, [r7, #4]
 8002802:	f7ff f9c5 	bl	8001b90 <print_response>
 8002806:	2208      	movs	r2, #8
 8002808:	490b      	ldr	r1, [pc, #44]	; (8002838 <wait_check_ready+0x40>)
 800280a:	480c      	ldr	r0, [pc, #48]	; (800283c <wait_check_ready+0x44>)
 800280c:	f7fd fc92 	bl	8000134 <strncmp>
 8002810:	4603      	mov	r3, r0
 8002812:	2b00      	cmp	r3, #0
 8002814:	d10b      	bne.n	800282e <wait_check_ready+0x36>
 8002816:	480a      	ldr	r0, [pc, #40]	; (8002840 <wait_check_ready+0x48>)
 8002818:	f7ff fa1a 	bl	8001c50 <sim900_command>
 800281c:	4b09      	ldr	r3, [pc, #36]	; (8002844 <wait_check_ready+0x4c>)
 800281e:	4a0a      	ldr	r2, [pc, #40]	; (8002848 <wait_check_ready+0x50>)
 8002820:	601a      	str	r2, [r3, #0]
 8002822:	4b0a      	ldr	r3, [pc, #40]	; (800284c <wait_check_ready+0x54>)
 8002824:	4a0a      	ldr	r2, [pc, #40]	; (8002850 <wait_check_ready+0x58>)
 8002826:	601a      	str	r2, [r3, #0]
 8002828:	4b0a      	ldr	r3, [pc, #40]	; (8002854 <wait_check_ready+0x5c>)
 800282a:	4a0b      	ldr	r2, [pc, #44]	; (8002858 <wait_check_ready+0x60>)
 800282c:	601a      	str	r2, [r3, #0]
 800282e:	bf00      	nop
 8002830:	3708      	adds	r7, #8
 8002832:	46bd      	mov	sp, r7
 8002834:	bd80      	pop	{r7, pc}
 8002836:	bf00      	nop
 8002838:	080037a4 	.word	0x080037a4
 800283c:	20000f70 	.word	0x20000f70
 8002840:	080037b0 	.word	0x080037b0
 8002844:	20000014 	.word	0x20000014
 8002848:	08002715 	.word	0x08002715
 800284c:	20000018 	.word	0x20000018
 8002850:	08001c21 	.word	0x08001c21
 8002854:	2000001c 	.word	0x2000001c
 8002858:	08001c35 	.word	0x08001c35

0800285c <cpinok>:
 800285c:	b580      	push	{r7, lr}
 800285e:	af00      	add	r7, sp, #0
 8002860:	4806      	ldr	r0, [pc, #24]	; (800287c <cpinok+0x20>)
 8002862:	f7fe f817 	bl	8000894 <xprintf>
 8002866:	4b06      	ldr	r3, [pc, #24]	; (8002880 <cpinok+0x24>)
 8002868:	4a06      	ldr	r2, [pc, #24]	; (8002884 <cpinok+0x28>)
 800286a:	601a      	str	r2, [r3, #0]
 800286c:	4b06      	ldr	r3, [pc, #24]	; (8002888 <cpinok+0x2c>)
 800286e:	4a07      	ldr	r2, [pc, #28]	; (800288c <cpinok+0x30>)
 8002870:	601a      	str	r2, [r3, #0]
 8002872:	4b07      	ldr	r3, [pc, #28]	; (8002890 <cpinok+0x34>)
 8002874:	4a07      	ldr	r2, [pc, #28]	; (8002894 <cpinok+0x38>)
 8002876:	601a      	str	r2, [r3, #0]
 8002878:	bf00      	nop
 800287a:	bd80      	pop	{r7, pc}
 800287c:	08003740 	.word	0x08003740
 8002880:	20000014 	.word	0x20000014
 8002884:	080027f9 	.word	0x080027f9
 8002888:	20000018 	.word	0x20000018
 800288c:	08001c21 	.word	0x08001c21
 8002890:	2000001c 	.word	0x2000001c
 8002894:	08001c35 	.word	0x08001c35

08002898 <check_cpin>:
 8002898:	b580      	push	{r7, lr}
 800289a:	b082      	sub	sp, #8
 800289c:	af00      	add	r7, sp, #0
 800289e:	6078      	str	r0, [r7, #4]
 80028a0:	6878      	ldr	r0, [r7, #4]
 80028a2:	f7ff f975 	bl	8001b90 <print_response>
 80028a6:	491b      	ldr	r1, [pc, #108]	; (8002914 <check_cpin+0x7c>)
 80028a8:	481b      	ldr	r0, [pc, #108]	; (8002918 <check_cpin+0x80>)
 80028aa:	f7fd fc1f 	bl	80000ec <strstr>
 80028ae:	4603      	mov	r3, r0
 80028b0:	2b00      	cmp	r3, #0
 80028b2:	d02a      	beq.n	800290a <check_cpin+0x72>
 80028b4:	4919      	ldr	r1, [pc, #100]	; (800291c <check_cpin+0x84>)
 80028b6:	481a      	ldr	r0, [pc, #104]	; (8002920 <check_cpin+0x88>)
 80028b8:	f7fd fc18 	bl	80000ec <strstr>
 80028bc:	4603      	mov	r3, r0
 80028be:	2b00      	cmp	r3, #0
 80028c0:	d009      	beq.n	80028d6 <check_cpin+0x3e>
 80028c2:	4b18      	ldr	r3, [pc, #96]	; (8002924 <check_cpin+0x8c>)
 80028c4:	4a18      	ldr	r2, [pc, #96]	; (8002928 <check_cpin+0x90>)
 80028c6:	601a      	str	r2, [r3, #0]
 80028c8:	4b18      	ldr	r3, [pc, #96]	; (800292c <check_cpin+0x94>)
 80028ca:	4a19      	ldr	r2, [pc, #100]	; (8002930 <check_cpin+0x98>)
 80028cc:	601a      	str	r2, [r3, #0]
 80028ce:	4b19      	ldr	r3, [pc, #100]	; (8002934 <check_cpin+0x9c>)
 80028d0:	4a19      	ldr	r2, [pc, #100]	; (8002938 <check_cpin+0xa0>)
 80028d2:	601a      	str	r2, [r3, #0]
 80028d4:	e019      	b.n	800290a <check_cpin+0x72>
 80028d6:	4919      	ldr	r1, [pc, #100]	; (800293c <check_cpin+0xa4>)
 80028d8:	4811      	ldr	r0, [pc, #68]	; (8002920 <check_cpin+0x88>)
 80028da:	f7fd fc07 	bl	80000ec <strstr>
 80028de:	4603      	mov	r3, r0
 80028e0:	2b00      	cmp	r3, #0
 80028e2:	d00c      	beq.n	80028fe <check_cpin+0x66>
 80028e4:	4816      	ldr	r0, [pc, #88]	; (8002940 <check_cpin+0xa8>)
 80028e6:	f7ff f9b3 	bl	8001c50 <sim900_command>
 80028ea:	4b0e      	ldr	r3, [pc, #56]	; (8002924 <check_cpin+0x8c>)
 80028ec:	4a15      	ldr	r2, [pc, #84]	; (8002944 <check_cpin+0xac>)
 80028ee:	601a      	str	r2, [r3, #0]
 80028f0:	4b0e      	ldr	r3, [pc, #56]	; (800292c <check_cpin+0x94>)
 80028f2:	4a15      	ldr	r2, [pc, #84]	; (8002948 <check_cpin+0xb0>)
 80028f4:	601a      	str	r2, [r3, #0]
 80028f6:	4b0f      	ldr	r3, [pc, #60]	; (8002934 <check_cpin+0x9c>)
 80028f8:	4a0f      	ldr	r2, [pc, #60]	; (8002938 <check_cpin+0xa0>)
 80028fa:	601a      	str	r2, [r3, #0]
 80028fc:	e005      	b.n	800290a <check_cpin+0x72>
 80028fe:	4813      	ldr	r0, [pc, #76]	; (800294c <check_cpin+0xb4>)
 8002900:	f7fd ffc8 	bl	8000894 <xprintf>
 8002904:	4b12      	ldr	r3, [pc, #72]	; (8002950 <check_cpin+0xb8>)
 8002906:	2201      	movs	r2, #1
 8002908:	601a      	str	r2, [r3, #0]
 800290a:	bf00      	nop
 800290c:	3708      	adds	r7, #8
 800290e:	46bd      	mov	sp, r7
 8002910:	bd80      	pop	{r7, pc}
 8002912:	bf00      	nop
 8002914:	080037bc 	.word	0x080037bc
 8002918:	20000f70 	.word	0x20000f70
 800291c:	080037c4 	.word	0x080037c4
 8002920:	20000f76 	.word	0x20000f76
 8002924:	20000014 	.word	0x20000014
 8002928:	080027f9 	.word	0x080027f9
 800292c:	20000018 	.word	0x20000018
 8002930:	08001c21 	.word	0x08001c21
 8002934:	2000001c 	.word	0x2000001c
 8002938:	08001c35 	.word	0x08001c35
 800293c:	080037cc 	.word	0x080037cc
 8002940:	080037d4 	.word	0x080037d4
 8002944:	08001b91 	.word	0x08001b91
 8002948:	0800285d 	.word	0x0800285d
 800294c:	080037e4 	.word	0x080037e4
 8002950:	20000d44 	.word	0x20000d44

08002954 <sim900_init>:
 8002954:	b480      	push	{r7}
 8002956:	af00      	add	r7, sp, #0
 8002958:	4b07      	ldr	r3, [pc, #28]	; (8002978 <sim900_init+0x24>)
 800295a:	2200      	movs	r2, #0
 800295c:	601a      	str	r2, [r3, #0]
 800295e:	4b07      	ldr	r3, [pc, #28]	; (800297c <sim900_init+0x28>)
 8002960:	4a07      	ldr	r2, [pc, #28]	; (8002980 <sim900_init+0x2c>)
 8002962:	601a      	str	r2, [r3, #0]
 8002964:	4b07      	ldr	r3, [pc, #28]	; (8002984 <sim900_init+0x30>)
 8002966:	4a08      	ldr	r2, [pc, #32]	; (8002988 <sim900_init+0x34>)
 8002968:	601a      	str	r2, [r3, #0]
 800296a:	4b08      	ldr	r3, [pc, #32]	; (800298c <sim900_init+0x38>)
 800296c:	4a08      	ldr	r2, [pc, #32]	; (8002990 <sim900_init+0x3c>)
 800296e:	601a      	str	r2, [r3, #0]
 8002970:	bf00      	nop
 8002972:	46bd      	mov	sp, r7
 8002974:	bc80      	pop	{r7}
 8002976:	4770      	bx	lr
 8002978:	20000d40 	.word	0x20000d40
 800297c:	20000014 	.word	0x20000014
 8002980:	08002899 	.word	0x08002899
 8002984:	20000018 	.word	0x20000018
 8002988:	08001c21 	.word	0x08001c21
 800298c:	2000001c 	.word	0x2000001c
 8002990:	08001c35 	.word	0x08001c35

08002994 <sleep>:
 8002994:	b480      	push	{r7}
 8002996:	b085      	sub	sp, #20
 8002998:	af00      	add	r7, sp, #0
 800299a:	6078      	str	r0, [r7, #4]
 800299c:	4b07      	ldr	r3, [pc, #28]	; (80029bc <sleep+0x28>)
 800299e:	681b      	ldr	r3, [r3, #0]
 80029a0:	60fb      	str	r3, [r7, #12]
 80029a2:	bf00      	nop
 80029a4:	68fa      	ldr	r2, [r7, #12]
 80029a6:	687b      	ldr	r3, [r7, #4]
 80029a8:	441a      	add	r2, r3
 80029aa:	4b04      	ldr	r3, [pc, #16]	; (80029bc <sleep+0x28>)
 80029ac:	681b      	ldr	r3, [r3, #0]
 80029ae:	429a      	cmp	r2, r3
 80029b0:	d8f8      	bhi.n	80029a4 <sleep+0x10>
 80029b2:	bf00      	nop
 80029b4:	3714      	adds	r7, #20
 80029b6:	46bd      	mov	sp, r7
 80029b8:	bc80      	pop	{r7}
 80029ba:	4770      	bx	lr
 80029bc:	20000cc8 	.word	0x20000cc8

080029c0 <main>:
 80029c0:	b5b0      	push	{r4, r5, r7, lr}
 80029c2:	b082      	sub	sp, #8
 80029c4:	af00      	add	r7, sp, #0
 80029c6:	f7fe fbe1 	bl	800118c <system_init>
 80029ca:	f7fe fa1b 	bl	8000e04 <uart_init>
 80029ce:	f000 f97b 	bl	8002cc8 <led_init>
 80029d2:	f7fe f955 	bl	8000c80 <dbg_init>
 80029d6:	f7fe fe6d 	bl	80016b4 <system_PB6_off>
 80029da:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80029de:	f7ff ffd9 	bl	8002994 <sleep>
 80029e2:	f7fe fe59 	bl	8001698 <system_PB6_on>
 80029e6:	f000 f97d 	bl	8002ce4 <led_on>
 80029ea:	f7fe fe71 	bl	80016d0 <system_restore_params>
 80029ee:	4603      	mov	r3, r0
 80029f0:	2b00      	cmp	r3, #0
 80029f2:	d018      	beq.n	8002a26 <main+0x66>
 80029f4:	f7fe fde6 	bl	80015c4 <comp_get_threshold>
 80029f8:	4603      	mov	r3, r0
 80029fa:	4618      	mov	r0, r3
 80029fc:	f7fe fd5e 	bl	80014bc <code2temp>
 8002a00:	4604      	mov	r4, r0
 8002a02:	4b8f      	ldr	r3, [pc, #572]	; (8002c40 <main+0x280>)
 8002a04:	881b      	ldrh	r3, [r3, #0]
 8002a06:	4618      	mov	r0, r3
 8002a08:	f7fe fd58 	bl	80014bc <code2temp>
 8002a0c:	4605      	mov	r5, r0
 8002a0e:	4b8d      	ldr	r3, [pc, #564]	; (8002c44 <main+0x284>)
 8002a10:	881b      	ldrh	r3, [r3, #0]
 8002a12:	4618      	mov	r0, r3
 8002a14:	f7fe fd52 	bl	80014bc <code2temp>
 8002a18:	4603      	mov	r3, r0
 8002a1a:	462a      	mov	r2, r5
 8002a1c:	4621      	mov	r1, r4
 8002a1e:	488a      	ldr	r0, [pc, #552]	; (8002c48 <main+0x288>)
 8002a20:	f7fd ff38 	bl	8000894 <xprintf>
 8002a24:	e002      	b.n	8002a2c <main+0x6c>
 8002a26:	4889      	ldr	r0, [pc, #548]	; (8002c4c <main+0x28c>)
 8002a28:	f7fd ff34 	bl	8000894 <xprintf>
 8002a2c:	f7ff ff92 	bl	8002954 <sim900_init>
 8002a30:	4887      	ldr	r0, [pc, #540]	; (8002c50 <main+0x290>)
 8002a32:	f7fd ff2f 	bl	8000894 <xprintf>
 8002a36:	4b87      	ldr	r3, [pc, #540]	; (8002c54 <main+0x294>)
 8002a38:	f64a 22aa 	movw	r2, #43690	; 0xaaaa
 8002a3c:	601a      	str	r2, [r3, #0]
 8002a3e:	4b86      	ldr	r3, [pc, #536]	; (8002c58 <main+0x298>)
 8002a40:	681b      	ldr	r3, [r3, #0]
 8002a42:	2b00      	cmp	r3, #0
 8002a44:	f040 80f4 	bne.w	8002c30 <main+0x270>
 8002a48:	4b84      	ldr	r3, [pc, #528]	; (8002c5c <main+0x29c>)
 8002a4a:	681b      	ldr	r3, [r3, #0]
 8002a4c:	2b00      	cmp	r3, #0
 8002a4e:	f000 80ec 	beq.w	8002c2a <main+0x26a>
 8002a52:	4b83      	ldr	r3, [pc, #524]	; (8002c60 <main+0x2a0>)
 8002a54:	4a83      	ldr	r2, [pc, #524]	; (8002c64 <main+0x2a4>)
 8002a56:	601a      	str	r2, [r3, #0]
 8002a58:	4b83      	ldr	r3, [pc, #524]	; (8002c68 <main+0x2a8>)
 8002a5a:	681b      	ldr	r3, [r3, #0]
 8002a5c:	2b00      	cmp	r3, #0
 8002a5e:	d06f      	beq.n	8002b40 <main+0x180>
 8002a60:	4b81      	ldr	r3, [pc, #516]	; (8002c68 <main+0x2a8>)
 8002a62:	2200      	movs	r2, #0
 8002a64:	601a      	str	r2, [r3, #0]
 8002a66:	4881      	ldr	r0, [pc, #516]	; (8002c6c <main+0x2ac>)
 8002a68:	f7fd fb8a 	bl	8000180 <strlen>
 8002a6c:	4603      	mov	r3, r0
 8002a6e:	461a      	mov	r2, r3
 8002a70:	497f      	ldr	r1, [pc, #508]	; (8002c70 <main+0x2b0>)
 8002a72:	487e      	ldr	r0, [pc, #504]	; (8002c6c <main+0x2ac>)
 8002a74:	f7fd fb5e 	bl	8000134 <strncmp>
 8002a78:	4603      	mov	r3, r0
 8002a7a:	2b00      	cmp	r3, #0
 8002a7c:	d10d      	bne.n	8002a9a <main+0xda>
 8002a7e:	4b7d      	ldr	r3, [pc, #500]	; (8002c74 <main+0x2b4>)
 8002a80:	881b      	ldrh	r3, [r3, #0]
 8002a82:	4618      	mov	r0, r3
 8002a84:	f7fe fd1a 	bl	80014bc <code2temp>
 8002a88:	4603      	mov	r3, r0
 8002a8a:	461a      	mov	r2, r3
 8002a8c:	497a      	ldr	r1, [pc, #488]	; (8002c78 <main+0x2b8>)
 8002a8e:	4878      	ldr	r0, [pc, #480]	; (8002c70 <main+0x2b0>)
 8002a90:	f7fd ff12 	bl	80008b8 <xsprintf>
 8002a94:	f7ff fb02 	bl	800209c <sim900_send_sms_seq>
 8002a98:	e052      	b.n	8002b40 <main+0x180>
 8002a9a:	4878      	ldr	r0, [pc, #480]	; (8002c7c <main+0x2bc>)
 8002a9c:	f7fd fb70 	bl	8000180 <strlen>
 8002aa0:	4603      	mov	r3, r0
 8002aa2:	461a      	mov	r2, r3
 8002aa4:	4972      	ldr	r1, [pc, #456]	; (8002c70 <main+0x2b0>)
 8002aa6:	4875      	ldr	r0, [pc, #468]	; (8002c7c <main+0x2bc>)
 8002aa8:	f7fd fb44 	bl	8000134 <strncmp>
 8002aac:	4603      	mov	r3, r0
 8002aae:	2b00      	cmp	r3, #0
 8002ab0:	d140      	bne.n	8002b34 <main+0x174>
 8002ab2:	4872      	ldr	r0, [pc, #456]	; (8002c7c <main+0x2bc>)
 8002ab4:	f7fd fb64 	bl	8000180 <strlen>
 8002ab8:	4602      	mov	r2, r0
 8002aba:	4b6d      	ldr	r3, [pc, #436]	; (8002c70 <main+0x2b0>)
 8002abc:	5c9b      	ldrb	r3, [r3, r2]
 8002abe:	2b00      	cmp	r3, #0
 8002ac0:	d10e      	bne.n	8002ae0 <main+0x120>
 8002ac2:	f7fe fd7f 	bl	80015c4 <comp_get_threshold>
 8002ac6:	4603      	mov	r3, r0
 8002ac8:	4618      	mov	r0, r3
 8002aca:	f7fe fcf7 	bl	80014bc <code2temp>
 8002ace:	4603      	mov	r3, r0
 8002ad0:	461a      	mov	r2, r3
 8002ad2:	496b      	ldr	r1, [pc, #428]	; (8002c80 <main+0x2c0>)
 8002ad4:	4866      	ldr	r0, [pc, #408]	; (8002c70 <main+0x2b0>)
 8002ad6:	f7fd feef 	bl	80008b8 <xsprintf>
 8002ada:	f7ff fadf 	bl	800209c <sim900_send_sms_seq>
 8002ade:	e02f      	b.n	8002b40 <main+0x180>
 8002ae0:	4866      	ldr	r0, [pc, #408]	; (8002c7c <main+0x2bc>)
 8002ae2:	f7fd fb4d 	bl	8000180 <strlen>
 8002ae6:	4602      	mov	r2, r0
 8002ae8:	4b61      	ldr	r3, [pc, #388]	; (8002c70 <main+0x2b0>)
 8002aea:	4413      	add	r3, r2
 8002aec:	4618      	mov	r0, r3
 8002aee:	f7fd fba5 	bl	800023c <atoi>
 8002af2:	6078      	str	r0, [r7, #4]
 8002af4:	687b      	ldr	r3, [r7, #4]
 8002af6:	f113 0f27 	cmn.w	r3, #39	; 0x27
 8002afa:	db14      	blt.n	8002b26 <main+0x166>
 8002afc:	687b      	ldr	r3, [r7, #4]
 8002afe:	2b7c      	cmp	r3, #124	; 0x7c
 8002b00:	dc11      	bgt.n	8002b26 <main+0x166>
 8002b02:	6878      	ldr	r0, [r7, #4]
 8002b04:	f7fe fd16 	bl	8001534 <temp2code>
 8002b08:	4603      	mov	r3, r0
 8002b0a:	b29b      	uxth	r3, r3
 8002b0c:	4618      	mov	r0, r3
 8002b0e:	f7fe fd85 	bl	800161c <comp_set_threshold>
 8002b12:	f7fe fe3f 	bl	8001794 <system_backup_params>
 8002b16:	687a      	ldr	r2, [r7, #4]
 8002b18:	495a      	ldr	r1, [pc, #360]	; (8002c84 <main+0x2c4>)
 8002b1a:	4855      	ldr	r0, [pc, #340]	; (8002c70 <main+0x2b0>)
 8002b1c:	f7fd fecc 	bl	80008b8 <xsprintf>
 8002b20:	f7ff fabc 	bl	800209c <sim900_send_sms_seq>
 8002b24:	e00c      	b.n	8002b40 <main+0x180>
 8002b26:	4958      	ldr	r1, [pc, #352]	; (8002c88 <main+0x2c8>)
 8002b28:	4851      	ldr	r0, [pc, #324]	; (8002c70 <main+0x2b0>)
 8002b2a:	f7fd fec5 	bl	80008b8 <xsprintf>
 8002b2e:	f7ff fab5 	bl	800209c <sim900_send_sms_seq>
 8002b32:	e005      	b.n	8002b40 <main+0x180>
 8002b34:	4955      	ldr	r1, [pc, #340]	; (8002c8c <main+0x2cc>)
 8002b36:	484e      	ldr	r0, [pc, #312]	; (8002c70 <main+0x2b0>)
 8002b38:	f7fd febe 	bl	80008b8 <xsprintf>
 8002b3c:	f7ff faae 	bl	800209c <sim900_send_sms_seq>
 8002b40:	4b53      	ldr	r3, [pc, #332]	; (8002c90 <main+0x2d0>)
 8002b42:	881b      	ldrh	r3, [r3, #0]
 8002b44:	2b00      	cmp	r3, #0
 8002b46:	d01c      	beq.n	8002b82 <main+0x1c2>
 8002b48:	4b52      	ldr	r3, [pc, #328]	; (8002c94 <main+0x2d4>)
 8002b4a:	881b      	ldrh	r3, [r3, #0]
 8002b4c:	2b00      	cmp	r3, #0
 8002b4e:	d018      	beq.n	8002b82 <main+0x1c2>
 8002b50:	4b48      	ldr	r3, [pc, #288]	; (8002c74 <main+0x2b4>)
 8002b52:	881b      	ldrh	r3, [r3, #0]
 8002b54:	4618      	mov	r0, r3
 8002b56:	f7fe fcb1 	bl	80014bc <code2temp>
 8002b5a:	4601      	mov	r1, r0
 8002b5c:	4b45      	ldr	r3, [pc, #276]	; (8002c74 <main+0x2b4>)
 8002b5e:	881b      	ldrh	r3, [r3, #0]
 8002b60:	461a      	mov	r2, r3
 8002b62:	484d      	ldr	r0, [pc, #308]	; (8002c98 <main+0x2d8>)
 8002b64:	f7fd fe96 	bl	8000894 <xprintf>
 8002b68:	4b42      	ldr	r3, [pc, #264]	; (8002c74 <main+0x2b4>)
 8002b6a:	881b      	ldrh	r3, [r3, #0]
 8002b6c:	4618      	mov	r0, r3
 8002b6e:	f7fe fca5 	bl	80014bc <code2temp>
 8002b72:	4603      	mov	r3, r0
 8002b74:	461a      	mov	r2, r3
 8002b76:	4949      	ldr	r1, [pc, #292]	; (8002c9c <main+0x2dc>)
 8002b78:	483d      	ldr	r0, [pc, #244]	; (8002c70 <main+0x2b0>)
 8002b7a:	f7fd fe9d 	bl	80008b8 <xsprintf>
 8002b7e:	f7ff fa8d 	bl	800209c <sim900_send_sms_seq>
 8002b82:	4b44      	ldr	r3, [pc, #272]	; (8002c94 <main+0x2d4>)
 8002b84:	881b      	ldrh	r3, [r3, #0]
 8002b86:	2b00      	cmp	r3, #0
 8002b88:	bf0c      	ite	eq
 8002b8a:	2301      	moveq	r3, #1
 8002b8c:	2300      	movne	r3, #0
 8002b8e:	b2db      	uxtb	r3, r3
 8002b90:	b29a      	uxth	r2, r3
 8002b92:	4b3f      	ldr	r3, [pc, #252]	; (8002c90 <main+0x2d0>)
 8002b94:	801a      	strh	r2, [r3, #0]
 8002b96:	4b42      	ldr	r3, [pc, #264]	; (8002ca0 <main+0x2e0>)
 8002b98:	681b      	ldr	r3, [r3, #0]
 8002b9a:	2b00      	cmp	r3, #0
 8002b9c:	d00f      	beq.n	8002bbe <main+0x1fe>
 8002b9e:	4b41      	ldr	r3, [pc, #260]	; (8002ca4 <main+0x2e4>)
 8002ba0:	681b      	ldr	r3, [r3, #0]
 8002ba2:	2b1e      	cmp	r3, #30
 8002ba4:	d90b      	bls.n	8002bbe <main+0x1fe>
 8002ba6:	4b40      	ldr	r3, [pc, #256]	; (8002ca8 <main+0x2e8>)
 8002ba8:	2201      	movs	r2, #1
 8002baa:	601a      	str	r2, [r3, #0]
 8002bac:	483f      	ldr	r0, [pc, #252]	; (8002cac <main+0x2ec>)
 8002bae:	f7fd fe71 	bl	8000894 <xprintf>
 8002bb2:	493f      	ldr	r1, [pc, #252]	; (8002cb0 <main+0x2f0>)
 8002bb4:	482e      	ldr	r0, [pc, #184]	; (8002c70 <main+0x2b0>)
 8002bb6:	f7fd fe7f 	bl	80008b8 <xsprintf>
 8002bba:	f7ff fa6f 	bl	800209c <sim900_send_sms_seq>
 8002bbe:	4b39      	ldr	r3, [pc, #228]	; (8002ca4 <main+0x2e4>)
 8002bc0:	681b      	ldr	r3, [r3, #0]
 8002bc2:	2b1e      	cmp	r3, #30
 8002bc4:	bf94      	ite	ls
 8002bc6:	2301      	movls	r3, #1
 8002bc8:	2300      	movhi	r3, #0
 8002bca:	b2db      	uxtb	r3, r3
 8002bcc:	461a      	mov	r2, r3
 8002bce:	4b34      	ldr	r3, [pc, #208]	; (8002ca0 <main+0x2e0>)
 8002bd0:	601a      	str	r2, [r3, #0]
 8002bd2:	4b35      	ldr	r3, [pc, #212]	; (8002ca8 <main+0x2e8>)
 8002bd4:	681b      	ldr	r3, [r3, #0]
 8002bd6:	2b00      	cmp	r3, #0
 8002bd8:	d013      	beq.n	8002c02 <main+0x242>
 8002bda:	4b36      	ldr	r3, [pc, #216]	; (8002cb4 <main+0x2f4>)
 8002bdc:	681b      	ldr	r3, [r3, #0]
 8002bde:	2b00      	cmp	r3, #0
 8002be0:	d00f      	beq.n	8002c02 <main+0x242>
 8002be2:	4b35      	ldr	r3, [pc, #212]	; (8002cb8 <main+0x2f8>)
 8002be4:	681b      	ldr	r3, [r3, #0]
 8002be6:	2b1e      	cmp	r3, #30
 8002be8:	d90b      	bls.n	8002c02 <main+0x242>
 8002bea:	4b2f      	ldr	r3, [pc, #188]	; (8002ca8 <main+0x2e8>)
 8002bec:	2200      	movs	r2, #0
 8002bee:	601a      	str	r2, [r3, #0]
 8002bf0:	4832      	ldr	r0, [pc, #200]	; (8002cbc <main+0x2fc>)
 8002bf2:	f7fd fe4f 	bl	8000894 <xprintf>
 8002bf6:	4932      	ldr	r1, [pc, #200]	; (8002cc0 <main+0x300>)
 8002bf8:	481d      	ldr	r0, [pc, #116]	; (8002c70 <main+0x2b0>)
 8002bfa:	f7fd fe5d 	bl	80008b8 <xsprintf>
 8002bfe:	f7ff fa4d 	bl	800209c <sim900_send_sms_seq>
 8002c02:	4b2d      	ldr	r3, [pc, #180]	; (8002cb8 <main+0x2f8>)
 8002c04:	681b      	ldr	r3, [r3, #0]
 8002c06:	2b1e      	cmp	r3, #30
 8002c08:	bf94      	ite	ls
 8002c0a:	2301      	movls	r3, #1
 8002c0c:	2300      	movhi	r3, #0
 8002c0e:	b2db      	uxtb	r3, r3
 8002c10:	461a      	mov	r2, r3
 8002c12:	4b28      	ldr	r3, [pc, #160]	; (8002cb4 <main+0x2f4>)
 8002c14:	601a      	str	r2, [r3, #0]
 8002c16:	f7fe fdeb 	bl	80017f0 <get_fault_flag>
 8002c1a:	4603      	mov	r3, r0
 8002c1c:	2b00      	cmp	r3, #0
 8002c1e:	d004      	beq.n	8002c2a <main+0x26a>
 8002c20:	f7fe fe0a 	bl	8001838 <clr_fault_flag>
 8002c24:	4827      	ldr	r0, [pc, #156]	; (8002cc4 <main+0x304>)
 8002c26:	f7fd fe35 	bl	8000894 <xprintf>
 8002c2a:	f7fe ff47 	bl	8001abc <sim900_update>
 8002c2e:	e702      	b.n	8002a36 <main+0x76>
 8002c30:	bf00      	nop
 8002c32:	f7fe fe1b 	bl	800186c <set_fault_flag>
 8002c36:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8002c3a:	f7ff feab 	bl	8002994 <sleep>
 8002c3e:	e7fa      	b.n	8002c36 <main+0x276>
 8002c40:	20000004 	.word	0x20000004
 8002c44:	20000002 	.word	0x20000002
 8002c48:	08003804 	.word	0x08003804
 8002c4c:	0800382c 	.word	0x0800382c
 8002c50:	08003858 	.word	0x08003858
 8002c54:	40003000 	.word	0x40003000
 8002c58:	20000d44 	.word	0x20000d44
 8002c5c:	20000d40 	.word	0x20000d40
 8002c60:	20000014 	.word	0x20000014
 8002c64:	08002669 	.word	0x08002669
 8002c68:	20000d48 	.word	0x20000d48
 8002c6c:	08003864 	.word	0x08003864
 8002c70:	20000e60 	.word	0x20000e60
 8002c74:	20000cd0 	.word	0x20000cd0
 8002c78:	0800387c 	.word	0x0800387c
 8002c7c:	08003898 	.word	0x08003898
 8002c80:	080038a4 	.word	0x080038a4
 8002c84:	080038c4 	.word	0x080038c4
 8002c88:	080038e8 	.word	0x080038e8
 8002c8c:	08003904 	.word	0x08003904
 8002c90:	20000006 	.word	0x20000006
 8002c94:	20000cd2 	.word	0x20000cd2
 8002c98:	08003948 	.word	0x08003948
 8002c9c:	08003958 	.word	0x08003958
 8002ca0:	20000008 	.word	0x20000008
 8002ca4:	20000d28 	.word	0x20000d28
 8002ca8:	20000cd8 	.word	0x20000cd8
 8002cac:	080039a0 	.word	0x080039a0
 8002cb0:	080039b0 	.word	0x080039b0
 8002cb4:	2000000c 	.word	0x2000000c
 8002cb8:	20000d24 	.word	0x20000d24
 8002cbc:	080039ec 	.word	0x080039ec
 8002cc0:	080039f8 	.word	0x080039f8
 8002cc4:	08003a18 	.word	0x08003a18

08002cc8 <led_init>:
 8002cc8:	b480      	push	{r7}
 8002cca:	af00      	add	r7, sp, #0
 8002ccc:	4a04      	ldr	r2, [pc, #16]	; (8002ce0 <led_init+0x18>)
 8002cce:	4b04      	ldr	r3, [pc, #16]	; (8002ce0 <led_init+0x18>)
 8002cd0:	685b      	ldr	r3, [r3, #4]
 8002cd2:	f443 1340 	orr.w	r3, r3, #3145728	; 0x300000
 8002cd6:	6053      	str	r3, [r2, #4]
 8002cd8:	bf00      	nop
 8002cda:	46bd      	mov	sp, r7
 8002cdc:	bc80      	pop	{r7}
 8002cde:	4770      	bx	lr
 8002ce0:	40011000 	.word	0x40011000

08002ce4 <led_on>:
 8002ce4:	b480      	push	{r7}
 8002ce6:	af00      	add	r7, sp, #0
 8002ce8:	4a04      	ldr	r2, [pc, #16]	; (8002cfc <led_on+0x18>)
 8002cea:	4b04      	ldr	r3, [pc, #16]	; (8002cfc <led_on+0x18>)
 8002cec:	68db      	ldr	r3, [r3, #12]
 8002cee:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8002cf2:	60d3      	str	r3, [r2, #12]
 8002cf4:	bf00      	nop
 8002cf6:	46bd      	mov	sp, r7
 8002cf8:	bc80      	pop	{r7}
 8002cfa:	4770      	bx	lr
 8002cfc:	40011000 	.word	0x40011000

08002d00 <led_off>:
 8002d00:	b480      	push	{r7}
 8002d02:	af00      	add	r7, sp, #0
 8002d04:	4a04      	ldr	r2, [pc, #16]	; (8002d18 <led_off+0x18>)
 8002d06:	4b04      	ldr	r3, [pc, #16]	; (8002d18 <led_off+0x18>)
 8002d08:	68db      	ldr	r3, [r3, #12]
 8002d0a:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8002d0e:	60d3      	str	r3, [r2, #12]
 8002d10:	bf00      	nop
 8002d12:	46bd      	mov	sp, r7
 8002d14:	bc80      	pop	{r7}
 8002d16:	4770      	bx	lr
 8002d18:	40011000 	.word	0x40011000

08002d1c <led_tog>:
 8002d1c:	b480      	push	{r7}
 8002d1e:	af00      	add	r7, sp, #0
 8002d20:	4a04      	ldr	r2, [pc, #16]	; (8002d34 <led_tog+0x18>)
 8002d22:	4b04      	ldr	r3, [pc, #16]	; (8002d34 <led_tog+0x18>)
 8002d24:	68db      	ldr	r3, [r3, #12]
 8002d26:	f483 5300 	eor.w	r3, r3, #8192	; 0x2000
 8002d2a:	60d3      	str	r3, [r2, #12]
 8002d2c:	bf00      	nop
 8002d2e:	46bd      	mov	sp, r7
 8002d30:	bc80      	pop	{r7}
 8002d32:	4770      	bx	lr
 8002d34:	40011000 	.word	0x40011000

08002d38 <handler_reset>:
 8002d38:	b580      	push	{r7, lr}
 8002d3a:	b082      	sub	sp, #8
 8002d3c:	af00      	add	r7, sp, #0
 8002d3e:	4b11      	ldr	r3, [pc, #68]	; (8002d84 <handler_reset+0x4c>)
 8002d40:	607b      	str	r3, [r7, #4]
 8002d42:	4b11      	ldr	r3, [pc, #68]	; (8002d88 <handler_reset+0x50>)
 8002d44:	603b      	str	r3, [r7, #0]
 8002d46:	e007      	b.n	8002d58 <handler_reset+0x20>
 8002d48:	683b      	ldr	r3, [r7, #0]
 8002d4a:	1d1a      	adds	r2, r3, #4
 8002d4c:	603a      	str	r2, [r7, #0]
 8002d4e:	687a      	ldr	r2, [r7, #4]
 8002d50:	1d11      	adds	r1, r2, #4
 8002d52:	6079      	str	r1, [r7, #4]
 8002d54:	6812      	ldr	r2, [r2, #0]
 8002d56:	601a      	str	r2, [r3, #0]
 8002d58:	683b      	ldr	r3, [r7, #0]
 8002d5a:	4a0c      	ldr	r2, [pc, #48]	; (8002d8c <handler_reset+0x54>)
 8002d5c:	4293      	cmp	r3, r2
 8002d5e:	d3f3      	bcc.n	8002d48 <handler_reset+0x10>
 8002d60:	4b0b      	ldr	r3, [pc, #44]	; (8002d90 <handler_reset+0x58>)
 8002d62:	603b      	str	r3, [r7, #0]
 8002d64:	e004      	b.n	8002d70 <handler_reset+0x38>
 8002d66:	683b      	ldr	r3, [r7, #0]
 8002d68:	1d1a      	adds	r2, r3, #4
 8002d6a:	603a      	str	r2, [r7, #0]
 8002d6c:	2200      	movs	r2, #0
 8002d6e:	601a      	str	r2, [r3, #0]
 8002d70:	683b      	ldr	r3, [r7, #0]
 8002d72:	4a08      	ldr	r2, [pc, #32]	; (8002d94 <handler_reset+0x5c>)
 8002d74:	4293      	cmp	r3, r2
 8002d76:	d3f6      	bcc.n	8002d66 <handler_reset+0x2e>
 8002d78:	f7ff fe22 	bl	80029c0 <main>
 8002d7c:	bf00      	nop
 8002d7e:	3708      	adds	r7, #8
 8002d80:	46bd      	mov	sp, r7
 8002d82:	bd80      	pop	{r7, pc}
 8002d84:	08003a34 	.word	0x08003a34
 8002d88:	20000000 	.word	0x20000000
 8002d8c:	200000a4 	.word	0x200000a4
 8002d90:	200000a4 	.word	0x200000a4
 8002d94:	2000137c 	.word	0x2000137c

08002d98 <default_handler>:
 8002d98:	b480      	push	{r7}
 8002d9a:	af00      	add	r7, sp, #0
 8002d9c:	e7fe      	b.n	8002d9c <default_handler+0x4>
 8002d9e:	bf00      	nop

08002da0 <__aeabi_drsub>:
 8002da0:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000
 8002da4:	e002      	b.n	8002dac <__adddf3>
 8002da6:	bf00      	nop

08002da8 <__aeabi_dsub>:
 8002da8:	f083 4300 	eor.w	r3, r3, #2147483648	; 0x80000000

08002dac <__adddf3>:
 8002dac:	b530      	push	{r4, r5, lr}
 8002dae:	ea4f 0441 	mov.w	r4, r1, lsl #1
 8002db2:	ea4f 0543 	mov.w	r5, r3, lsl #1
 8002db6:	ea94 0f05 	teq	r4, r5
 8002dba:	bf08      	it	eq
 8002dbc:	ea90 0f02 	teqeq	r0, r2
 8002dc0:	bf1f      	itttt	ne
 8002dc2:	ea54 0c00 	orrsne.w	ip, r4, r0
 8002dc6:	ea55 0c02 	orrsne.w	ip, r5, r2
 8002dca:	ea7f 5c64 	mvnsne.w	ip, r4, asr #21
 8002dce:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
 8002dd2:	f000 80e2 	beq.w	8002f9a <__adddf3+0x1ee>
 8002dd6:	ea4f 5454 	mov.w	r4, r4, lsr #21
 8002dda:	ebd4 5555 	rsbs	r5, r4, r5, lsr #21
 8002dde:	bfb8      	it	lt
 8002de0:	426d      	neglt	r5, r5
 8002de2:	dd0c      	ble.n	8002dfe <__adddf3+0x52>
 8002de4:	442c      	add	r4, r5
 8002de6:	ea80 0202 	eor.w	r2, r0, r2
 8002dea:	ea81 0303 	eor.w	r3, r1, r3
 8002dee:	ea82 0000 	eor.w	r0, r2, r0
 8002df2:	ea83 0101 	eor.w	r1, r3, r1
 8002df6:	ea80 0202 	eor.w	r2, r0, r2
 8002dfa:	ea81 0303 	eor.w	r3, r1, r3
 8002dfe:	2d36      	cmp	r5, #54	; 0x36
 8002e00:	bf88      	it	hi
 8002e02:	bd30      	pophi	{r4, r5, pc}
 8002e04:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
 8002e08:	ea4f 3101 	mov.w	r1, r1, lsl #12
 8002e0c:	f44f 1c80 	mov.w	ip, #1048576	; 0x100000
 8002e10:	ea4c 3111 	orr.w	r1, ip, r1, lsr #12
 8002e14:	d002      	beq.n	8002e1c <__adddf3+0x70>
 8002e16:	4240      	negs	r0, r0
 8002e18:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
 8002e1c:	f013 4f00 	tst.w	r3, #2147483648	; 0x80000000
 8002e20:	ea4f 3303 	mov.w	r3, r3, lsl #12
 8002e24:	ea4c 3313 	orr.w	r3, ip, r3, lsr #12
 8002e28:	d002      	beq.n	8002e30 <__adddf3+0x84>
 8002e2a:	4252      	negs	r2, r2
 8002e2c:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
 8002e30:	ea94 0f05 	teq	r4, r5
 8002e34:	f000 80a7 	beq.w	8002f86 <__adddf3+0x1da>
 8002e38:	f1a4 0401 	sub.w	r4, r4, #1
 8002e3c:	f1d5 0e20 	rsbs	lr, r5, #32
 8002e40:	db0d      	blt.n	8002e5e <__adddf3+0xb2>
 8002e42:	fa02 fc0e 	lsl.w	ip, r2, lr
 8002e46:	fa22 f205 	lsr.w	r2, r2, r5
 8002e4a:	1880      	adds	r0, r0, r2
 8002e4c:	f141 0100 	adc.w	r1, r1, #0
 8002e50:	fa03 f20e 	lsl.w	r2, r3, lr
 8002e54:	1880      	adds	r0, r0, r2
 8002e56:	fa43 f305 	asr.w	r3, r3, r5
 8002e5a:	4159      	adcs	r1, r3
 8002e5c:	e00e      	b.n	8002e7c <__adddf3+0xd0>
 8002e5e:	f1a5 0520 	sub.w	r5, r5, #32
 8002e62:	f10e 0e20 	add.w	lr, lr, #32
 8002e66:	2a01      	cmp	r2, #1
 8002e68:	fa03 fc0e 	lsl.w	ip, r3, lr
 8002e6c:	bf28      	it	cs
 8002e6e:	f04c 0c02 	orrcs.w	ip, ip, #2
 8002e72:	fa43 f305 	asr.w	r3, r3, r5
 8002e76:	18c0      	adds	r0, r0, r3
 8002e78:	eb51 71e3 	adcs.w	r1, r1, r3, asr #31
 8002e7c:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
 8002e80:	d507      	bpl.n	8002e92 <__adddf3+0xe6>
 8002e82:	f04f 0e00 	mov.w	lr, #0
 8002e86:	f1dc 0c00 	rsbs	ip, ip, #0
 8002e8a:	eb7e 0000 	sbcs.w	r0, lr, r0
 8002e8e:	eb6e 0101 	sbc.w	r1, lr, r1
 8002e92:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 8002e96:	d31b      	bcc.n	8002ed0 <__adddf3+0x124>
 8002e98:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
 8002e9c:	d30c      	bcc.n	8002eb8 <__adddf3+0x10c>
 8002e9e:	0849      	lsrs	r1, r1, #1
 8002ea0:	ea5f 0030 	movs.w	r0, r0, rrx
 8002ea4:	ea4f 0c3c 	mov.w	ip, ip, rrx
 8002ea8:	f104 0401 	add.w	r4, r4, #1
 8002eac:	ea4f 5244 	mov.w	r2, r4, lsl #21
 8002eb0:	f512 0f80 	cmn.w	r2, #4194304	; 0x400000
 8002eb4:	f080 809a 	bcs.w	8002fec <__adddf3+0x240>
 8002eb8:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
 8002ebc:	bf08      	it	eq
 8002ebe:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
 8002ec2:	f150 0000 	adcs.w	r0, r0, #0
 8002ec6:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
 8002eca:	ea41 0105 	orr.w	r1, r1, r5
 8002ece:	bd30      	pop	{r4, r5, pc}
 8002ed0:	ea5f 0c4c 	movs.w	ip, ip, lsl #1
 8002ed4:	4140      	adcs	r0, r0
 8002ed6:	eb41 0101 	adc.w	r1, r1, r1
 8002eda:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 8002ede:	f1a4 0401 	sub.w	r4, r4, #1
 8002ee2:	d1e9      	bne.n	8002eb8 <__adddf3+0x10c>
 8002ee4:	f091 0f00 	teq	r1, #0
 8002ee8:	bf04      	itt	eq
 8002eea:	4601      	moveq	r1, r0
 8002eec:	2000      	moveq	r0, #0
 8002eee:	fab1 f381 	clz	r3, r1
 8002ef2:	bf08      	it	eq
 8002ef4:	3320      	addeq	r3, #32
 8002ef6:	f1a3 030b 	sub.w	r3, r3, #11
 8002efa:	f1b3 0220 	subs.w	r2, r3, #32
 8002efe:	da0c      	bge.n	8002f1a <__adddf3+0x16e>
 8002f00:	320c      	adds	r2, #12
 8002f02:	dd08      	ble.n	8002f16 <__adddf3+0x16a>
 8002f04:	f102 0c14 	add.w	ip, r2, #20
 8002f08:	f1c2 020c 	rsb	r2, r2, #12
 8002f0c:	fa01 f00c 	lsl.w	r0, r1, ip
 8002f10:	fa21 f102 	lsr.w	r1, r1, r2
 8002f14:	e00c      	b.n	8002f30 <__adddf3+0x184>
 8002f16:	f102 0214 	add.w	r2, r2, #20
 8002f1a:	bfd8      	it	le
 8002f1c:	f1c2 0c20 	rsble	ip, r2, #32
 8002f20:	fa01 f102 	lsl.w	r1, r1, r2
 8002f24:	fa20 fc0c 	lsr.w	ip, r0, ip
 8002f28:	bfdc      	itt	le
 8002f2a:	ea41 010c 	orrle.w	r1, r1, ip
 8002f2e:	4090      	lslle	r0, r2
 8002f30:	1ae4      	subs	r4, r4, r3
 8002f32:	bfa2      	ittt	ge
 8002f34:	eb01 5104 	addge.w	r1, r1, r4, lsl #20
 8002f38:	4329      	orrge	r1, r5
 8002f3a:	bd30      	popge	{r4, r5, pc}
 8002f3c:	ea6f 0404 	mvn.w	r4, r4
 8002f40:	3c1f      	subs	r4, #31
 8002f42:	da1c      	bge.n	8002f7e <__adddf3+0x1d2>
 8002f44:	340c      	adds	r4, #12
 8002f46:	dc0e      	bgt.n	8002f66 <__adddf3+0x1ba>
 8002f48:	f104 0414 	add.w	r4, r4, #20
 8002f4c:	f1c4 0220 	rsb	r2, r4, #32
 8002f50:	fa20 f004 	lsr.w	r0, r0, r4
 8002f54:	fa01 f302 	lsl.w	r3, r1, r2
 8002f58:	ea40 0003 	orr.w	r0, r0, r3
 8002f5c:	fa21 f304 	lsr.w	r3, r1, r4
 8002f60:	ea45 0103 	orr.w	r1, r5, r3
 8002f64:	bd30      	pop	{r4, r5, pc}
 8002f66:	f1c4 040c 	rsb	r4, r4, #12
 8002f6a:	f1c4 0220 	rsb	r2, r4, #32
 8002f6e:	fa20 f002 	lsr.w	r0, r0, r2
 8002f72:	fa01 f304 	lsl.w	r3, r1, r4
 8002f76:	ea40 0003 	orr.w	r0, r0, r3
 8002f7a:	4629      	mov	r1, r5
 8002f7c:	bd30      	pop	{r4, r5, pc}
 8002f7e:	fa21 f004 	lsr.w	r0, r1, r4
 8002f82:	4629      	mov	r1, r5
 8002f84:	bd30      	pop	{r4, r5, pc}
 8002f86:	f094 0f00 	teq	r4, #0
 8002f8a:	f483 1380 	eor.w	r3, r3, #1048576	; 0x100000
 8002f8e:	bf06      	itte	eq
 8002f90:	f481 1180 	eoreq.w	r1, r1, #1048576	; 0x100000
 8002f94:	3401      	addeq	r4, #1
 8002f96:	3d01      	subne	r5, #1
 8002f98:	e74e      	b.n	8002e38 <__adddf3+0x8c>
 8002f9a:	ea7f 5c64 	mvns.w	ip, r4, asr #21
 8002f9e:	bf18      	it	ne
 8002fa0:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
 8002fa4:	d029      	beq.n	8002ffa <__adddf3+0x24e>
 8002fa6:	ea94 0f05 	teq	r4, r5
 8002faa:	bf08      	it	eq
 8002fac:	ea90 0f02 	teqeq	r0, r2
 8002fb0:	d005      	beq.n	8002fbe <__adddf3+0x212>
 8002fb2:	ea54 0c00 	orrs.w	ip, r4, r0
 8002fb6:	bf04      	itt	eq
 8002fb8:	4619      	moveq	r1, r3
 8002fba:	4610      	moveq	r0, r2
 8002fbc:	bd30      	pop	{r4, r5, pc}
 8002fbe:	ea91 0f03 	teq	r1, r3
 8002fc2:	bf1e      	ittt	ne
 8002fc4:	2100      	movne	r1, #0
 8002fc6:	2000      	movne	r0, #0
 8002fc8:	bd30      	popne	{r4, r5, pc}
 8002fca:	ea5f 5c54 	movs.w	ip, r4, lsr #21
 8002fce:	d105      	bne.n	8002fdc <__adddf3+0x230>
 8002fd0:	0040      	lsls	r0, r0, #1
 8002fd2:	4149      	adcs	r1, r1
 8002fd4:	bf28      	it	cs
 8002fd6:	f041 4100 	orrcs.w	r1, r1, #2147483648	; 0x80000000
 8002fda:	bd30      	pop	{r4, r5, pc}
 8002fdc:	f514 0480 	adds.w	r4, r4, #4194304	; 0x400000
 8002fe0:	bf3c      	itt	cc
 8002fe2:	f501 1180 	addcc.w	r1, r1, #1048576	; 0x100000
 8002fe6:	bd30      	popcc	{r4, r5, pc}
 8002fe8:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
 8002fec:	f045 41fe 	orr.w	r1, r5, #2130706432	; 0x7f000000
 8002ff0:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
 8002ff4:	f04f 0000 	mov.w	r0, #0
 8002ff8:	bd30      	pop	{r4, r5, pc}
 8002ffa:	ea7f 5c64 	mvns.w	ip, r4, asr #21
 8002ffe:	bf1a      	itte	ne
 8003000:	4619      	movne	r1, r3
 8003002:	4610      	movne	r0, r2
 8003004:	ea7f 5c65 	mvnseq.w	ip, r5, asr #21
 8003008:	bf1c      	itt	ne
 800300a:	460b      	movne	r3, r1
 800300c:	4602      	movne	r2, r0
 800300e:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
 8003012:	bf06      	itte	eq
 8003014:	ea52 3503 	orrseq.w	r5, r2, r3, lsl #12
 8003018:	ea91 0f03 	teqeq	r1, r3
 800301c:	f441 2100 	orrne.w	r1, r1, #524288	; 0x80000
 8003020:	bd30      	pop	{r4, r5, pc}
 8003022:	bf00      	nop

08003024 <__aeabi_ui2d>:
 8003024:	f090 0f00 	teq	r0, #0
 8003028:	bf04      	itt	eq
 800302a:	2100      	moveq	r1, #0
 800302c:	4770      	bxeq	lr
 800302e:	b530      	push	{r4, r5, lr}
 8003030:	f44f 6480 	mov.w	r4, #1024	; 0x400
 8003034:	f104 0432 	add.w	r4, r4, #50	; 0x32
 8003038:	f04f 0500 	mov.w	r5, #0
 800303c:	f04f 0100 	mov.w	r1, #0
 8003040:	e750      	b.n	8002ee4 <__adddf3+0x138>
 8003042:	bf00      	nop

08003044 <__aeabi_i2d>:
 8003044:	f090 0f00 	teq	r0, #0
 8003048:	bf04      	itt	eq
 800304a:	2100      	moveq	r1, #0
 800304c:	4770      	bxeq	lr
 800304e:	b530      	push	{r4, r5, lr}
 8003050:	f44f 6480 	mov.w	r4, #1024	; 0x400
 8003054:	f104 0432 	add.w	r4, r4, #50	; 0x32
 8003058:	f010 4500 	ands.w	r5, r0, #2147483648	; 0x80000000
 800305c:	bf48      	it	mi
 800305e:	4240      	negmi	r0, r0
 8003060:	f04f 0100 	mov.w	r1, #0
 8003064:	e73e      	b.n	8002ee4 <__adddf3+0x138>
 8003066:	bf00      	nop

08003068 <__aeabi_f2d>:
 8003068:	0042      	lsls	r2, r0, #1
 800306a:	ea4f 01e2 	mov.w	r1, r2, asr #3
 800306e:	ea4f 0131 	mov.w	r1, r1, rrx
 8003072:	ea4f 7002 	mov.w	r0, r2, lsl #28
 8003076:	bf1f      	itttt	ne
 8003078:	f012 437f 	andsne.w	r3, r2, #4278190080	; 0xff000000
 800307c:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
 8003080:	f081 5160 	eorne.w	r1, r1, #939524096	; 0x38000000
 8003084:	4770      	bxne	lr
 8003086:	f092 0f00 	teq	r2, #0
 800308a:	bf14      	ite	ne
 800308c:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
 8003090:	4770      	bxeq	lr
 8003092:	b530      	push	{r4, r5, lr}
 8003094:	f44f 7460 	mov.w	r4, #896	; 0x380
 8003098:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
 800309c:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
 80030a0:	e720      	b.n	8002ee4 <__adddf3+0x138>
 80030a2:	bf00      	nop

080030a4 <__aeabi_ul2d>:
 80030a4:	ea50 0201 	orrs.w	r2, r0, r1
 80030a8:	bf08      	it	eq
 80030aa:	4770      	bxeq	lr
 80030ac:	b530      	push	{r4, r5, lr}
 80030ae:	f04f 0500 	mov.w	r5, #0
 80030b2:	e00a      	b.n	80030ca <__aeabi_l2d+0x16>

080030b4 <__aeabi_l2d>:
 80030b4:	ea50 0201 	orrs.w	r2, r0, r1
 80030b8:	bf08      	it	eq
 80030ba:	4770      	bxeq	lr
 80030bc:	b530      	push	{r4, r5, lr}
 80030be:	f011 4500 	ands.w	r5, r1, #2147483648	; 0x80000000
 80030c2:	d502      	bpl.n	80030ca <__aeabi_l2d+0x16>
 80030c4:	4240      	negs	r0, r0
 80030c6:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
 80030ca:	f44f 6480 	mov.w	r4, #1024	; 0x400
 80030ce:	f104 0432 	add.w	r4, r4, #50	; 0x32
 80030d2:	ea5f 5c91 	movs.w	ip, r1, lsr #22
 80030d6:	f43f aedc 	beq.w	8002e92 <__adddf3+0xe6>
 80030da:	f04f 0203 	mov.w	r2, #3
 80030de:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
 80030e2:	bf18      	it	ne
 80030e4:	3203      	addne	r2, #3
 80030e6:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
 80030ea:	bf18      	it	ne
 80030ec:	3203      	addne	r2, #3
 80030ee:	eb02 02dc 	add.w	r2, r2, ip, lsr #3
 80030f2:	f1c2 0320 	rsb	r3, r2, #32
 80030f6:	fa00 fc03 	lsl.w	ip, r0, r3
 80030fa:	fa20 f002 	lsr.w	r0, r0, r2
 80030fe:	fa01 fe03 	lsl.w	lr, r1, r3
 8003102:	ea40 000e 	orr.w	r0, r0, lr
 8003106:	fa21 f102 	lsr.w	r1, r1, r2
 800310a:	4414      	add	r4, r2
 800310c:	e6c1      	b.n	8002e92 <__adddf3+0xe6>
 800310e:	bf00      	nop

08003110 <__aeabi_dmul>:
 8003110:	b570      	push	{r4, r5, r6, lr}
 8003112:	f04f 0cff 	mov.w	ip, #255	; 0xff
 8003116:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
 800311a:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
 800311e:	bf1d      	ittte	ne
 8003120:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
 8003124:	ea94 0f0c 	teqne	r4, ip
 8003128:	ea95 0f0c 	teqne	r5, ip
 800312c:	f000 f8de 	bleq	80032ec <__aeabi_dmul+0x1dc>
 8003130:	442c      	add	r4, r5
 8003132:	ea81 0603 	eor.w	r6, r1, r3
 8003136:	ea21 514c 	bic.w	r1, r1, ip, lsl #21
 800313a:	ea23 534c 	bic.w	r3, r3, ip, lsl #21
 800313e:	ea50 3501 	orrs.w	r5, r0, r1, lsl #12
 8003142:	bf18      	it	ne
 8003144:	ea52 3503 	orrsne.w	r5, r2, r3, lsl #12
 8003148:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 800314c:	f443 1380 	orr.w	r3, r3, #1048576	; 0x100000
 8003150:	d038      	beq.n	80031c4 <__aeabi_dmul+0xb4>
 8003152:	fba0 ce02 	umull	ip, lr, r0, r2
 8003156:	f04f 0500 	mov.w	r5, #0
 800315a:	fbe1 e502 	umlal	lr, r5, r1, r2
 800315e:	f006 4200 	and.w	r2, r6, #2147483648	; 0x80000000
 8003162:	fbe0 e503 	umlal	lr, r5, r0, r3
 8003166:	f04f 0600 	mov.w	r6, #0
 800316a:	fbe1 5603 	umlal	r5, r6, r1, r3
 800316e:	f09c 0f00 	teq	ip, #0
 8003172:	bf18      	it	ne
 8003174:	f04e 0e01 	orrne.w	lr, lr, #1
 8003178:	f1a4 04ff 	sub.w	r4, r4, #255	; 0xff
 800317c:	f5b6 7f00 	cmp.w	r6, #512	; 0x200
 8003180:	f564 7440 	sbc.w	r4, r4, #768	; 0x300
 8003184:	d204      	bcs.n	8003190 <__aeabi_dmul+0x80>
 8003186:	ea5f 0e4e 	movs.w	lr, lr, lsl #1
 800318a:	416d      	adcs	r5, r5
 800318c:	eb46 0606 	adc.w	r6, r6, r6
 8003190:	ea42 21c6 	orr.w	r1, r2, r6, lsl #11
 8003194:	ea41 5155 	orr.w	r1, r1, r5, lsr #21
 8003198:	ea4f 20c5 	mov.w	r0, r5, lsl #11
 800319c:	ea40 505e 	orr.w	r0, r0, lr, lsr #21
 80031a0:	ea4f 2ece 	mov.w	lr, lr, lsl #11
 80031a4:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
 80031a8:	bf88      	it	hi
 80031aa:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
 80031ae:	d81e      	bhi.n	80031ee <__aeabi_dmul+0xde>
 80031b0:	f1be 4f00 	cmp.w	lr, #2147483648	; 0x80000000
 80031b4:	bf08      	it	eq
 80031b6:	ea5f 0e50 	movseq.w	lr, r0, lsr #1
 80031ba:	f150 0000 	adcs.w	r0, r0, #0
 80031be:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
 80031c2:	bd70      	pop	{r4, r5, r6, pc}
 80031c4:	f006 4600 	and.w	r6, r6, #2147483648	; 0x80000000
 80031c8:	ea46 0101 	orr.w	r1, r6, r1
 80031cc:	ea40 0002 	orr.w	r0, r0, r2
 80031d0:	ea81 0103 	eor.w	r1, r1, r3
 80031d4:	ebb4 045c 	subs.w	r4, r4, ip, lsr #1
 80031d8:	bfc2      	ittt	gt
 80031da:	ebd4 050c 	rsbsgt	r5, r4, ip
 80031de:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
 80031e2:	bd70      	popgt	{r4, r5, r6, pc}
 80031e4:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 80031e8:	f04f 0e00 	mov.w	lr, #0
 80031ec:	3c01      	subs	r4, #1
 80031ee:	f300 80ab 	bgt.w	8003348 <__aeabi_dmul+0x238>
 80031f2:	f114 0f36 	cmn.w	r4, #54	; 0x36
 80031f6:	bfde      	ittt	le
 80031f8:	2000      	movle	r0, #0
 80031fa:	f001 4100 	andle.w	r1, r1, #2147483648	; 0x80000000
 80031fe:	bd70      	pople	{r4, r5, r6, pc}
 8003200:	f1c4 0400 	rsb	r4, r4, #0
 8003204:	3c20      	subs	r4, #32
 8003206:	da35      	bge.n	8003274 <__aeabi_dmul+0x164>
 8003208:	340c      	adds	r4, #12
 800320a:	dc1b      	bgt.n	8003244 <__aeabi_dmul+0x134>
 800320c:	f104 0414 	add.w	r4, r4, #20
 8003210:	f1c4 0520 	rsb	r5, r4, #32
 8003214:	fa00 f305 	lsl.w	r3, r0, r5
 8003218:	fa20 f004 	lsr.w	r0, r0, r4
 800321c:	fa01 f205 	lsl.w	r2, r1, r5
 8003220:	ea40 0002 	orr.w	r0, r0, r2
 8003224:	f001 4200 	and.w	r2, r1, #2147483648	; 0x80000000
 8003228:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
 800322c:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
 8003230:	fa21 f604 	lsr.w	r6, r1, r4
 8003234:	eb42 0106 	adc.w	r1, r2, r6
 8003238:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
 800323c:	bf08      	it	eq
 800323e:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
 8003242:	bd70      	pop	{r4, r5, r6, pc}
 8003244:	f1c4 040c 	rsb	r4, r4, #12
 8003248:	f1c4 0520 	rsb	r5, r4, #32
 800324c:	fa00 f304 	lsl.w	r3, r0, r4
 8003250:	fa20 f005 	lsr.w	r0, r0, r5
 8003254:	fa01 f204 	lsl.w	r2, r1, r4
 8003258:	ea40 0002 	orr.w	r0, r0, r2
 800325c:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 8003260:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
 8003264:	f141 0100 	adc.w	r1, r1, #0
 8003268:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
 800326c:	bf08      	it	eq
 800326e:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
 8003272:	bd70      	pop	{r4, r5, r6, pc}
 8003274:	f1c4 0520 	rsb	r5, r4, #32
 8003278:	fa00 f205 	lsl.w	r2, r0, r5
 800327c:	ea4e 0e02 	orr.w	lr, lr, r2
 8003280:	fa20 f304 	lsr.w	r3, r0, r4
 8003284:	fa01 f205 	lsl.w	r2, r1, r5
 8003288:	ea43 0302 	orr.w	r3, r3, r2
 800328c:	fa21 f004 	lsr.w	r0, r1, r4
 8003290:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 8003294:	fa21 f204 	lsr.w	r2, r1, r4
 8003298:	ea20 0002 	bic.w	r0, r0, r2
 800329c:	eb00 70d3 	add.w	r0, r0, r3, lsr #31
 80032a0:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
 80032a4:	bf08      	it	eq
 80032a6:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
 80032aa:	bd70      	pop	{r4, r5, r6, pc}
 80032ac:	f094 0f00 	teq	r4, #0
 80032b0:	d10f      	bne.n	80032d2 <__aeabi_dmul+0x1c2>
 80032b2:	f001 4600 	and.w	r6, r1, #2147483648	; 0x80000000
 80032b6:	0040      	lsls	r0, r0, #1
 80032b8:	eb41 0101 	adc.w	r1, r1, r1
 80032bc:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 80032c0:	bf08      	it	eq
 80032c2:	3c01      	subeq	r4, #1
 80032c4:	d0f7      	beq.n	80032b6 <__aeabi_dmul+0x1a6>
 80032c6:	ea41 0106 	orr.w	r1, r1, r6
 80032ca:	f095 0f00 	teq	r5, #0
 80032ce:	bf18      	it	ne
 80032d0:	4770      	bxne	lr
 80032d2:	f003 4600 	and.w	r6, r3, #2147483648	; 0x80000000
 80032d6:	0052      	lsls	r2, r2, #1
 80032d8:	eb43 0303 	adc.w	r3, r3, r3
 80032dc:	f413 1f80 	tst.w	r3, #1048576	; 0x100000
 80032e0:	bf08      	it	eq
 80032e2:	3d01      	subeq	r5, #1
 80032e4:	d0f7      	beq.n	80032d6 <__aeabi_dmul+0x1c6>
 80032e6:	ea43 0306 	orr.w	r3, r3, r6
 80032ea:	4770      	bx	lr
 80032ec:	ea94 0f0c 	teq	r4, ip
 80032f0:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
 80032f4:	bf18      	it	ne
 80032f6:	ea95 0f0c 	teqne	r5, ip
 80032fa:	d00c      	beq.n	8003316 <__aeabi_dmul+0x206>
 80032fc:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
 8003300:	bf18      	it	ne
 8003302:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
 8003306:	d1d1      	bne.n	80032ac <__aeabi_dmul+0x19c>
 8003308:	ea81 0103 	eor.w	r1, r1, r3
 800330c:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 8003310:	f04f 0000 	mov.w	r0, #0
 8003314:	bd70      	pop	{r4, r5, r6, pc}
 8003316:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
 800331a:	bf06      	itte	eq
 800331c:	4610      	moveq	r0, r2
 800331e:	4619      	moveq	r1, r3
 8003320:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
 8003324:	d019      	beq.n	800335a <__aeabi_dmul+0x24a>
 8003326:	ea94 0f0c 	teq	r4, ip
 800332a:	d102      	bne.n	8003332 <__aeabi_dmul+0x222>
 800332c:	ea50 3601 	orrs.w	r6, r0, r1, lsl #12
 8003330:	d113      	bne.n	800335a <__aeabi_dmul+0x24a>
 8003332:	ea95 0f0c 	teq	r5, ip
 8003336:	d105      	bne.n	8003344 <__aeabi_dmul+0x234>
 8003338:	ea52 3603 	orrs.w	r6, r2, r3, lsl #12
 800333c:	bf1c      	itt	ne
 800333e:	4610      	movne	r0, r2
 8003340:	4619      	movne	r1, r3
 8003342:	d10a      	bne.n	800335a <__aeabi_dmul+0x24a>
 8003344:	ea81 0103 	eor.w	r1, r1, r3
 8003348:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 800334c:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
 8003350:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
 8003354:	f04f 0000 	mov.w	r0, #0
 8003358:	bd70      	pop	{r4, r5, r6, pc}
 800335a:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
 800335e:	f441 0178 	orr.w	r1, r1, #16252928	; 0xf80000
 8003362:	bd70      	pop	{r4, r5, r6, pc}

08003364 <__aeabi_ddiv>:
 8003364:	b570      	push	{r4, r5, r6, lr}
 8003366:	f04f 0cff 	mov.w	ip, #255	; 0xff
 800336a:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
 800336e:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
 8003372:	bf1d      	ittte	ne
 8003374:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
 8003378:	ea94 0f0c 	teqne	r4, ip
 800337c:	ea95 0f0c 	teqne	r5, ip
 8003380:	f000 f8a7 	bleq	80034d2 <__aeabi_ddiv+0x16e>
 8003384:	eba4 0405 	sub.w	r4, r4, r5
 8003388:	ea81 0e03 	eor.w	lr, r1, r3
 800338c:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
 8003390:	ea4f 3101 	mov.w	r1, r1, lsl #12
 8003394:	f000 8088 	beq.w	80034a8 <__aeabi_ddiv+0x144>
 8003398:	ea4f 3303 	mov.w	r3, r3, lsl #12
 800339c:	f04f 5580 	mov.w	r5, #268435456	; 0x10000000
 80033a0:	ea45 1313 	orr.w	r3, r5, r3, lsr #4
 80033a4:	ea43 6312 	orr.w	r3, r3, r2, lsr #24
 80033a8:	ea4f 2202 	mov.w	r2, r2, lsl #8
 80033ac:	ea45 1511 	orr.w	r5, r5, r1, lsr #4
 80033b0:	ea45 6510 	orr.w	r5, r5, r0, lsr #24
 80033b4:	ea4f 2600 	mov.w	r6, r0, lsl #8
 80033b8:	f00e 4100 	and.w	r1, lr, #2147483648	; 0x80000000
 80033bc:	429d      	cmp	r5, r3
 80033be:	bf08      	it	eq
 80033c0:	4296      	cmpeq	r6, r2
 80033c2:	f144 04fd 	adc.w	r4, r4, #253	; 0xfd
 80033c6:	f504 7440 	add.w	r4, r4, #768	; 0x300
 80033ca:	d202      	bcs.n	80033d2 <__aeabi_ddiv+0x6e>
 80033cc:	085b      	lsrs	r3, r3, #1
 80033ce:	ea4f 0232 	mov.w	r2, r2, rrx
 80033d2:	1ab6      	subs	r6, r6, r2
 80033d4:	eb65 0503 	sbc.w	r5, r5, r3
 80033d8:	085b      	lsrs	r3, r3, #1
 80033da:	ea4f 0232 	mov.w	r2, r2, rrx
 80033de:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
 80033e2:	f44f 2c00 	mov.w	ip, #524288	; 0x80000
 80033e6:	ebb6 0e02 	subs.w	lr, r6, r2
 80033ea:	eb75 0e03 	sbcs.w	lr, r5, r3
 80033ee:	bf22      	ittt	cs
 80033f0:	1ab6      	subcs	r6, r6, r2
 80033f2:	4675      	movcs	r5, lr
 80033f4:	ea40 000c 	orrcs.w	r0, r0, ip
 80033f8:	085b      	lsrs	r3, r3, #1
 80033fa:	ea4f 0232 	mov.w	r2, r2, rrx
 80033fe:	ebb6 0e02 	subs.w	lr, r6, r2
 8003402:	eb75 0e03 	sbcs.w	lr, r5, r3
 8003406:	bf22      	ittt	cs
 8003408:	1ab6      	subcs	r6, r6, r2
 800340a:	4675      	movcs	r5, lr
 800340c:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
 8003410:	085b      	lsrs	r3, r3, #1
 8003412:	ea4f 0232 	mov.w	r2, r2, rrx
 8003416:	ebb6 0e02 	subs.w	lr, r6, r2
 800341a:	eb75 0e03 	sbcs.w	lr, r5, r3
 800341e:	bf22      	ittt	cs
 8003420:	1ab6      	subcs	r6, r6, r2
 8003422:	4675      	movcs	r5, lr
 8003424:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
 8003428:	085b      	lsrs	r3, r3, #1
 800342a:	ea4f 0232 	mov.w	r2, r2, rrx
 800342e:	ebb6 0e02 	subs.w	lr, r6, r2
 8003432:	eb75 0e03 	sbcs.w	lr, r5, r3
 8003436:	bf22      	ittt	cs
 8003438:	1ab6      	subcs	r6, r6, r2
 800343a:	4675      	movcs	r5, lr
 800343c:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
 8003440:	ea55 0e06 	orrs.w	lr, r5, r6
 8003444:	d018      	beq.n	8003478 <__aeabi_ddiv+0x114>
 8003446:	ea4f 1505 	mov.w	r5, r5, lsl #4
 800344a:	ea45 7516 	orr.w	r5, r5, r6, lsr #28
 800344e:	ea4f 1606 	mov.w	r6, r6, lsl #4
 8003452:	ea4f 03c3 	mov.w	r3, r3, lsl #3
 8003456:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
 800345a:	ea4f 02c2 	mov.w	r2, r2, lsl #3
 800345e:	ea5f 1c1c 	movs.w	ip, ip, lsr #4
 8003462:	d1c0      	bne.n	80033e6 <__aeabi_ddiv+0x82>
 8003464:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 8003468:	d10b      	bne.n	8003482 <__aeabi_ddiv+0x11e>
 800346a:	ea41 0100 	orr.w	r1, r1, r0
 800346e:	f04f 0000 	mov.w	r0, #0
 8003472:	f04f 4c00 	mov.w	ip, #2147483648	; 0x80000000
 8003476:	e7b6      	b.n	80033e6 <__aeabi_ddiv+0x82>
 8003478:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 800347c:	bf04      	itt	eq
 800347e:	4301      	orreq	r1, r0
 8003480:	2000      	moveq	r0, #0
 8003482:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
 8003486:	bf88      	it	hi
 8003488:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
 800348c:	f63f aeaf 	bhi.w	80031ee <__aeabi_dmul+0xde>
 8003490:	ebb5 0c03 	subs.w	ip, r5, r3
 8003494:	bf04      	itt	eq
 8003496:	ebb6 0c02 	subseq.w	ip, r6, r2
 800349a:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
 800349e:	f150 0000 	adcs.w	r0, r0, #0
 80034a2:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
 80034a6:	bd70      	pop	{r4, r5, r6, pc}
 80034a8:	f00e 4e00 	and.w	lr, lr, #2147483648	; 0x80000000
 80034ac:	ea4e 3111 	orr.w	r1, lr, r1, lsr #12
 80034b0:	eb14 045c 	adds.w	r4, r4, ip, lsr #1
 80034b4:	bfc2      	ittt	gt
 80034b6:	ebd4 050c 	rsbsgt	r5, r4, ip
 80034ba:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
 80034be:	bd70      	popgt	{r4, r5, r6, pc}
 80034c0:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 80034c4:	f04f 0e00 	mov.w	lr, #0
 80034c8:	3c01      	subs	r4, #1
 80034ca:	e690      	b.n	80031ee <__aeabi_dmul+0xde>
 80034cc:	ea45 0e06 	orr.w	lr, r5, r6
 80034d0:	e68d      	b.n	80031ee <__aeabi_dmul+0xde>
 80034d2:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
 80034d6:	ea94 0f0c 	teq	r4, ip
 80034da:	bf08      	it	eq
 80034dc:	ea95 0f0c 	teqeq	r5, ip
 80034e0:	f43f af3b 	beq.w	800335a <__aeabi_dmul+0x24a>
 80034e4:	ea94 0f0c 	teq	r4, ip
 80034e8:	d10a      	bne.n	8003500 <__aeabi_ddiv+0x19c>
 80034ea:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
 80034ee:	f47f af34 	bne.w	800335a <__aeabi_dmul+0x24a>
 80034f2:	ea95 0f0c 	teq	r5, ip
 80034f6:	f47f af25 	bne.w	8003344 <__aeabi_dmul+0x234>
 80034fa:	4610      	mov	r0, r2
 80034fc:	4619      	mov	r1, r3
 80034fe:	e72c      	b.n	800335a <__aeabi_dmul+0x24a>
 8003500:	ea95 0f0c 	teq	r5, ip
 8003504:	d106      	bne.n	8003514 <__aeabi_ddiv+0x1b0>
 8003506:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
 800350a:	f43f aefd 	beq.w	8003308 <__aeabi_dmul+0x1f8>
 800350e:	4610      	mov	r0, r2
 8003510:	4619      	mov	r1, r3
 8003512:	e722      	b.n	800335a <__aeabi_dmul+0x24a>
 8003514:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
 8003518:	bf18      	it	ne
 800351a:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
 800351e:	f47f aec5 	bne.w	80032ac <__aeabi_dmul+0x19c>
 8003522:	ea50 0441 	orrs.w	r4, r0, r1, lsl #1
 8003526:	f47f af0d 	bne.w	8003344 <__aeabi_dmul+0x234>
 800352a:	ea52 0543 	orrs.w	r5, r2, r3, lsl #1
 800352e:	f47f aeeb 	bne.w	8003308 <__aeabi_dmul+0x1f8>
 8003532:	e712      	b.n	800335a <__aeabi_dmul+0x24a>

08003534 <__aeabi_d2iz>:
 8003534:	ea4f 0241 	mov.w	r2, r1, lsl #1
 8003538:	f512 1200 	adds.w	r2, r2, #2097152	; 0x200000
 800353c:	d215      	bcs.n	800356a <__aeabi_d2iz+0x36>
 800353e:	d511      	bpl.n	8003564 <__aeabi_d2iz+0x30>
 8003540:	f46f 7378 	mvn.w	r3, #992	; 0x3e0
 8003544:	ebb3 5262 	subs.w	r2, r3, r2, asr #21
 8003548:	d912      	bls.n	8003570 <__aeabi_d2iz+0x3c>
 800354a:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 800354e:	f043 4300 	orr.w	r3, r3, #2147483648	; 0x80000000
 8003552:	ea43 5350 	orr.w	r3, r3, r0, lsr #21
 8003556:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
 800355a:	fa23 f002 	lsr.w	r0, r3, r2
 800355e:	bf18      	it	ne
 8003560:	4240      	negne	r0, r0
 8003562:	4770      	bx	lr
 8003564:	f04f 0000 	mov.w	r0, #0
 8003568:	4770      	bx	lr
 800356a:	ea50 3001 	orrs.w	r0, r0, r1, lsl #12
 800356e:	d105      	bne.n	800357c <__aeabi_d2iz+0x48>
 8003570:	f011 4000 	ands.w	r0, r1, #2147483648	; 0x80000000
 8003574:	bf08      	it	eq
 8003576:	f06f 4000 	mvneq.w	r0, #2147483648	; 0x80000000
 800357a:	4770      	bx	lr
 800357c:	f04f 0000 	mov.w	r0, #0
 8003580:	4770      	bx	lr
 8003582:	bf00      	nop

08003584 <__aeabi_d2uiz>:
 8003584:	004a      	lsls	r2, r1, #1
 8003586:	d211      	bcs.n	80035ac <__aeabi_d2uiz+0x28>
 8003588:	f512 1200 	adds.w	r2, r2, #2097152	; 0x200000
 800358c:	d211      	bcs.n	80035b2 <__aeabi_d2uiz+0x2e>
 800358e:	d50d      	bpl.n	80035ac <__aeabi_d2uiz+0x28>
 8003590:	f46f 7378 	mvn.w	r3, #992	; 0x3e0
 8003594:	ebb3 5262 	subs.w	r2, r3, r2, asr #21
 8003598:	d40e      	bmi.n	80035b8 <__aeabi_d2uiz+0x34>
 800359a:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 800359e:	f043 4300 	orr.w	r3, r3, #2147483648	; 0x80000000
 80035a2:	ea43 5350 	orr.w	r3, r3, r0, lsr #21
 80035a6:	fa23 f002 	lsr.w	r0, r3, r2
 80035aa:	4770      	bx	lr
 80035ac:	f04f 0000 	mov.w	r0, #0
 80035b0:	4770      	bx	lr
 80035b2:	ea50 3001 	orrs.w	r0, r0, r1, lsl #12
 80035b6:	d102      	bne.n	80035be <__aeabi_d2uiz+0x3a>
 80035b8:	f04f 30ff 	mov.w	r0, #4294967295
 80035bc:	4770      	bx	lr
 80035be:	f04f 0000 	mov.w	r0, #0
 80035c2:	4770      	bx	lr

080035c4 <__aeabi_d2f>:
 80035c4:	ea4f 0241 	mov.w	r2, r1, lsl #1
 80035c8:	f1b2 43e0 	subs.w	r3, r2, #1879048192	; 0x70000000
 80035cc:	bf24      	itt	cs
 80035ce:	f5b3 1c00 	subscs.w	ip, r3, #2097152	; 0x200000
 80035d2:	f1dc 5cfe 	rsbscs	ip, ip, #532676608	; 0x1fc00000
 80035d6:	d90d      	bls.n	80035f4 <__aeabi_d2f+0x30>
 80035d8:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
 80035dc:	ea4f 02c0 	mov.w	r2, r0, lsl #3
 80035e0:	ea4c 7050 	orr.w	r0, ip, r0, lsr #29
 80035e4:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
 80035e8:	eb40 0083 	adc.w	r0, r0, r3, lsl #2
 80035ec:	bf08      	it	eq
 80035ee:	f020 0001 	biceq.w	r0, r0, #1
 80035f2:	4770      	bx	lr
 80035f4:	f011 4f80 	tst.w	r1, #1073741824	; 0x40000000
 80035f8:	d121      	bne.n	800363e <__aeabi_d2f+0x7a>
 80035fa:	f113 7238 	adds.w	r2, r3, #48234496	; 0x2e00000
 80035fe:	bfbc      	itt	lt
 8003600:	f001 4000 	andlt.w	r0, r1, #2147483648	; 0x80000000
 8003604:	4770      	bxlt	lr
 8003606:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 800360a:	ea4f 5252 	mov.w	r2, r2, lsr #21
 800360e:	f1c2 0218 	rsb	r2, r2, #24
 8003612:	f1c2 0c20 	rsb	ip, r2, #32
 8003616:	fa10 f30c 	lsls.w	r3, r0, ip
 800361a:	fa20 f002 	lsr.w	r0, r0, r2
 800361e:	bf18      	it	ne
 8003620:	f040 0001 	orrne.w	r0, r0, #1
 8003624:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 8003628:	ea4f 23d3 	mov.w	r3, r3, lsr #11
 800362c:	fa03 fc0c 	lsl.w	ip, r3, ip
 8003630:	ea40 000c 	orr.w	r0, r0, ip
 8003634:	fa23 f302 	lsr.w	r3, r3, r2
 8003638:	ea4f 0343 	mov.w	r3, r3, lsl #1
 800363c:	e7cc      	b.n	80035d8 <__aeabi_d2f+0x14>
 800363e:	ea7f 5362 	mvns.w	r3, r2, asr #21
 8003642:	d107      	bne.n	8003654 <__aeabi_d2f+0x90>
 8003644:	ea50 3301 	orrs.w	r3, r0, r1, lsl #12
 8003648:	bf1e      	ittt	ne
 800364a:	f04f 40fe 	movne.w	r0, #2130706432	; 0x7f000000
 800364e:	f440 0040 	orrne.w	r0, r0, #12582912	; 0xc00000
 8003652:	4770      	bxne	lr
 8003654:	f001 4000 	and.w	r0, r1, #2147483648	; 0x80000000
 8003658:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
 800365c:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
 8003660:	4770      	bx	lr
 8003662:	bf00      	nop

08003664 <round>:
 8003664:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8003666:	f3c1 560a 	ubfx	r6, r1, #20, #11
 800366a:	f2a6 35ff 	subw	r5, r6, #1023	; 0x3ff
 800366e:	2d13      	cmp	r5, #19
 8003670:	460a      	mov	r2, r1
 8003672:	460b      	mov	r3, r1
 8003674:	4604      	mov	r4, r0
 8003676:	4686      	mov	lr, r0
 8003678:	dc11      	bgt.n	800369e <round+0x3a>
 800367a:	2d00      	cmp	r5, #0
 800367c:	db2e      	blt.n	80036dc <round+0x78>
 800367e:	460f      	mov	r7, r1
 8003680:	491f      	ldr	r1, [pc, #124]	; (8003700 <round+0x9c>)
 8003682:	4129      	asrs	r1, r5
 8003684:	420a      	tst	r2, r1
 8003686:	d025      	beq.n	80036d4 <round+0x70>
 8003688:	f44f 2300 	mov.w	r3, #524288	; 0x80000
 800368c:	412b      	asrs	r3, r5
 800368e:	443b      	add	r3, r7
 8003690:	ea23 0301 	bic.w	r3, r3, r1
 8003694:	2600      	movs	r6, #0
 8003696:	4619      	mov	r1, r3
 8003698:	4634      	mov	r4, r6
 800369a:	4620      	mov	r0, r4
 800369c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800369e:	2d33      	cmp	r5, #51	; 0x33
 80036a0:	dd05      	ble.n	80036ae <round+0x4a>
 80036a2:	f5b5 6f80 	cmp.w	r5, #1024	; 0x400
 80036a6:	d01f      	beq.n	80036e8 <round+0x84>
 80036a8:	4611      	mov	r1, r2
 80036aa:	4620      	mov	r0, r4
 80036ac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80036ae:	f2a6 4613 	subw	r6, r6, #1043	; 0x413
 80036b2:	f04f 31ff 	mov.w	r1, #4294967295
 80036b6:	fa21 f606 	lsr.w	r6, r1, r6
 80036ba:	4230      	tst	r0, r6
 80036bc:	d0f4      	beq.n	80036a8 <round+0x44>
 80036be:	2201      	movs	r2, #1
 80036c0:	f1c5 0533 	rsb	r5, r5, #51	; 0x33
 80036c4:	fa02 f505 	lsl.w	r5, r2, r5
 80036c8:	182d      	adds	r5, r5, r0
 80036ca:	bf28      	it	cs
 80036cc:	189b      	addcs	r3, r3, r2
 80036ce:	ea25 0606 	bic.w	r6, r5, r6
 80036d2:	e7e0      	b.n	8003696 <round+0x32>
 80036d4:	2800      	cmp	r0, #0
 80036d6:	d1d7      	bne.n	8003688 <round+0x24>
 80036d8:	4611      	mov	r1, r2
 80036da:	e7e6      	b.n	80036aa <round+0x46>
 80036dc:	3501      	adds	r5, #1
 80036de:	f001 4300 	and.w	r3, r1, #2147483648	; 0x80000000
 80036e2:	d007      	beq.n	80036f4 <round+0x90>
 80036e4:	2600      	movs	r6, #0
 80036e6:	e7d6      	b.n	8003696 <round+0x32>
 80036e8:	4602      	mov	r2, r0
 80036ea:	460b      	mov	r3, r1
 80036ec:	f7ff fb5e 	bl	8002dac <__adddf3>
 80036f0:	4604      	mov	r4, r0
 80036f2:	e7d2      	b.n	800369a <round+0x36>
 80036f4:	f043 537f 	orr.w	r3, r3, #1069547520	; 0x3fc00000
 80036f8:	f443 1340 	orr.w	r3, r3, #3145728	; 0x300000
 80036fc:	2600      	movs	r6, #0
 80036fe:	e7ca      	b.n	8003696 <round+0x32>
 8003700:	000fffff 	.word	0x000fffff
 8003704:	6c383025 	.word	0x6c383025
 8003708:	00002058 	.word	0x00002058
 800370c:	32302520 	.word	0x32302520
 8003710:	00000058 	.word	0x00000058
 8003714:	34302520 	.word	0x34302520
 8003718:	00000058 	.word	0x00000058
 800371c:	38302520 	.word	0x38302520
 8003720:	0000584c 	.word	0x0000584c
 8003724:	00004b4f 	.word	0x00004b4f
 8003728:	4f525245 	.word	0x4f525245
 800372c:	00000052 	.word	0x00000052
 8003730:	00006325 	.word	0x00006325
 8003734:	0000000a 	.word	0x0000000a
 8003738:	5d78255b 	.word	0x5d78255b
 800373c:	00000000 	.word	0x00000000
 8003740:	000a4b4f 	.word	0x000a4b4f
 8003744:	4f525245 	.word	0x4f525245
 8003748:	00000a52 	.word	0x00000a52
 800374c:	474d432b 	.word	0x474d432b
 8003750:	00003a53 	.word	0x00003a53
 8003754:	0000003e 	.word	0x0000003e
 8003758:	0000001a 	.word	0x0000001a
 800375c:	25207325 	.word	0x25207325
 8003760:	00000a64 	.word	0x00000a64
 8003764:	4f525245 	.word	0x4f525245
 8003768:	69732052 	.word	0x69732052
 800376c:	65735f6d 	.word	0x65735f6d
 8003770:	735f646e 	.word	0x735f646e
 8003774:	735f736d 	.word	0x735f736d
 8003778:	29287165 	.word	0x29287165
 800377c:	0000000a 	.word	0x0000000a
 8003780:	432b5441 	.word	0x432b5441
 8003784:	3d53474d 	.word	0x3d53474d
	...
 8003790:	000a7325 	.word	0x000a7325
 8003794:	544d432b 	.word	0x544d432b
 8003798:	00000000 	.word	0x00000000
 800379c:	4353432b 	.word	0x4353432b
 80037a0:	00003a41 	.word	0x00003a41
 80037a4:	4552432b 	.word	0x4552432b
 80037a8:	31203a47 	.word	0x31203a47
 80037ac:	00000000 	.word	0x00000000
 80037b0:	432b5441 	.word	0x432b5441
 80037b4:	3f414353 	.word	0x3f414353
 80037b8:	0000000d 	.word	0x0000000d
 80037bc:	4950432b 	.word	0x4950432b
 80037c0:	00003a4e 	.word	0x00003a4e
 80037c4:	44414552 	.word	0x44414552
 80037c8:	00000059 	.word	0x00000059
 80037cc:	204d4953 	.word	0x204d4953
 80037d0:	004e4950 	.word	0x004e4950
 80037d4:	432b5441 	.word	0x432b5441
 80037d8:	3d4e4950 	.word	0x3d4e4950
 80037dc:	36393730 	.word	0x36393730
 80037e0:	0000000d 	.word	0x0000000d
 80037e4:	4f525245 	.word	0x4f525245
 80037e8:	69733a52 	.word	0x69733a52
 80037ec:	6163206d 	.word	0x6163206d
 80037f0:	69206472 	.word	0x69206472
 80037f4:	746e2773 	.word	0x746e2773
 80037f8:	736e6920 	.word	0x736e6920
 80037fc:	65747265 	.word	0x65747265
 8003800:	00000a64 	.word	0x00000a64
 8003804:	64616552 	.word	0x64616552
 8003808:	6f726620 	.word	0x6f726620
 800380c:	6162206d 	.word	0x6162206d
 8003810:	70756b63 	.word	0x70756b63
 8003814:	3d48203a 	.word	0x3d48203a
 8003818:	54206425 	.word	0x54206425
 800381c:	3d6e696d 	.word	0x3d6e696d
 8003820:	54206425 	.word	0x54206425
 8003824:	3d78616d 	.word	0x3d78616d
 8003828:	000a6425 	.word	0x000a6425
 800382c:	6b636142 	.word	0x6b636142
 8003830:	69207075 	.word	0x69207075
 8003834:	746e2773 	.word	0x746e2773
 8003838:	756f6620 	.word	0x756f6620
 800383c:	2d20646e 	.word	0x2d20646e
 8003840:	74657320 	.word	0x74657320
 8003844:	66656420 	.word	0x66656420
 8003848:	746c7561 	.word	0x746c7561
 800384c:	72617020 	.word	0x72617020
 8003850:	0a736d61 	.word	0x0a736d61
 8003854:	00000000 	.word	0x00000000
 8003858:	636c6557 	.word	0x636c6557
 800385c:	0a656d6f 	.word	0x0a656d6f
 8003860:	00000000 	.word	0x00000000
 8003864:	b5d0a2d0 	.word	0xb5d0a2d0
 8003868:	bfd0bcd0 	.word	0xbfd0bcd0
 800386c:	80d1b5d0 	.word	0x80d1b5d0
 8003870:	82d1b0d0 	.word	0x82d1b0d0
 8003874:	80d183d1 	.word	0x80d183d1
 8003878:	0000b0d0 	.word	0x0000b0d0
 800387c:	b5d0a2d0 	.word	0xb5d0a2d0
 8003880:	bfd0bcd0 	.word	0xbfd0bcd0
 8003884:	80d1b5d0 	.word	0x80d1b5d0
 8003888:	82d1b0d0 	.word	0x82d1b0d0
 800388c:	80d183d1 	.word	0x80d183d1
 8003890:	2520b0d0 	.word	0x2520b0d0
 8003894:	00000064 	.word	0x00000064
 8003898:	bed09fd0 	.word	0xbed09fd0
 800389c:	bed080d1 	.word	0xbed080d1
 80038a0:	0000b3d0 	.word	0x0000b3d0
 80038a4:	b5d0a2d0 	.word	0xb5d0a2d0
 80038a8:	83d1bad0 	.word	0x83d1bad0
 80038ac:	b8d089d1 	.word	0xb8d089d1
 80038b0:	d020b9d0 	.word	0xd020b9d0
 80038b4:	d1bed0bf 	.word	0xd1bed0bf
 80038b8:	d0bed080 	.word	0xd0bed080
 80038bc:	642520b3 	.word	0x642520b3
 80038c0:	00000000 	.word	0x00000000
 80038c4:	81d1a3d0 	.word	0x81d1a3d0
 80038c8:	b0d082d1 	.word	0xb0d082d1
 80038cc:	bed0bdd0 	.word	0xbed0bdd0
 80038d0:	bbd0b2d0 	.word	0xbbd0b2d0
 80038d4:	bdd0b5d0 	.word	0xbdd0b5d0
 80038d8:	d0bfd020 	.word	0xd0bfd020
 80038dc:	d080d1be 	.word	0xd080d1be
 80038e0:	20b3d0be 	.word	0x20b3d0be
 80038e4:	00006425 	.word	0x00006425
 80038e8:	88d19ed0 	.word	0x88d19ed0
 80038ec:	b1d0b8d0 	.word	0xb1d0b8d0
 80038f0:	b0d0bad0 	.word	0xb0d0bad0
 80038f4:	342d203a 	.word	0x342d203a
 80038f8:	203c2030 	.word	0x203c2030
 80038fc:	203c2054 	.word	0x203c2054
 8003900:	00353231 	.word	0x00353231
 8003904:	b7d098d0 	.word	0xb7d098d0
 8003908:	b8d0b2d0 	.word	0xb8d0b2d0
 800390c:	b8d0bdd0 	.word	0xb8d0bdd0
 8003910:	b5d082d1 	.word	0xb5d082d1
 8003914:	d0bad020 	.word	0xd0bad020
 8003918:	d0bcd0be 	.word	0xd0bcd0be
 800391c:	d0bdd0b0 	.word	0xd0bdd0b0
 8003920:	20b0d0b4 	.word	0x20b0d0b4
 8003924:	b5d0bdd0 	.word	0xb5d0bdd0
 8003928:	d0bfd020 	.word	0xd0bfd020
 800392c:	d0b4d0be 	.word	0xd0b4d0be
 8003930:	d1b5d0b4 	.word	0xd1b5d0b4
 8003934:	d0b6d080 	.word	0xd0b6d080
 8003938:	d0b2d0b8 	.word	0xd0b2d0b8
 800393c:	d1b5d0b0 	.word	0xd1b5d0b0
 8003940:	d181d182 	.word	0xd181d182
 8003944:	0000008f 	.word	0x0000008f
 8003948:	72616c41 	.word	0x72616c41
 800394c:	6425206d 	.word	0x6425206d
 8003950:	0a642520 	.word	0x0a642520
 8003954:	00000000 	.word	0x00000000
 8003958:	9dd092d0 	.word	0x9dd092d0
 800395c:	9cd098d0 	.word	0x9cd098d0
 8003960:	9dd090d0 	.word	0x9dd090d0
 8003964:	95d098d0 	.word	0x95d098d0
 8003968:	d0bdd020 	.word	0xd0bdd020
 800396c:	d0b4d0b5 	.word	0xd0b4d0b5
 8003970:	d1bfd0be 	.word	0xd1bfd0be
 8003974:	d181d183 	.word	0xd181d183
 8003978:	d0b8d082 	.word	0xd0b8d082
 800397c:	d1b0d0bc 	.word	0xd1b0d0bc
 8003980:	82d1208f 	.word	0x82d1208f
 8003984:	bcd0b5d0 	.word	0xbcd0b5d0
 8003988:	b5d0bfd0 	.word	0xb5d0bfd0
 800398c:	b0d080d1 	.word	0xb0d080d1
 8003990:	83d182d1 	.word	0x83d182d1
 8003994:	b0d080d1 	.word	0xb0d080d1
 8003998:	6425203a 	.word	0x6425203a
 800399c:	00000021 	.word	0x00000021
 80039a0:	65776f50 	.word	0x65776f50
 80039a4:	6c412072 	.word	0x6c412072
 80039a8:	0a6d7261 	.word	0x0a6d7261
 80039ac:	00000000 	.word	0x00000000
 80039b0:	9dd092d0 	.word	0x9dd092d0
 80039b4:	9cd098d0 	.word	0x9cd098d0
 80039b8:	9dd090d0 	.word	0x9dd090d0
 80039bc:	95d098d0 	.word	0x95d098d0
 80039c0:	d0bdd020 	.word	0xd0bdd020
 80039c4:	d1b8d0b5 	.word	0xd1b8d0b5
 80039c8:	d1bfd081 	.word	0xd1bfd081
 80039cc:	d0b0d080 	.word	0xd0b0d080
 80039d0:	d0bdd0b2 	.word	0xd0bdd0b2
 80039d4:	d181d1be 	.word	0xd181d1be
 80039d8:	208cd182 	.word	0x208cd182
 80039dc:	b8d0bfd0 	.word	0xb8d0bfd0
 80039e0:	b0d082d1 	.word	0xb0d082d1
 80039e4:	b8d0bdd0 	.word	0xb8d0bdd0
 80039e8:	00218fd1 	.word	0x00218fd1
 80039ec:	65776f50 	.word	0x65776f50
 80039f0:	4b4f2072 	.word	0x4b4f2072
 80039f4:	0000000a 	.word	0x0000000a
 80039f8:	b8d09fd0 	.word	0xb8d09fd0
 80039fc:	b0d082d1 	.word	0xb0d082d1
 8003a00:	b8d0bdd0 	.word	0xb8d0bdd0
 8003a04:	d020b5d0 	.word	0xd020b5d0
 8003a08:	bdd020b2 	.word	0xbdd020b2
 8003a0c:	80d1bed0 	.word	0x80d1bed0
 8003a10:	b5d0bcd0 	.word	0xb5d0bcd0
 8003a14:	00000000 	.word	0x00000000
 8003a18:	74737953 	.word	0x74737953
 8003a1c:	68206d65 	.word	0x68206d65
 8003a20:	62207361 	.word	0x62207361
 8003a24:	206e6565 	.word	0x206e6565
 8003a28:	6f626572 	.word	0x6f626572
 8003a2c:	6465746f 	.word	0x6465746f
 8003a30:	0000000a 	.word	0x0000000a
