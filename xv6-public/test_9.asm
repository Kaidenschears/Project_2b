
_test_9:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"
#include "pstat.h"

int
main(int argc, char *argv[]){
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	81 ec 18 04 00 00    	sub    $0x418,%esp
	int pid_par = getpid();
    1017:	e8 c7 03 00 00       	call   13e3 <getpid>
	int tickets = 0;
	
	if(settickets(tickets) == 0)
    101c:	83 ec 0c             	sub    $0xc,%esp
    101f:	6a 00                	push   $0x0
	int pid_par = getpid();
    1021:	89 c3                	mov    %eax,%ebx
	if(settickets(tickets) == 0)
    1023:	e8 e3 03 00 00       	call   140b <settickets>
    1028:	83 c4 10             	add    $0x10,%esp
    102b:	85 c0                	test   %eax,%eax
    102d:	75 1f                	jne    104e <main+0x4e>
	{
	 printf(1, "XV6_SCHEDULER\t FAILED\n");
	 exit();
	}
	
	if(fork() == 0){
    102f:	e8 27 03 00 00       	call   135b <fork>
    1034:	85 c0                	test   %eax,%eax
    1036:	74 29                	je     1061 <main+0x61>
    1038:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103f:	90                   	nop
		 printf(1, "XV6_SCHEDULER\t FAILED\n");
		}

    exit();
	}
  	while(wait() > 0);
    1040:	e8 26 03 00 00       	call   136b <wait>
    1045:	85 c0                	test   %eax,%eax
    1047:	7f f7                	jg     1040 <main+0x40>
    exit();
    1049:	e8 15 03 00 00       	call   1363 <exit>
	 printf(1, "XV6_SCHEDULER\t FAILED\n");
    104e:	51                   	push   %ecx
    104f:	51                   	push   %ecx
    1050:	68 08 18 00 00       	push   $0x1808
    1055:	6a 01                	push   $0x1
    1057:	e8 84 04 00 00       	call   14e0 <printf>
	 exit();
    105c:	e8 02 03 00 00       	call   1363 <exit>
		int pid_chd = getpid();
    1061:	e8 7d 03 00 00       	call   13e3 <getpid>
		if(getpinfo(&st) == 0)
    1066:	83 ec 0c             	sub    $0xc,%esp
		int pid_chd = getpid();
    1069:	89 c6                	mov    %eax,%esi
		if(getpinfo(&st) == 0)
    106b:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
    1071:	50                   	push   %eax
    1072:	e8 8c 03 00 00       	call   1403 <getpinfo>
    1077:	83 c4 10             	add    $0x10,%esp
    107a:	85 c0                	test   %eax,%eax
    107c:	75 d0                	jne    104e <main+0x4e>
    107e:	8d 85 e8 fc ff ff    	lea    -0x318(%ebp),%eax
    1084:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
		int tickets_par = -1,tickets_chd = -1;
    108a:	83 cf ff             	or     $0xffffffff,%edi
    108d:	c7 85 e4 fb ff ff ff 	movl   $0xffffffff,-0x41c(%ebp)
    1094:	ff ff ff 
    1097:	eb 1a                	jmp    10b3 <main+0xb3>
    1099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			else if (st.pid[i] == pid_chd){
    10a0:	39 f2                	cmp    %esi,%edx
    10a2:	75 08                	jne    10ac <main+0xac>
				tickets_chd = st.tickets[i];
    10a4:	8b 10                	mov    (%eax),%edx
    10a6:	89 95 e4 fb ff ff    	mov    %edx,-0x41c(%ebp)
		for(int i = 0; i < NPROC; i++){
    10ac:	83 c0 04             	add    $0x4,%eax
    10af:	39 c8                	cmp    %ecx,%eax
    10b1:	74 13                	je     10c6 <main+0xc6>
      			if (st.pid[i] == pid_par){
    10b3:	8b 90 00 01 00 00    	mov    0x100(%eax),%edx
    10b9:	39 da                	cmp    %ebx,%edx
    10bb:	75 e3                	jne    10a0 <main+0xa0>
				tickets_par = st.tickets[i];
    10bd:	8b 38                	mov    (%eax),%edi
		for(int i = 0; i < NPROC; i++){
    10bf:	83 c0 04             	add    $0x4,%eax
    10c2:	39 c8                	cmp    %ecx,%eax
    10c4:	75 ed                	jne    10b3 <main+0xb3>
		printf(1, "parent: %d, child: %d\n", tickets_par, tickets_chd);
    10c6:	8b b5 e4 fb ff ff    	mov    -0x41c(%ebp),%esi
    10cc:	56                   	push   %esi
    10cd:	57                   	push   %edi
    10ce:	68 1f 18 00 00       	push   $0x181f
    10d3:	6a 01                	push   $0x1
    10d5:	e8 06 04 00 00       	call   14e0 <printf>
		if(tickets_chd == tickets)
    10da:	83 c4 10             	add    $0x10,%esp
    10dd:	85 f6                	test   %esi,%esi
    10df:	75 16                	jne    10f7 <main+0xf7>
		 printf(1, "XV6_SCHEDULER\t SUCCESS\n");
    10e1:	52                   	push   %edx
    10e2:	52                   	push   %edx
    10e3:	68 36 18 00 00       	push   $0x1836
    10e8:	6a 01                	push   $0x1
    10ea:	e8 f1 03 00 00       	call   14e0 <printf>
    10ef:	83 c4 10             	add    $0x10,%esp
    10f2:	e9 52 ff ff ff       	jmp    1049 <main+0x49>
		 printf(1, "XV6_SCHEDULER\t FAILED\n");
    10f7:	50                   	push   %eax
    10f8:	50                   	push   %eax
    10f9:	68 08 18 00 00       	push   $0x1808
    10fe:	6a 01                	push   $0x1
    1100:	e8 db 03 00 00       	call   14e0 <printf>
    1105:	83 c4 10             	add    $0x10,%esp
    1108:	e9 3c ff ff ff       	jmp    1049 <main+0x49>
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1111:	31 c0                	xor    %eax,%eax
{
    1113:	89 e5                	mov    %esp,%ebp
    1115:	53                   	push   %ebx
    1116:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1127:	83 c0 01             	add    $0x1,%eax
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    112e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1131:	89 c8                	mov    %ecx,%eax
    1133:	c9                   	leave  
    1134:	c3                   	ret    
    1135:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114a:	0f b6 02             	movzbl (%edx),%eax
    114d:	84 c0                	test   %al,%al
    114f:	75 17                	jne    1168 <strcmp+0x28>
    1151:	eb 3a                	jmp    118d <strcmp+0x4d>
    1153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1157:	90                   	nop
    1158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    115c:	83 c2 01             	add    $0x1,%edx
    115f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1162:	84 c0                	test   %al,%al
    1164:	74 1a                	je     1180 <strcmp+0x40>
    p++, q++;
    1166:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1168:	0f b6 19             	movzbl (%ecx),%ebx
    116b:	38 c3                	cmp    %al,%bl
    116d:	74 e9                	je     1158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    116f:	29 d8                	sub    %ebx,%eax
}
    1171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1174:	c9                   	leave  
    1175:	c3                   	ret    
    1176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1184:	31 c0                	xor    %eax,%eax
    1186:	29 d8                	sub    %ebx,%eax
}
    1188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    118b:	c9                   	leave  
    118c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    118d:	0f b6 19             	movzbl (%ecx),%ebx
    1190:	31 c0                	xor    %eax,%eax
    1192:	eb db                	jmp    116f <strcmp+0x2f>
    1194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop

000011a0 <strlen>:

uint
strlen(const char *s)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11a6:	80 3a 00             	cmpb   $0x0,(%edx)
    11a9:	74 15                	je     11c0 <strlen+0x20>
    11ab:	31 c0                	xor    %eax,%eax
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
    11b0:	83 c0 01             	add    $0x1,%eax
    11b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11b7:	89 c1                	mov    %eax,%ecx
    11b9:	75 f5                	jne    11b0 <strlen+0x10>
    ;
  return n;
}
    11bb:	89 c8                	mov    %ecx,%eax
    11bd:	5d                   	pop    %ebp
    11be:	c3                   	ret    
    11bf:	90                   	nop
  for(n = 0; s[n]; n++)
    11c0:	31 c9                	xor    %ecx,%ecx
}
    11c2:	5d                   	pop    %ebp
    11c3:	89 c8                	mov    %ecx,%eax
    11c5:	c3                   	ret    
    11c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cd:	8d 76 00             	lea    0x0(%esi),%esi

000011d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	57                   	push   %edi
    11d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11da:	8b 45 0c             	mov    0xc(%ebp),%eax
    11dd:	89 d7                	mov    %edx,%edi
    11df:	fc                   	cld    
    11e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11e5:	89 d0                	mov    %edx,%eax
    11e7:	c9                   	leave  
    11e8:	c3                   	ret    
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011f0 <strchr>:

char*
strchr(const char *s, char c)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11fa:	0f b6 10             	movzbl (%eax),%edx
    11fd:	84 d2                	test   %dl,%dl
    11ff:	75 12                	jne    1213 <strchr+0x23>
    1201:	eb 1d                	jmp    1220 <strchr+0x30>
    1203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1207:	90                   	nop
    1208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    120c:	83 c0 01             	add    $0x1,%eax
    120f:	84 d2                	test   %dl,%dl
    1211:	74 0d                	je     1220 <strchr+0x30>
    if(*s == c)
    1213:	38 d1                	cmp    %dl,%cl
    1215:	75 f1                	jne    1208 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1217:	5d                   	pop    %ebp
    1218:	c3                   	ret    
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1220:	31 c0                	xor    %eax,%eax
}
    1222:	5d                   	pop    %ebp
    1223:	c3                   	ret    
    1224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    122f:	90                   	nop

00001230 <gets>:

char*
gets(char *buf, int max)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1235:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1239:	31 db                	xor    %ebx,%ebx
{
    123b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    123e:	eb 27                	jmp    1267 <gets+0x37>
    cc = read(0, &c, 1);
    1240:	83 ec 04             	sub    $0x4,%esp
    1243:	6a 01                	push   $0x1
    1245:	57                   	push   %edi
    1246:	6a 00                	push   $0x0
    1248:	e8 2e 01 00 00       	call   137b <read>
    if(cc < 1)
    124d:	83 c4 10             	add    $0x10,%esp
    1250:	85 c0                	test   %eax,%eax
    1252:	7e 1d                	jle    1271 <gets+0x41>
      break;
    buf[i++] = c;
    1254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1258:	8b 55 08             	mov    0x8(%ebp),%edx
    125b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    125f:	3c 0a                	cmp    $0xa,%al
    1261:	74 1d                	je     1280 <gets+0x50>
    1263:	3c 0d                	cmp    $0xd,%al
    1265:	74 19                	je     1280 <gets+0x50>
  for(i=0; i+1 < max; ){
    1267:	89 de                	mov    %ebx,%esi
    1269:	83 c3 01             	add    $0x1,%ebx
    126c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    126f:	7c cf                	jl     1240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1271:	8b 45 08             	mov    0x8(%ebp),%eax
    1274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1278:	8d 65 f4             	lea    -0xc(%ebp),%esp
    127b:	5b                   	pop    %ebx
    127c:	5e                   	pop    %esi
    127d:	5f                   	pop    %edi
    127e:	5d                   	pop    %ebp
    127f:	c3                   	ret    
  buf[i] = '\0';
    1280:	8b 45 08             	mov    0x8(%ebp),%eax
    1283:	89 de                	mov    %ebx,%esi
    1285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1289:	8d 65 f4             	lea    -0xc(%ebp),%esp
    128c:	5b                   	pop    %ebx
    128d:	5e                   	pop    %esi
    128e:	5f                   	pop    %edi
    128f:	5d                   	pop    %ebp
    1290:	c3                   	ret    
    1291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129f:	90                   	nop

000012a0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a5:	83 ec 08             	sub    $0x8,%esp
    12a8:	6a 00                	push   $0x0
    12aa:	ff 75 08             	push   0x8(%ebp)
    12ad:	e8 f1 00 00 00       	call   13a3 <open>
  if(fd < 0)
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	85 c0                	test   %eax,%eax
    12b7:	78 27                	js     12e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	ff 75 0c             	push   0xc(%ebp)
    12bf:	89 c3                	mov    %eax,%ebx
    12c1:	50                   	push   %eax
    12c2:	e8 f4 00 00 00       	call   13bb <fstat>
  close(fd);
    12c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12ca:	89 c6                	mov    %eax,%esi
  close(fd);
    12cc:	e8 ba 00 00 00       	call   138b <close>
  return r;
    12d1:	83 c4 10             	add    $0x10,%esp
}
    12d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12d7:	89 f0                	mov    %esi,%eax
    12d9:	5b                   	pop    %ebx
    12da:	5e                   	pop    %esi
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12e5:	eb ed                	jmp    12d4 <stat+0x34>
    12e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ee:	66 90                	xchg   %ax,%ax

000012f0 <atoi>:

int
atoi(const char *s)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	53                   	push   %ebx
    12f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f7:	0f be 02             	movsbl (%edx),%eax
    12fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1305:	77 1e                	ja     1325 <atoi+0x35>
    1307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1310:	83 c2 01             	add    $0x1,%edx
    1313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    131a:	0f be 02             	movsbl (%edx),%eax
    131d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1320:	80 fb 09             	cmp    $0x9,%bl
    1323:	76 eb                	jbe    1310 <atoi+0x20>
  return n;
}
    1325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1328:	89 c8                	mov    %ecx,%eax
    132a:	c9                   	leave  
    132b:	c3                   	ret    
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	8b 45 10             	mov    0x10(%ebp),%eax
    1337:	8b 55 08             	mov    0x8(%ebp),%edx
    133a:	56                   	push   %esi
    133b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    133e:	85 c0                	test   %eax,%eax
    1340:	7e 13                	jle    1355 <memmove+0x25>
    1342:	01 d0                	add    %edx,%eax
  dst = vdst;
    1344:	89 d7                	mov    %edx,%edi
    1346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1351:	39 f8                	cmp    %edi,%eax
    1353:	75 fb                	jne    1350 <memmove+0x20>
  return vdst;
}
    1355:	5e                   	pop    %esi
    1356:	89 d0                	mov    %edx,%eax
    1358:	5f                   	pop    %edi
    1359:	5d                   	pop    %ebp
    135a:	c3                   	ret    

0000135b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    135b:	b8 01 00 00 00       	mov    $0x1,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <exit>:
SYSCALL(exit)
    1363:	b8 02 00 00 00       	mov    $0x2,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <wait>:
SYSCALL(wait)
    136b:	b8 03 00 00 00       	mov    $0x3,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <pipe>:
SYSCALL(pipe)
    1373:	b8 04 00 00 00       	mov    $0x4,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <read>:
SYSCALL(read)
    137b:	b8 05 00 00 00       	mov    $0x5,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <write>:
SYSCALL(write)
    1383:	b8 10 00 00 00       	mov    $0x10,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <close>:
SYSCALL(close)
    138b:	b8 15 00 00 00       	mov    $0x15,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <kill>:
SYSCALL(kill)
    1393:	b8 06 00 00 00       	mov    $0x6,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <exec>:
SYSCALL(exec)
    139b:	b8 07 00 00 00       	mov    $0x7,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <open>:
SYSCALL(open)
    13a3:	b8 0f 00 00 00       	mov    $0xf,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <mknod>:
SYSCALL(mknod)
    13ab:	b8 11 00 00 00       	mov    $0x11,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <unlink>:
SYSCALL(unlink)
    13b3:	b8 12 00 00 00       	mov    $0x12,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <fstat>:
SYSCALL(fstat)
    13bb:	b8 08 00 00 00       	mov    $0x8,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <link>:
SYSCALL(link)
    13c3:	b8 13 00 00 00       	mov    $0x13,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <mkdir>:
SYSCALL(mkdir)
    13cb:	b8 14 00 00 00       	mov    $0x14,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <chdir>:
SYSCALL(chdir)
    13d3:	b8 09 00 00 00       	mov    $0x9,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <dup>:
SYSCALL(dup)
    13db:	b8 0a 00 00 00       	mov    $0xa,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <getpid>:
SYSCALL(getpid)
    13e3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <sbrk>:
SYSCALL(sbrk)
    13eb:	b8 0c 00 00 00       	mov    $0xc,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <sleep>:
SYSCALL(sleep)
    13f3:	b8 0d 00 00 00       	mov    $0xd,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <uptime>:
SYSCALL(uptime)
    13fb:	b8 0e 00 00 00       	mov    $0xe,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <getpinfo>:

SYSCALL(getpinfo)
    1403:	b8 16 00 00 00       	mov    $0x16,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <settickets>:
SYSCALL(settickets)
    140b:	b8 17 00 00 00       	mov    $0x17,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <mprotect>:
SYSCALL(mprotect)
    1413:	b8 18 00 00 00       	mov    $0x18,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <munprotect>:
SYSCALL(munprotect)
    141b:	b8 19 00 00 00       	mov    $0x19,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    
    1423:	66 90                	xchg   %ax,%ax
    1425:	66 90                	xchg   %ax,%ax
    1427:	66 90                	xchg   %ax,%ax
    1429:	66 90                	xchg   %ax,%ax
    142b:	66 90                	xchg   %ax,%ax
    142d:	66 90                	xchg   %ax,%ax
    142f:	90                   	nop

00001430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	83 ec 3c             	sub    $0x3c,%esp
    1439:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    143c:	89 d1                	mov    %edx,%ecx
{
    143e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1441:	85 d2                	test   %edx,%edx
    1443:	0f 89 7f 00 00 00    	jns    14c8 <printint+0x98>
    1449:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    144d:	74 79                	je     14c8 <printint+0x98>
    neg = 1;
    144f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1456:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1458:	31 db                	xor    %ebx,%ebx
    145a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    145d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1460:	89 c8                	mov    %ecx,%eax
    1462:	31 d2                	xor    %edx,%edx
    1464:	89 cf                	mov    %ecx,%edi
    1466:	f7 75 c4             	divl   -0x3c(%ebp)
    1469:	0f b6 92 b0 18 00 00 	movzbl 0x18b0(%edx),%edx
    1470:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1473:	89 d8                	mov    %ebx,%eax
    1475:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1478:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    147b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    147e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1481:	76 dd                	jbe    1460 <printint+0x30>
  if(neg)
    1483:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1486:	85 c9                	test   %ecx,%ecx
    1488:	74 0c                	je     1496 <printint+0x66>
    buf[i++] = '-';
    148a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    148f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1491:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1496:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1499:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    149d:	eb 07                	jmp    14a6 <printint+0x76>
    149f:	90                   	nop
    putc(fd, buf[i]);
    14a0:	0f b6 13             	movzbl (%ebx),%edx
    14a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    14a6:	83 ec 04             	sub    $0x4,%esp
    14a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14ac:	6a 01                	push   $0x1
    14ae:	56                   	push   %esi
    14af:	57                   	push   %edi
    14b0:	e8 ce fe ff ff       	call   1383 <write>
  while(--i >= 0)
    14b5:	83 c4 10             	add    $0x10,%esp
    14b8:	39 de                	cmp    %ebx,%esi
    14ba:	75 e4                	jne    14a0 <printint+0x70>
}
    14bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14bf:	5b                   	pop    %ebx
    14c0:	5e                   	pop    %esi
    14c1:	5f                   	pop    %edi
    14c2:	5d                   	pop    %ebp
    14c3:	c3                   	ret    
    14c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14cf:	eb 87                	jmp    1458 <printint+0x28>
    14d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14df:	90                   	nop

000014e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    14e0:	55                   	push   %ebp
    14e1:	89 e5                	mov    %esp,%ebp
    14e3:	57                   	push   %edi
    14e4:	56                   	push   %esi
    14e5:	53                   	push   %ebx
    14e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    14ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    14ef:	0f b6 13             	movzbl (%ebx),%edx
    14f2:	84 d2                	test   %dl,%dl
    14f4:	74 6a                	je     1560 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    14f6:	8d 45 10             	lea    0x10(%ebp),%eax
    14f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    14fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1501:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1504:	eb 36                	jmp    153c <printf+0x5c>
    1506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    150d:	8d 76 00             	lea    0x0(%esi),%esi
    1510:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1513:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1518:	83 f8 25             	cmp    $0x25,%eax
    151b:	74 15                	je     1532 <printf+0x52>
  write(fd, &c, 1);
    151d:	83 ec 04             	sub    $0x4,%esp
    1520:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1523:	6a 01                	push   $0x1
    1525:	57                   	push   %edi
    1526:	56                   	push   %esi
    1527:	e8 57 fe ff ff       	call   1383 <write>
    152c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    152f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1532:	0f b6 13             	movzbl (%ebx),%edx
    1535:	83 c3 01             	add    $0x1,%ebx
    1538:	84 d2                	test   %dl,%dl
    153a:	74 24                	je     1560 <printf+0x80>
    c = fmt[i] & 0xff;
    153c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    153f:	85 c9                	test   %ecx,%ecx
    1541:	74 cd                	je     1510 <printf+0x30>
      }
    } else if(state == '%'){
    1543:	83 f9 25             	cmp    $0x25,%ecx
    1546:	75 ea                	jne    1532 <printf+0x52>
      if(c == 'd'){
    1548:	83 f8 25             	cmp    $0x25,%eax
    154b:	0f 84 07 01 00 00    	je     1658 <printf+0x178>
    1551:	83 e8 63             	sub    $0x63,%eax
    1554:	83 f8 15             	cmp    $0x15,%eax
    1557:	77 17                	ja     1570 <printf+0x90>
    1559:	ff 24 85 58 18 00 00 	jmp    *0x1858(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1560:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1563:	5b                   	pop    %ebx
    1564:	5e                   	pop    %esi
    1565:	5f                   	pop    %edi
    1566:	5d                   	pop    %ebp
    1567:	c3                   	ret    
    1568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    156f:	90                   	nop
  write(fd, &c, 1);
    1570:	83 ec 04             	sub    $0x4,%esp
    1573:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1576:	6a 01                	push   $0x1
    1578:	57                   	push   %edi
    1579:	56                   	push   %esi
    157a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    157e:	e8 00 fe ff ff       	call   1383 <write>
        putc(fd, c);
    1583:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1587:	83 c4 0c             	add    $0xc,%esp
    158a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    158d:	6a 01                	push   $0x1
    158f:	57                   	push   %edi
    1590:	56                   	push   %esi
    1591:	e8 ed fd ff ff       	call   1383 <write>
        putc(fd, c);
    1596:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1599:	31 c9                	xor    %ecx,%ecx
    159b:	eb 95                	jmp    1532 <printf+0x52>
    159d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15a8:	6a 00                	push   $0x0
    15aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15ad:	8b 10                	mov    (%eax),%edx
    15af:	89 f0                	mov    %esi,%eax
    15b1:	e8 7a fe ff ff       	call   1430 <printint>
        ap++;
    15b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15bd:	31 c9                	xor    %ecx,%ecx
    15bf:	e9 6e ff ff ff       	jmp    1532 <printf+0x52>
    15c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15cb:	8b 10                	mov    (%eax),%edx
        ap++;
    15cd:	83 c0 04             	add    $0x4,%eax
    15d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15d3:	85 d2                	test   %edx,%edx
    15d5:	0f 84 8d 00 00 00    	je     1668 <printf+0x188>
        while(*s != 0){
    15db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    15e0:	84 c0                	test   %al,%al
    15e2:	0f 84 4a ff ff ff    	je     1532 <printf+0x52>
    15e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15eb:	89 d3                	mov    %edx,%ebx
    15ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    15f0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15f3:	83 c3 01             	add    $0x1,%ebx
    15f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15f9:	6a 01                	push   $0x1
    15fb:	57                   	push   %edi
    15fc:	56                   	push   %esi
    15fd:	e8 81 fd ff ff       	call   1383 <write>
        while(*s != 0){
    1602:	0f b6 03             	movzbl (%ebx),%eax
    1605:	83 c4 10             	add    $0x10,%esp
    1608:	84 c0                	test   %al,%al
    160a:	75 e4                	jne    15f0 <printf+0x110>
      state = 0;
    160c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    160f:	31 c9                	xor    %ecx,%ecx
    1611:	e9 1c ff ff ff       	jmp    1532 <printf+0x52>
    1616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    161d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1620:	83 ec 0c             	sub    $0xc,%esp
    1623:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1628:	6a 01                	push   $0x1
    162a:	e9 7b ff ff ff       	jmp    15aa <printf+0xca>
    162f:	90                   	nop
        putc(fd, *ap);
    1630:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1633:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1636:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1638:	6a 01                	push   $0x1
    163a:	57                   	push   %edi
    163b:	56                   	push   %esi
        putc(fd, *ap);
    163c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    163f:	e8 3f fd ff ff       	call   1383 <write>
        ap++;
    1644:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1648:	83 c4 10             	add    $0x10,%esp
      state = 0;
    164b:	31 c9                	xor    %ecx,%ecx
    164d:	e9 e0 fe ff ff       	jmp    1532 <printf+0x52>
    1652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1658:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    165b:	83 ec 04             	sub    $0x4,%esp
    165e:	e9 2a ff ff ff       	jmp    158d <printf+0xad>
    1663:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1667:	90                   	nop
          s = "(null)";
    1668:	ba 4e 18 00 00       	mov    $0x184e,%edx
        while(*s != 0){
    166d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1670:	b8 28 00 00 00       	mov    $0x28,%eax
    1675:	89 d3                	mov    %edx,%ebx
    1677:	e9 74 ff ff ff       	jmp    15f0 <printf+0x110>
    167c:	66 90                	xchg   %ax,%ax
    167e:	66 90                	xchg   %ax,%ax

00001680 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1681:	a1 64 1b 00 00       	mov    0x1b64,%eax
{
    1686:	89 e5                	mov    %esp,%ebp
    1688:	57                   	push   %edi
    1689:	56                   	push   %esi
    168a:	53                   	push   %ebx
    168b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    168e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1698:	89 c2                	mov    %eax,%edx
    169a:	8b 00                	mov    (%eax),%eax
    169c:	39 ca                	cmp    %ecx,%edx
    169e:	73 30                	jae    16d0 <free+0x50>
    16a0:	39 c1                	cmp    %eax,%ecx
    16a2:	72 04                	jb     16a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16a4:	39 c2                	cmp    %eax,%edx
    16a6:	72 f0                	jb     1698 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ae:	39 f8                	cmp    %edi,%eax
    16b0:	74 30                	je     16e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    16b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16b5:	8b 42 04             	mov    0x4(%edx),%eax
    16b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16bb:	39 f1                	cmp    %esi,%ecx
    16bd:	74 3a                	je     16f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    16bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16c1:	5b                   	pop    %ebx
  freep = p;
    16c2:	89 15 64 1b 00 00    	mov    %edx,0x1b64
}
    16c8:	5e                   	pop    %esi
    16c9:	5f                   	pop    %edi
    16ca:	5d                   	pop    %ebp
    16cb:	c3                   	ret    
    16cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d0:	39 c2                	cmp    %eax,%edx
    16d2:	72 c4                	jb     1698 <free+0x18>
    16d4:	39 c1                	cmp    %eax,%ecx
    16d6:	73 c0                	jae    1698 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16de:	39 f8                	cmp    %edi,%eax
    16e0:	75 d0                	jne    16b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    16e2:	03 70 04             	add    0x4(%eax),%esi
    16e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16e8:	8b 02                	mov    (%edx),%eax
    16ea:	8b 00                	mov    (%eax),%eax
    16ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    16ef:	8b 42 04             	mov    0x4(%edx),%eax
    16f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16f5:	39 f1                	cmp    %esi,%ecx
    16f7:	75 c6                	jne    16bf <free+0x3f>
    p->s.size += bp->s.size;
    16f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    16fc:	89 15 64 1b 00 00    	mov    %edx,0x1b64
    p->s.size += bp->s.size;
    1702:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1705:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1708:	89 0a                	mov    %ecx,(%edx)
}
    170a:	5b                   	pop    %ebx
    170b:	5e                   	pop    %esi
    170c:	5f                   	pop    %edi
    170d:	5d                   	pop    %ebp
    170e:	c3                   	ret    
    170f:	90                   	nop

00001710 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1710:	55                   	push   %ebp
    1711:	89 e5                	mov    %esp,%ebp
    1713:	57                   	push   %edi
    1714:	56                   	push   %esi
    1715:	53                   	push   %ebx
    1716:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1719:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    171c:	8b 3d 64 1b 00 00    	mov    0x1b64,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1722:	8d 70 07             	lea    0x7(%eax),%esi
    1725:	c1 ee 03             	shr    $0x3,%esi
    1728:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    172b:	85 ff                	test   %edi,%edi
    172d:	0f 84 9d 00 00 00    	je     17d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1733:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1735:	8b 4a 04             	mov    0x4(%edx),%ecx
    1738:	39 f1                	cmp    %esi,%ecx
    173a:	73 6a                	jae    17a6 <malloc+0x96>
    173c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1741:	39 de                	cmp    %ebx,%esi
    1743:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1746:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    174d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1750:	eb 17                	jmp    1769 <malloc+0x59>
    1752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1758:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    175a:	8b 48 04             	mov    0x4(%eax),%ecx
    175d:	39 f1                	cmp    %esi,%ecx
    175f:	73 4f                	jae    17b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1761:	8b 3d 64 1b 00 00    	mov    0x1b64,%edi
    1767:	89 c2                	mov    %eax,%edx
    1769:	39 d7                	cmp    %edx,%edi
    176b:	75 eb                	jne    1758 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    176d:	83 ec 0c             	sub    $0xc,%esp
    1770:	ff 75 e4             	push   -0x1c(%ebp)
    1773:	e8 73 fc ff ff       	call   13eb <sbrk>
  if(p == (char*)-1)
    1778:	83 c4 10             	add    $0x10,%esp
    177b:	83 f8 ff             	cmp    $0xffffffff,%eax
    177e:	74 1c                	je     179c <malloc+0x8c>
  hp->s.size = nu;
    1780:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1783:	83 ec 0c             	sub    $0xc,%esp
    1786:	83 c0 08             	add    $0x8,%eax
    1789:	50                   	push   %eax
    178a:	e8 f1 fe ff ff       	call   1680 <free>
  return freep;
    178f:	8b 15 64 1b 00 00    	mov    0x1b64,%edx
      if((p = morecore(nunits)) == 0)
    1795:	83 c4 10             	add    $0x10,%esp
    1798:	85 d2                	test   %edx,%edx
    179a:	75 bc                	jne    1758 <malloc+0x48>
        return 0;
  }
}
    179c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    179f:	31 c0                	xor    %eax,%eax
}
    17a1:	5b                   	pop    %ebx
    17a2:	5e                   	pop    %esi
    17a3:	5f                   	pop    %edi
    17a4:	5d                   	pop    %ebp
    17a5:	c3                   	ret    
    if(p->s.size >= nunits){
    17a6:	89 d0                	mov    %edx,%eax
    17a8:	89 fa                	mov    %edi,%edx
    17aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17b0:	39 ce                	cmp    %ecx,%esi
    17b2:	74 4c                	je     1800 <malloc+0xf0>
        p->s.size -= nunits;
    17b4:	29 f1                	sub    %esi,%ecx
    17b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17bf:	89 15 64 1b 00 00    	mov    %edx,0x1b64
}
    17c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17c8:	83 c0 08             	add    $0x8,%eax
}
    17cb:	5b                   	pop    %ebx
    17cc:	5e                   	pop    %esi
    17cd:	5f                   	pop    %edi
    17ce:	5d                   	pop    %ebp
    17cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17d0:	c7 05 64 1b 00 00 68 	movl   $0x1b68,0x1b64
    17d7:	1b 00 00 
    base.s.size = 0;
    17da:	bf 68 1b 00 00       	mov    $0x1b68,%edi
    base.s.ptr = freep = prevp = &base;
    17df:	c7 05 68 1b 00 00 68 	movl   $0x1b68,0x1b68
    17e6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    17eb:	c7 05 6c 1b 00 00 00 	movl   $0x0,0x1b6c
    17f2:	00 00 00 
    if(p->s.size >= nunits){
    17f5:	e9 42 ff ff ff       	jmp    173c <malloc+0x2c>
    17fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1800:	8b 08                	mov    (%eax),%ecx
    1802:	89 0a                	mov    %ecx,(%edx)
    1804:	eb b9                	jmp    17bf <malloc+0xaf>
