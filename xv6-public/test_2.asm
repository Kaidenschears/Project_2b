
_test_2:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "user.h"
#include "pstat.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
   struct pstat st;
   int pid = getpid();
   int defaulttickets = 0;
   
   if(getpinfo(&st) == 0)
    100f:	8d 9d e8 fb ff ff    	lea    -0x418(%ebp),%ebx
{
    1015:	51                   	push   %ecx
    1016:	81 ec 0c 04 00 00    	sub    $0x40c,%esp
   int pid = getpid();
    101c:	e8 52 03 00 00       	call   1373 <getpid>
   if(getpinfo(&st) == 0)
    1021:	83 ec 0c             	sub    $0xc,%esp
    1024:	53                   	push   %ebx
   int pid = getpid();
    1025:	89 c6                	mov    %eax,%esi
   if(getpinfo(&st) == 0)
    1027:	e8 67 03 00 00       	call   1393 <getpinfo>
    102c:	83 c4 10             	add    $0x10,%esp
    102f:	85 c0                	test   %eax,%eax
    1031:	75 5a                	jne    108d <main+0x8d>
    1033:	89 da                	mov    %ebx,%edx
    1035:	8d 8d e8 fc ff ff    	lea    -0x318(%ebp),%ecx
    103b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    103f:	90                   	nop
   {
    for(int i = 0; i < NPROC; i++) {
      if (st.inuse[i]) {
    1040:	8b 1a                	mov    (%edx),%ebx
    1042:	85 db                	test   %ebx,%ebx
    1044:	74 12                	je     1058 <main+0x58>
        if(st.pid[i] == pid) {
    1046:	39 b2 00 02 00 00    	cmp    %esi,0x200(%edx)
    104c:	75 0a                	jne    1058 <main+0x58>
          defaulttickets = st.tickets[i];
    104e:	8b 82 00 01 00 00    	mov    0x100(%edx),%eax
    1054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(int i = 0; i < NPROC; i++) {
    1058:	83 c2 04             	add    $0x4,%edx
    105b:	39 ca                	cmp    %ecx,%edx
    105d:	75 e1                	jne    1040 <main+0x40>
   printf(1, "XV6_SCHEDULER\t FAILED\n");
   exit();
  }

  
  if(defaulttickets == 1)
    105f:	83 f8 01             	cmp    $0x1,%eax
    1062:	74 16                	je     107a <main+0x7a>
  {
   printf(1, "XV6_SCHEDULER\t SUCCESS\n");
  }
  else
  {
   printf(1, "XV6_SCHEDULER\t FAILED\n");
    1064:	50                   	push   %eax
    1065:	50                   	push   %eax
    1066:	68 98 17 00 00       	push   $0x1798
    106b:	6a 01                	push   $0x1
    106d:	e8 fe 03 00 00       	call   1470 <printf>
    1072:	83 c4 10             	add    $0x10,%esp
  }
   exit();
    1075:	e8 79 02 00 00       	call   12f3 <exit>
   printf(1, "XV6_SCHEDULER\t SUCCESS\n");
    107a:	52                   	push   %edx
    107b:	52                   	push   %edx
    107c:	68 af 17 00 00       	push   $0x17af
    1081:	6a 01                	push   $0x1
    1083:	e8 e8 03 00 00       	call   1470 <printf>
    1088:	83 c4 10             	add    $0x10,%esp
    108b:	eb e8                	jmp    1075 <main+0x75>
   printf(1, "XV6_SCHEDULER\t FAILED\n");
    108d:	51                   	push   %ecx
    108e:	51                   	push   %ecx
    108f:	68 98 17 00 00       	push   $0x1798
    1094:	6a 01                	push   $0x1
    1096:	e8 d5 03 00 00       	call   1470 <printf>
   exit();
    109b:	e8 53 02 00 00       	call   12f3 <exit>

000010a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    10a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10a1:	31 c0                	xor    %eax,%eax
{
    10a3:	89 e5                	mov    %esp,%ebp
    10a5:	53                   	push   %ebx
    10a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    10b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    10b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    10b7:	83 c0 01             	add    $0x1,%eax
    10ba:	84 d2                	test   %dl,%dl
    10bc:	75 f2                	jne    10b0 <strcpy+0x10>
    ;
  return os;
}
    10be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10c1:	89 c8                	mov    %ecx,%eax
    10c3:	c9                   	leave  
    10c4:	c3                   	ret    
    10c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	8b 55 08             	mov    0x8(%ebp),%edx
    10d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10da:	0f b6 02             	movzbl (%edx),%eax
    10dd:	84 c0                	test   %al,%al
    10df:	75 17                	jne    10f8 <strcmp+0x28>
    10e1:	eb 3a                	jmp    111d <strcmp+0x4d>
    10e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10e7:	90                   	nop
    10e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10ec:	83 c2 01             	add    $0x1,%edx
    10ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10f2:	84 c0                	test   %al,%al
    10f4:	74 1a                	je     1110 <strcmp+0x40>
    p++, q++;
    10f6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10f8:	0f b6 19             	movzbl (%ecx),%ebx
    10fb:	38 c3                	cmp    %al,%bl
    10fd:	74 e9                	je     10e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10ff:	29 d8                	sub    %ebx,%eax
}
    1101:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1104:	c9                   	leave  
    1105:	c3                   	ret    
    1106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1110:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1114:	31 c0                	xor    %eax,%eax
    1116:	29 d8                	sub    %ebx,%eax
}
    1118:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    111b:	c9                   	leave  
    111c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    111d:	0f b6 19             	movzbl (%ecx),%ebx
    1120:	31 c0                	xor    %eax,%eax
    1122:	eb db                	jmp    10ff <strcmp+0x2f>
    1124:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    112f:	90                   	nop

00001130 <strlen>:

uint
strlen(const char *s)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1136:	80 3a 00             	cmpb   $0x0,(%edx)
    1139:	74 15                	je     1150 <strlen+0x20>
    113b:	31 c0                	xor    %eax,%eax
    113d:	8d 76 00             	lea    0x0(%esi),%esi
    1140:	83 c0 01             	add    $0x1,%eax
    1143:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1147:	89 c1                	mov    %eax,%ecx
    1149:	75 f5                	jne    1140 <strlen+0x10>
    ;
  return n;
}
    114b:	89 c8                	mov    %ecx,%eax
    114d:	5d                   	pop    %ebp
    114e:	c3                   	ret    
    114f:	90                   	nop
  for(n = 0; s[n]; n++)
    1150:	31 c9                	xor    %ecx,%ecx
}
    1152:	5d                   	pop    %ebp
    1153:	89 c8                	mov    %ecx,%eax
    1155:	c3                   	ret    
    1156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115d:	8d 76 00             	lea    0x0(%esi),%esi

00001160 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
    1164:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1167:	8b 4d 10             	mov    0x10(%ebp),%ecx
    116a:	8b 45 0c             	mov    0xc(%ebp),%eax
    116d:	89 d7                	mov    %edx,%edi
    116f:	fc                   	cld    
    1170:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1172:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1175:	89 d0                	mov    %edx,%eax
    1177:	c9                   	leave  
    1178:	c3                   	ret    
    1179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001180 <strchr>:

char*
strchr(const char *s, char c)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	8b 45 08             	mov    0x8(%ebp),%eax
    1186:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    118a:	0f b6 10             	movzbl (%eax),%edx
    118d:	84 d2                	test   %dl,%dl
    118f:	75 12                	jne    11a3 <strchr+0x23>
    1191:	eb 1d                	jmp    11b0 <strchr+0x30>
    1193:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1197:	90                   	nop
    1198:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    119c:	83 c0 01             	add    $0x1,%eax
    119f:	84 d2                	test   %dl,%dl
    11a1:	74 0d                	je     11b0 <strchr+0x30>
    if(*s == c)
    11a3:	38 d1                	cmp    %dl,%cl
    11a5:	75 f1                	jne    1198 <strchr+0x18>
      return (char*)s;
  return 0;
}
    11a7:	5d                   	pop    %ebp
    11a8:	c3                   	ret    
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    11b0:	31 c0                	xor    %eax,%eax
}
    11b2:	5d                   	pop    %ebp
    11b3:	c3                   	ret    
    11b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11bf:	90                   	nop

000011c0 <gets>:

char*
gets(char *buf, int max)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	57                   	push   %edi
    11c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    11c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11c9:	31 db                	xor    %ebx,%ebx
{
    11cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11ce:	eb 27                	jmp    11f7 <gets+0x37>
    cc = read(0, &c, 1);
    11d0:	83 ec 04             	sub    $0x4,%esp
    11d3:	6a 01                	push   $0x1
    11d5:	57                   	push   %edi
    11d6:	6a 00                	push   $0x0
    11d8:	e8 2e 01 00 00       	call   130b <read>
    if(cc < 1)
    11dd:	83 c4 10             	add    $0x10,%esp
    11e0:	85 c0                	test   %eax,%eax
    11e2:	7e 1d                	jle    1201 <gets+0x41>
      break;
    buf[i++] = c;
    11e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11e8:	8b 55 08             	mov    0x8(%ebp),%edx
    11eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11ef:	3c 0a                	cmp    $0xa,%al
    11f1:	74 1d                	je     1210 <gets+0x50>
    11f3:	3c 0d                	cmp    $0xd,%al
    11f5:	74 19                	je     1210 <gets+0x50>
  for(i=0; i+1 < max; ){
    11f7:	89 de                	mov    %ebx,%esi
    11f9:	83 c3 01             	add    $0x1,%ebx
    11fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11ff:	7c cf                	jl     11d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1201:	8b 45 08             	mov    0x8(%ebp),%eax
    1204:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1208:	8d 65 f4             	lea    -0xc(%ebp),%esp
    120b:	5b                   	pop    %ebx
    120c:	5e                   	pop    %esi
    120d:	5f                   	pop    %edi
    120e:	5d                   	pop    %ebp
    120f:	c3                   	ret    
  buf[i] = '\0';
    1210:	8b 45 08             	mov    0x8(%ebp),%eax
    1213:	89 de                	mov    %ebx,%esi
    1215:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1219:	8d 65 f4             	lea    -0xc(%ebp),%esp
    121c:	5b                   	pop    %ebx
    121d:	5e                   	pop    %esi
    121e:	5f                   	pop    %edi
    121f:	5d                   	pop    %ebp
    1220:	c3                   	ret    
    1221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122f:	90                   	nop

00001230 <stat>:

int
stat(const char *n, struct stat *st)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	56                   	push   %esi
    1234:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1235:	83 ec 08             	sub    $0x8,%esp
    1238:	6a 00                	push   $0x0
    123a:	ff 75 08             	push   0x8(%ebp)
    123d:	e8 f1 00 00 00       	call   1333 <open>
  if(fd < 0)
    1242:	83 c4 10             	add    $0x10,%esp
    1245:	85 c0                	test   %eax,%eax
    1247:	78 27                	js     1270 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1249:	83 ec 08             	sub    $0x8,%esp
    124c:	ff 75 0c             	push   0xc(%ebp)
    124f:	89 c3                	mov    %eax,%ebx
    1251:	50                   	push   %eax
    1252:	e8 f4 00 00 00       	call   134b <fstat>
  close(fd);
    1257:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    125a:	89 c6                	mov    %eax,%esi
  close(fd);
    125c:	e8 ba 00 00 00       	call   131b <close>
  return r;
    1261:	83 c4 10             	add    $0x10,%esp
}
    1264:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1267:	89 f0                	mov    %esi,%eax
    1269:	5b                   	pop    %ebx
    126a:	5e                   	pop    %esi
    126b:	5d                   	pop    %ebp
    126c:	c3                   	ret    
    126d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1270:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1275:	eb ed                	jmp    1264 <stat+0x34>
    1277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127e:	66 90                	xchg   %ax,%ax

00001280 <atoi>:

int
atoi(const char *s)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	53                   	push   %ebx
    1284:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1287:	0f be 02             	movsbl (%edx),%eax
    128a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    128d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1290:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1295:	77 1e                	ja     12b5 <atoi+0x35>
    1297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12a0:	83 c2 01             	add    $0x1,%edx
    12a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    12a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    12aa:	0f be 02             	movsbl (%edx),%eax
    12ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
    12b0:	80 fb 09             	cmp    $0x9,%bl
    12b3:	76 eb                	jbe    12a0 <atoi+0x20>
  return n;
}
    12b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    12b8:	89 c8                	mov    %ecx,%eax
    12ba:	c9                   	leave  
    12bb:	c3                   	ret    
    12bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	57                   	push   %edi
    12c4:	8b 45 10             	mov    0x10(%ebp),%eax
    12c7:	8b 55 08             	mov    0x8(%ebp),%edx
    12ca:	56                   	push   %esi
    12cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ce:	85 c0                	test   %eax,%eax
    12d0:	7e 13                	jle    12e5 <memmove+0x25>
    12d2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12d4:	89 d7                	mov    %edx,%edi
    12d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12e1:	39 f8                	cmp    %edi,%eax
    12e3:	75 fb                	jne    12e0 <memmove+0x20>
  return vdst;
}
    12e5:	5e                   	pop    %esi
    12e6:	89 d0                	mov    %edx,%eax
    12e8:	5f                   	pop    %edi
    12e9:	5d                   	pop    %ebp
    12ea:	c3                   	ret    

000012eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12eb:	b8 01 00 00 00       	mov    $0x1,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <exit>:
SYSCALL(exit)
    12f3:	b8 02 00 00 00       	mov    $0x2,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <wait>:
SYSCALL(wait)
    12fb:	b8 03 00 00 00       	mov    $0x3,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <pipe>:
SYSCALL(pipe)
    1303:	b8 04 00 00 00       	mov    $0x4,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <read>:
SYSCALL(read)
    130b:	b8 05 00 00 00       	mov    $0x5,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <write>:
SYSCALL(write)
    1313:	b8 10 00 00 00       	mov    $0x10,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <close>:
SYSCALL(close)
    131b:	b8 15 00 00 00       	mov    $0x15,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <kill>:
SYSCALL(kill)
    1323:	b8 06 00 00 00       	mov    $0x6,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <exec>:
SYSCALL(exec)
    132b:	b8 07 00 00 00       	mov    $0x7,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <open>:
SYSCALL(open)
    1333:	b8 0f 00 00 00       	mov    $0xf,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <mknod>:
SYSCALL(mknod)
    133b:	b8 11 00 00 00       	mov    $0x11,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <unlink>:
SYSCALL(unlink)
    1343:	b8 12 00 00 00       	mov    $0x12,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <fstat>:
SYSCALL(fstat)
    134b:	b8 08 00 00 00       	mov    $0x8,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <link>:
SYSCALL(link)
    1353:	b8 13 00 00 00       	mov    $0x13,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <mkdir>:
SYSCALL(mkdir)
    135b:	b8 14 00 00 00       	mov    $0x14,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <chdir>:
SYSCALL(chdir)
    1363:	b8 09 00 00 00       	mov    $0x9,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <dup>:
SYSCALL(dup)
    136b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <getpid>:
SYSCALL(getpid)
    1373:	b8 0b 00 00 00       	mov    $0xb,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <sbrk>:
SYSCALL(sbrk)
    137b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <sleep>:
SYSCALL(sleep)
    1383:	b8 0d 00 00 00       	mov    $0xd,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <uptime>:
SYSCALL(uptime)
    138b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <getpinfo>:

SYSCALL(getpinfo)
    1393:	b8 16 00 00 00       	mov    $0x16,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <settickets>:
SYSCALL(settickets)
    139b:	b8 17 00 00 00       	mov    $0x17,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <mprotect>:
SYSCALL(mprotect)
    13a3:	b8 18 00 00 00       	mov    $0x18,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <munprotect>:
SYSCALL(munprotect)
    13ab:	b8 19 00 00 00       	mov    $0x19,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    
    13b3:	66 90                	xchg   %ax,%ax
    13b5:	66 90                	xchg   %ax,%ax
    13b7:	66 90                	xchg   %ax,%ax
    13b9:	66 90                	xchg   %ax,%ax
    13bb:	66 90                	xchg   %ax,%ax
    13bd:	66 90                	xchg   %ax,%ax
    13bf:	90                   	nop

000013c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	57                   	push   %edi
    13c4:	56                   	push   %esi
    13c5:	53                   	push   %ebx
    13c6:	83 ec 3c             	sub    $0x3c,%esp
    13c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    13cc:	89 d1                	mov    %edx,%ecx
{
    13ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    13d1:	85 d2                	test   %edx,%edx
    13d3:	0f 89 7f 00 00 00    	jns    1458 <printint+0x98>
    13d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13dd:	74 79                	je     1458 <printint+0x98>
    neg = 1;
    13df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13e8:	31 db                	xor    %ebx,%ebx
    13ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13f0:	89 c8                	mov    %ecx,%eax
    13f2:	31 d2                	xor    %edx,%edx
    13f4:	89 cf                	mov    %ecx,%edi
    13f6:	f7 75 c4             	divl   -0x3c(%ebp)
    13f9:	0f b6 92 28 18 00 00 	movzbl 0x1828(%edx),%edx
    1400:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1403:	89 d8                	mov    %ebx,%eax
    1405:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1408:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    140b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    140e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1411:	76 dd                	jbe    13f0 <printint+0x30>
  if(neg)
    1413:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1416:	85 c9                	test   %ecx,%ecx
    1418:	74 0c                	je     1426 <printint+0x66>
    buf[i++] = '-';
    141a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    141f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1421:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1426:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1429:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    142d:	eb 07                	jmp    1436 <printint+0x76>
    142f:	90                   	nop
    putc(fd, buf[i]);
    1430:	0f b6 13             	movzbl (%ebx),%edx
    1433:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1436:	83 ec 04             	sub    $0x4,%esp
    1439:	88 55 d7             	mov    %dl,-0x29(%ebp)
    143c:	6a 01                	push   $0x1
    143e:	56                   	push   %esi
    143f:	57                   	push   %edi
    1440:	e8 ce fe ff ff       	call   1313 <write>
  while(--i >= 0)
    1445:	83 c4 10             	add    $0x10,%esp
    1448:	39 de                	cmp    %ebx,%esi
    144a:	75 e4                	jne    1430 <printint+0x70>
}
    144c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    144f:	5b                   	pop    %ebx
    1450:	5e                   	pop    %esi
    1451:	5f                   	pop    %edi
    1452:	5d                   	pop    %ebp
    1453:	c3                   	ret    
    1454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1458:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    145f:	eb 87                	jmp    13e8 <printint+0x28>
    1461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    146f:	90                   	nop

00001470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	53                   	push   %ebx
    1476:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1479:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    147c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    147f:	0f b6 13             	movzbl (%ebx),%edx
    1482:	84 d2                	test   %dl,%dl
    1484:	74 6a                	je     14f0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1486:	8d 45 10             	lea    0x10(%ebp),%eax
    1489:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    148c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    148f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1491:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1494:	eb 36                	jmp    14cc <printf+0x5c>
    1496:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149d:	8d 76 00             	lea    0x0(%esi),%esi
    14a0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14a3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    14a8:	83 f8 25             	cmp    $0x25,%eax
    14ab:	74 15                	je     14c2 <printf+0x52>
  write(fd, &c, 1);
    14ad:	83 ec 04             	sub    $0x4,%esp
    14b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14b3:	6a 01                	push   $0x1
    14b5:	57                   	push   %edi
    14b6:	56                   	push   %esi
    14b7:	e8 57 fe ff ff       	call   1313 <write>
    14bc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    14bf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    14c2:	0f b6 13             	movzbl (%ebx),%edx
    14c5:	83 c3 01             	add    $0x1,%ebx
    14c8:	84 d2                	test   %dl,%dl
    14ca:	74 24                	je     14f0 <printf+0x80>
    c = fmt[i] & 0xff;
    14cc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    14cf:	85 c9                	test   %ecx,%ecx
    14d1:	74 cd                	je     14a0 <printf+0x30>
      }
    } else if(state == '%'){
    14d3:	83 f9 25             	cmp    $0x25,%ecx
    14d6:	75 ea                	jne    14c2 <printf+0x52>
      if(c == 'd'){
    14d8:	83 f8 25             	cmp    $0x25,%eax
    14db:	0f 84 07 01 00 00    	je     15e8 <printf+0x178>
    14e1:	83 e8 63             	sub    $0x63,%eax
    14e4:	83 f8 15             	cmp    $0x15,%eax
    14e7:	77 17                	ja     1500 <printf+0x90>
    14e9:	ff 24 85 d0 17 00 00 	jmp    *0x17d0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14f3:	5b                   	pop    %ebx
    14f4:	5e                   	pop    %esi
    14f5:	5f                   	pop    %edi
    14f6:	5d                   	pop    %ebp
    14f7:	c3                   	ret    
    14f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop
  write(fd, &c, 1);
    1500:	83 ec 04             	sub    $0x4,%esp
    1503:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1506:	6a 01                	push   $0x1
    1508:	57                   	push   %edi
    1509:	56                   	push   %esi
    150a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    150e:	e8 00 fe ff ff       	call   1313 <write>
        putc(fd, c);
    1513:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1517:	83 c4 0c             	add    $0xc,%esp
    151a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    151d:	6a 01                	push   $0x1
    151f:	57                   	push   %edi
    1520:	56                   	push   %esi
    1521:	e8 ed fd ff ff       	call   1313 <write>
        putc(fd, c);
    1526:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1529:	31 c9                	xor    %ecx,%ecx
    152b:	eb 95                	jmp    14c2 <printf+0x52>
    152d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1530:	83 ec 0c             	sub    $0xc,%esp
    1533:	b9 10 00 00 00       	mov    $0x10,%ecx
    1538:	6a 00                	push   $0x0
    153a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    153d:	8b 10                	mov    (%eax),%edx
    153f:	89 f0                	mov    %esi,%eax
    1541:	e8 7a fe ff ff       	call   13c0 <printint>
        ap++;
    1546:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    154a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    154d:	31 c9                	xor    %ecx,%ecx
    154f:	e9 6e ff ff ff       	jmp    14c2 <printf+0x52>
    1554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1558:	8b 45 d0             	mov    -0x30(%ebp),%eax
    155b:	8b 10                	mov    (%eax),%edx
        ap++;
    155d:	83 c0 04             	add    $0x4,%eax
    1560:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1563:	85 d2                	test   %edx,%edx
    1565:	0f 84 8d 00 00 00    	je     15f8 <printf+0x188>
        while(*s != 0){
    156b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    156e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1570:	84 c0                	test   %al,%al
    1572:	0f 84 4a ff ff ff    	je     14c2 <printf+0x52>
    1578:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    157b:	89 d3                	mov    %edx,%ebx
    157d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1580:	83 ec 04             	sub    $0x4,%esp
          s++;
    1583:	83 c3 01             	add    $0x1,%ebx
    1586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1589:	6a 01                	push   $0x1
    158b:	57                   	push   %edi
    158c:	56                   	push   %esi
    158d:	e8 81 fd ff ff       	call   1313 <write>
        while(*s != 0){
    1592:	0f b6 03             	movzbl (%ebx),%eax
    1595:	83 c4 10             	add    $0x10,%esp
    1598:	84 c0                	test   %al,%al
    159a:	75 e4                	jne    1580 <printf+0x110>
      state = 0;
    159c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    159f:	31 c9                	xor    %ecx,%ecx
    15a1:	e9 1c ff ff ff       	jmp    14c2 <printf+0x52>
    15a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15b8:	6a 01                	push   $0x1
    15ba:	e9 7b ff ff ff       	jmp    153a <printf+0xca>
    15bf:	90                   	nop
        putc(fd, *ap);
    15c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    15c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    15c6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    15c8:	6a 01                	push   $0x1
    15ca:	57                   	push   %edi
    15cb:	56                   	push   %esi
        putc(fd, *ap);
    15cc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15cf:	e8 3f fd ff ff       	call   1313 <write>
        ap++;
    15d4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15db:	31 c9                	xor    %ecx,%ecx
    15dd:	e9 e0 fe ff ff       	jmp    14c2 <printf+0x52>
    15e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    15e8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    15eb:	83 ec 04             	sub    $0x4,%esp
    15ee:	e9 2a ff ff ff       	jmp    151d <printf+0xad>
    15f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15f7:	90                   	nop
          s = "(null)";
    15f8:	ba c7 17 00 00       	mov    $0x17c7,%edx
        while(*s != 0){
    15fd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1600:	b8 28 00 00 00       	mov    $0x28,%eax
    1605:	89 d3                	mov    %edx,%ebx
    1607:	e9 74 ff ff ff       	jmp    1580 <printf+0x110>
    160c:	66 90                	xchg   %ax,%ax
    160e:	66 90                	xchg   %ax,%ax

00001610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1611:	a1 d8 1a 00 00       	mov    0x1ad8,%eax
{
    1616:	89 e5                	mov    %esp,%ebp
    1618:	57                   	push   %edi
    1619:	56                   	push   %esi
    161a:	53                   	push   %ebx
    161b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    161e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1628:	89 c2                	mov    %eax,%edx
    162a:	8b 00                	mov    (%eax),%eax
    162c:	39 ca                	cmp    %ecx,%edx
    162e:	73 30                	jae    1660 <free+0x50>
    1630:	39 c1                	cmp    %eax,%ecx
    1632:	72 04                	jb     1638 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1634:	39 c2                	cmp    %eax,%edx
    1636:	72 f0                	jb     1628 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1638:	8b 73 fc             	mov    -0x4(%ebx),%esi
    163b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    163e:	39 f8                	cmp    %edi,%eax
    1640:	74 30                	je     1672 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1642:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1645:	8b 42 04             	mov    0x4(%edx),%eax
    1648:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    164b:	39 f1                	cmp    %esi,%ecx
    164d:	74 3a                	je     1689 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    164f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1651:	5b                   	pop    %ebx
  freep = p;
    1652:	89 15 d8 1a 00 00    	mov    %edx,0x1ad8
}
    1658:	5e                   	pop    %esi
    1659:	5f                   	pop    %edi
    165a:	5d                   	pop    %ebp
    165b:	c3                   	ret    
    165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1660:	39 c2                	cmp    %eax,%edx
    1662:	72 c4                	jb     1628 <free+0x18>
    1664:	39 c1                	cmp    %eax,%ecx
    1666:	73 c0                	jae    1628 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1668:	8b 73 fc             	mov    -0x4(%ebx),%esi
    166b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    166e:	39 f8                	cmp    %edi,%eax
    1670:	75 d0                	jne    1642 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1672:	03 70 04             	add    0x4(%eax),%esi
    1675:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1678:	8b 02                	mov    (%edx),%eax
    167a:	8b 00                	mov    (%eax),%eax
    167c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    167f:	8b 42 04             	mov    0x4(%edx),%eax
    1682:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1685:	39 f1                	cmp    %esi,%ecx
    1687:	75 c6                	jne    164f <free+0x3f>
    p->s.size += bp->s.size;
    1689:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    168c:	89 15 d8 1a 00 00    	mov    %edx,0x1ad8
    p->s.size += bp->s.size;
    1692:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1695:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1698:	89 0a                	mov    %ecx,(%edx)
}
    169a:	5b                   	pop    %ebx
    169b:	5e                   	pop    %esi
    169c:	5f                   	pop    %edi
    169d:	5d                   	pop    %ebp
    169e:	c3                   	ret    
    169f:	90                   	nop

000016a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16a0:	55                   	push   %ebp
    16a1:	89 e5                	mov    %esp,%ebp
    16a3:	57                   	push   %edi
    16a4:	56                   	push   %esi
    16a5:	53                   	push   %ebx
    16a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16ac:	8b 3d d8 1a 00 00    	mov    0x1ad8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16b2:	8d 70 07             	lea    0x7(%eax),%esi
    16b5:	c1 ee 03             	shr    $0x3,%esi
    16b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16bb:	85 ff                	test   %edi,%edi
    16bd:	0f 84 9d 00 00 00    	je     1760 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    16c5:	8b 4a 04             	mov    0x4(%edx),%ecx
    16c8:	39 f1                	cmp    %esi,%ecx
    16ca:	73 6a                	jae    1736 <malloc+0x96>
    16cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16d1:	39 de                	cmp    %ebx,%esi
    16d3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16d6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    16dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16e0:	eb 17                	jmp    16f9 <malloc+0x59>
    16e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16ea:	8b 48 04             	mov    0x4(%eax),%ecx
    16ed:	39 f1                	cmp    %esi,%ecx
    16ef:	73 4f                	jae    1740 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16f1:	8b 3d d8 1a 00 00    	mov    0x1ad8,%edi
    16f7:	89 c2                	mov    %eax,%edx
    16f9:	39 d7                	cmp    %edx,%edi
    16fb:	75 eb                	jne    16e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16fd:	83 ec 0c             	sub    $0xc,%esp
    1700:	ff 75 e4             	push   -0x1c(%ebp)
    1703:	e8 73 fc ff ff       	call   137b <sbrk>
  if(p == (char*)-1)
    1708:	83 c4 10             	add    $0x10,%esp
    170b:	83 f8 ff             	cmp    $0xffffffff,%eax
    170e:	74 1c                	je     172c <malloc+0x8c>
  hp->s.size = nu;
    1710:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1713:	83 ec 0c             	sub    $0xc,%esp
    1716:	83 c0 08             	add    $0x8,%eax
    1719:	50                   	push   %eax
    171a:	e8 f1 fe ff ff       	call   1610 <free>
  return freep;
    171f:	8b 15 d8 1a 00 00    	mov    0x1ad8,%edx
      if((p = morecore(nunits)) == 0)
    1725:	83 c4 10             	add    $0x10,%esp
    1728:	85 d2                	test   %edx,%edx
    172a:	75 bc                	jne    16e8 <malloc+0x48>
        return 0;
  }
}
    172c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    172f:	31 c0                	xor    %eax,%eax
}
    1731:	5b                   	pop    %ebx
    1732:	5e                   	pop    %esi
    1733:	5f                   	pop    %edi
    1734:	5d                   	pop    %ebp
    1735:	c3                   	ret    
    if(p->s.size >= nunits){
    1736:	89 d0                	mov    %edx,%eax
    1738:	89 fa                	mov    %edi,%edx
    173a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1740:	39 ce                	cmp    %ecx,%esi
    1742:	74 4c                	je     1790 <malloc+0xf0>
        p->s.size -= nunits;
    1744:	29 f1                	sub    %esi,%ecx
    1746:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    174c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    174f:	89 15 d8 1a 00 00    	mov    %edx,0x1ad8
}
    1755:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1758:	83 c0 08             	add    $0x8,%eax
}
    175b:	5b                   	pop    %ebx
    175c:	5e                   	pop    %esi
    175d:	5f                   	pop    %edi
    175e:	5d                   	pop    %ebp
    175f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1760:	c7 05 d8 1a 00 00 dc 	movl   $0x1adc,0x1ad8
    1767:	1a 00 00 
    base.s.size = 0;
    176a:	bf dc 1a 00 00       	mov    $0x1adc,%edi
    base.s.ptr = freep = prevp = &base;
    176f:	c7 05 dc 1a 00 00 dc 	movl   $0x1adc,0x1adc
    1776:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1779:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    177b:	c7 05 e0 1a 00 00 00 	movl   $0x0,0x1ae0
    1782:	00 00 00 
    if(p->s.size >= nunits){
    1785:	e9 42 ff ff ff       	jmp    16cc <malloc+0x2c>
    178a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1790:	8b 08                	mov    (%eax),%ecx
    1792:	89 0a                	mov    %ecx,(%edx)
    1794:	eb b9                	jmp    174f <malloc+0xaf>
