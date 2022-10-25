
_rm:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	bf 01 00 00 00       	mov    $0x1,%edi
    1013:	56                   	push   %esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 59 04             	mov    0x4(%ecx),%ebx
    101c:	8b 31                	mov    (%ecx),%esi
    101e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
    1021:	83 fe 01             	cmp    $0x1,%esi
    1024:	7e 3e                	jle    1064 <main+0x64>
    1026:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	push   (%ebx)
    1035:	e8 e9 02 00 00       	call   1323 <unlink>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	85 c0                	test   %eax,%eax
    103f:	78 0f                	js     1050 <main+0x50>
  for(i = 1; i < argc; i++){
    1041:	83 c7 01             	add    $0x1,%edi
    1044:	83 c3 04             	add    $0x4,%ebx
    1047:	39 fe                	cmp    %edi,%esi
    1049:	75 e5                	jne    1030 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
    104b:	e8 83 02 00 00       	call   12d3 <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
    1050:	50                   	push   %eax
    1051:	ff 33                	push   (%ebx)
    1053:	68 7c 17 00 00       	push   $0x177c
    1058:	6a 02                	push   $0x2
    105a:	e8 e1 03 00 00       	call   1440 <printf>
      break;
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	eb e7                	jmp    104b <main+0x4b>
    printf(2, "Usage: rm files...\n");
    1064:	52                   	push   %edx
    1065:	52                   	push   %edx
    1066:	68 68 17 00 00       	push   $0x1768
    106b:	6a 02                	push   $0x2
    106d:	e8 ce 03 00 00       	call   1440 <printf>
    exit();
    1072:	e8 5c 02 00 00       	call   12d3 <exit>
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1080:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1081:	31 c0                	xor    %eax,%eax
{
    1083:	89 e5                	mov    %esp,%ebp
    1085:	53                   	push   %ebx
    1086:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1089:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1090:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1094:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1097:	83 c0 01             	add    $0x1,%eax
    109a:	84 d2                	test   %dl,%dl
    109c:	75 f2                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    109e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10a1:	89 c8                	mov    %ecx,%eax
    10a3:	c9                   	leave  
    10a4:	c3                   	ret    
    10a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	84 c0                	test   %al,%al
    10bf:	75 17                	jne    10d8 <strcmp+0x28>
    10c1:	eb 3a                	jmp    10fd <strcmp+0x4d>
    10c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10c7:	90                   	nop
    10c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10cc:	83 c2 01             	add    $0x1,%edx
    10cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10d2:	84 c0                	test   %al,%al
    10d4:	74 1a                	je     10f0 <strcmp+0x40>
    p++, q++;
    10d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10d8:	0f b6 19             	movzbl (%ecx),%ebx
    10db:	38 c3                	cmp    %al,%bl
    10dd:	74 e9                	je     10c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10df:	29 d8                	sub    %ebx,%eax
}
    10e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10e4:	c9                   	leave  
    10e5:	c3                   	ret    
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10f4:	31 c0                	xor    %eax,%eax
    10f6:	29 d8                	sub    %ebx,%eax
}
    10f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10fb:	c9                   	leave  
    10fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10fd:	0f b6 19             	movzbl (%ecx),%ebx
    1100:	31 c0                	xor    %eax,%eax
    1102:	eb db                	jmp    10df <strcmp+0x2f>
    1104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop

00001110 <strlen>:

uint
strlen(const char *s)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1116:	80 3a 00             	cmpb   $0x0,(%edx)
    1119:	74 15                	je     1130 <strlen+0x20>
    111b:	31 c0                	xor    %eax,%eax
    111d:	8d 76 00             	lea    0x0(%esi),%esi
    1120:	83 c0 01             	add    $0x1,%eax
    1123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1127:	89 c1                	mov    %eax,%ecx
    1129:	75 f5                	jne    1120 <strlen+0x10>
    ;
  return n;
}
    112b:	89 c8                	mov    %ecx,%eax
    112d:	5d                   	pop    %ebp
    112e:	c3                   	ret    
    112f:	90                   	nop
  for(n = 0; s[n]; n++)
    1130:	31 c9                	xor    %ecx,%ecx
}
    1132:	5d                   	pop    %ebp
    1133:	89 c8                	mov    %ecx,%eax
    1135:	c3                   	ret    
    1136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113d:	8d 76 00             	lea    0x0(%esi),%esi

00001140 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1147:	8b 4d 10             	mov    0x10(%ebp),%ecx
    114a:	8b 45 0c             	mov    0xc(%ebp),%eax
    114d:	89 d7                	mov    %edx,%edi
    114f:	fc                   	cld    
    1150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1152:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1155:	89 d0                	mov    %edx,%eax
    1157:	c9                   	leave  
    1158:	c3                   	ret    
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001160 <strchr>:

char*
strchr(const char *s, char c)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	8b 45 08             	mov    0x8(%ebp),%eax
    1166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    116a:	0f b6 10             	movzbl (%eax),%edx
    116d:	84 d2                	test   %dl,%dl
    116f:	75 12                	jne    1183 <strchr+0x23>
    1171:	eb 1d                	jmp    1190 <strchr+0x30>
    1173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1177:	90                   	nop
    1178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    117c:	83 c0 01             	add    $0x1,%eax
    117f:	84 d2                	test   %dl,%dl
    1181:	74 0d                	je     1190 <strchr+0x30>
    if(*s == c)
    1183:	38 d1                	cmp    %dl,%cl
    1185:	75 f1                	jne    1178 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1187:	5d                   	pop    %ebp
    1188:	c3                   	ret    
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1190:	31 c0                	xor    %eax,%eax
}
    1192:	5d                   	pop    %ebp
    1193:	c3                   	ret    
    1194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop

000011a0 <gets>:

char*
gets(char *buf, int max)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    11a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11a9:	31 db                	xor    %ebx,%ebx
{
    11ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11ae:	eb 27                	jmp    11d7 <gets+0x37>
    cc = read(0, &c, 1);
    11b0:	83 ec 04             	sub    $0x4,%esp
    11b3:	6a 01                	push   $0x1
    11b5:	57                   	push   %edi
    11b6:	6a 00                	push   $0x0
    11b8:	e8 2e 01 00 00       	call   12eb <read>
    if(cc < 1)
    11bd:	83 c4 10             	add    $0x10,%esp
    11c0:	85 c0                	test   %eax,%eax
    11c2:	7e 1d                	jle    11e1 <gets+0x41>
      break;
    buf[i++] = c;
    11c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c8:	8b 55 08             	mov    0x8(%ebp),%edx
    11cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11cf:	3c 0a                	cmp    $0xa,%al
    11d1:	74 1d                	je     11f0 <gets+0x50>
    11d3:	3c 0d                	cmp    $0xd,%al
    11d5:	74 19                	je     11f0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11d7:	89 de                	mov    %ebx,%esi
    11d9:	83 c3 01             	add    $0x1,%ebx
    11dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11df:	7c cf                	jl     11b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11e1:	8b 45 08             	mov    0x8(%ebp),%eax
    11e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11eb:	5b                   	pop    %ebx
    11ec:	5e                   	pop    %esi
    11ed:	5f                   	pop    %edi
    11ee:	5d                   	pop    %ebp
    11ef:	c3                   	ret    
  buf[i] = '\0';
    11f0:	8b 45 08             	mov    0x8(%ebp),%eax
    11f3:	89 de                	mov    %ebx,%esi
    11f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fc:	5b                   	pop    %ebx
    11fd:	5e                   	pop    %esi
    11fe:	5f                   	pop    %edi
    11ff:	5d                   	pop    %ebp
    1200:	c3                   	ret    
    1201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <stat>:

int
stat(const char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	push   0x8(%ebp)
    121d:	e8 f1 00 00 00       	call   1313 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	push   0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 f4 00 00 00       	call   132b <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 ba 00 00 00       	call   12fb <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 02             	movsbl (%edx),%eax
    126a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    126d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1275:	77 1e                	ja     1295 <atoi+0x35>
    1277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1280:	83 c2 01             	add    $0x1,%edx
    1283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    128a:	0f be 02             	movsbl (%edx),%eax
    128d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1298:	89 c8                	mov    %ecx,%eax
    129a:	c9                   	leave  
    129b:	c3                   	ret    
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	8b 45 10             	mov    0x10(%ebp),%eax
    12a7:	8b 55 08             	mov    0x8(%ebp),%edx
    12aa:	56                   	push   %esi
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 c0                	test   %eax,%eax
    12b0:	7e 13                	jle    12c5 <memmove+0x25>
    12b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12b4:	89 d7                	mov    %edx,%edi
    12b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12c1:	39 f8                	cmp    %edi,%eax
    12c3:	75 fb                	jne    12c0 <memmove+0x20>
  return vdst;
}
    12c5:	5e                   	pop    %esi
    12c6:	89 d0                	mov    %edx,%eax
    12c8:	5f                   	pop    %edi
    12c9:	5d                   	pop    %ebp
    12ca:	c3                   	ret    

000012cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12cb:	b8 01 00 00 00       	mov    $0x1,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <exit>:
SYSCALL(exit)
    12d3:	b8 02 00 00 00       	mov    $0x2,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <wait>:
SYSCALL(wait)
    12db:	b8 03 00 00 00       	mov    $0x3,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <pipe>:
SYSCALL(pipe)
    12e3:	b8 04 00 00 00       	mov    $0x4,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <read>:
SYSCALL(read)
    12eb:	b8 05 00 00 00       	mov    $0x5,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <write>:
SYSCALL(write)
    12f3:	b8 10 00 00 00       	mov    $0x10,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <close>:
SYSCALL(close)
    12fb:	b8 15 00 00 00       	mov    $0x15,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <kill>:
SYSCALL(kill)
    1303:	b8 06 00 00 00       	mov    $0x6,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <exec>:
SYSCALL(exec)
    130b:	b8 07 00 00 00       	mov    $0x7,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <open>:
SYSCALL(open)
    1313:	b8 0f 00 00 00       	mov    $0xf,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <mknod>:
SYSCALL(mknod)
    131b:	b8 11 00 00 00       	mov    $0x11,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <unlink>:
SYSCALL(unlink)
    1323:	b8 12 00 00 00       	mov    $0x12,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <fstat>:
SYSCALL(fstat)
    132b:	b8 08 00 00 00       	mov    $0x8,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <link>:
SYSCALL(link)
    1333:	b8 13 00 00 00       	mov    $0x13,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <mkdir>:
SYSCALL(mkdir)
    133b:	b8 14 00 00 00       	mov    $0x14,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <chdir>:
SYSCALL(chdir)
    1343:	b8 09 00 00 00       	mov    $0x9,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <dup>:
SYSCALL(dup)
    134b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <getpid>:
SYSCALL(getpid)
    1353:	b8 0b 00 00 00       	mov    $0xb,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <sbrk>:
SYSCALL(sbrk)
    135b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <sleep>:
SYSCALL(sleep)
    1363:	b8 0d 00 00 00       	mov    $0xd,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <uptime>:
SYSCALL(uptime)
    136b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <getpinfo>:

SYSCALL(getpinfo)
    1373:	b8 16 00 00 00       	mov    $0x16,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <settickets>:
SYSCALL(settickets)
    137b:	b8 17 00 00 00       	mov    $0x17,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    
    1383:	66 90                	xchg   %ax,%ax
    1385:	66 90                	xchg   %ax,%ax
    1387:	66 90                	xchg   %ax,%ax
    1389:	66 90                	xchg   %ax,%ax
    138b:	66 90                	xchg   %ax,%ax
    138d:	66 90                	xchg   %ax,%ax
    138f:	90                   	nop

00001390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	57                   	push   %edi
    1394:	56                   	push   %esi
    1395:	53                   	push   %ebx
    1396:	83 ec 3c             	sub    $0x3c,%esp
    1399:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    139c:	89 d1                	mov    %edx,%ecx
{
    139e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    13a1:	85 d2                	test   %edx,%edx
    13a3:	0f 89 7f 00 00 00    	jns    1428 <printint+0x98>
    13a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13ad:	74 79                	je     1428 <printint+0x98>
    neg = 1;
    13af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13b8:	31 db                	xor    %ebx,%ebx
    13ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13c0:	89 c8                	mov    %ecx,%eax
    13c2:	31 d2                	xor    %edx,%edx
    13c4:	89 cf                	mov    %ecx,%edi
    13c6:	f7 75 c4             	divl   -0x3c(%ebp)
    13c9:	0f b6 92 f4 17 00 00 	movzbl 0x17f4(%edx),%edx
    13d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13d3:	89 d8                	mov    %ebx,%eax
    13d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13e1:	76 dd                	jbe    13c0 <printint+0x30>
  if(neg)
    13e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13e6:	85 c9                	test   %ecx,%ecx
    13e8:	74 0c                	je     13f6 <printint+0x66>
    buf[i++] = '-';
    13ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13fd:	eb 07                	jmp    1406 <printint+0x76>
    13ff:	90                   	nop
    putc(fd, buf[i]);
    1400:	0f b6 13             	movzbl (%ebx),%edx
    1403:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1406:	83 ec 04             	sub    $0x4,%esp
    1409:	88 55 d7             	mov    %dl,-0x29(%ebp)
    140c:	6a 01                	push   $0x1
    140e:	56                   	push   %esi
    140f:	57                   	push   %edi
    1410:	e8 de fe ff ff       	call   12f3 <write>
  while(--i >= 0)
    1415:	83 c4 10             	add    $0x10,%esp
    1418:	39 de                	cmp    %ebx,%esi
    141a:	75 e4                	jne    1400 <printint+0x70>
}
    141c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    141f:	5b                   	pop    %ebx
    1420:	5e                   	pop    %esi
    1421:	5f                   	pop    %edi
    1422:	5d                   	pop    %ebp
    1423:	c3                   	ret    
    1424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1428:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    142f:	eb 87                	jmp    13b8 <printint+0x28>
    1431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143f:	90                   	nop

00001440 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	57                   	push   %edi
    1444:	56                   	push   %esi
    1445:	53                   	push   %ebx
    1446:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1449:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    144c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    144f:	0f b6 13             	movzbl (%ebx),%edx
    1452:	84 d2                	test   %dl,%dl
    1454:	74 6a                	je     14c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1456:	8d 45 10             	lea    0x10(%ebp),%eax
    1459:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    145c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    145f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1461:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1464:	eb 36                	jmp    149c <printf+0x5c>
    1466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    146d:	8d 76 00             	lea    0x0(%esi),%esi
    1470:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1473:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1478:	83 f8 25             	cmp    $0x25,%eax
    147b:	74 15                	je     1492 <printf+0x52>
  write(fd, &c, 1);
    147d:	83 ec 04             	sub    $0x4,%esp
    1480:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1483:	6a 01                	push   $0x1
    1485:	57                   	push   %edi
    1486:	56                   	push   %esi
    1487:	e8 67 fe ff ff       	call   12f3 <write>
    148c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    148f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1492:	0f b6 13             	movzbl (%ebx),%edx
    1495:	83 c3 01             	add    $0x1,%ebx
    1498:	84 d2                	test   %dl,%dl
    149a:	74 24                	je     14c0 <printf+0x80>
    c = fmt[i] & 0xff;
    149c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    149f:	85 c9                	test   %ecx,%ecx
    14a1:	74 cd                	je     1470 <printf+0x30>
      }
    } else if(state == '%'){
    14a3:	83 f9 25             	cmp    $0x25,%ecx
    14a6:	75 ea                	jne    1492 <printf+0x52>
      if(c == 'd'){
    14a8:	83 f8 25             	cmp    $0x25,%eax
    14ab:	0f 84 07 01 00 00    	je     15b8 <printf+0x178>
    14b1:	83 e8 63             	sub    $0x63,%eax
    14b4:	83 f8 15             	cmp    $0x15,%eax
    14b7:	77 17                	ja     14d0 <printf+0x90>
    14b9:	ff 24 85 9c 17 00 00 	jmp    *0x179c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14c3:	5b                   	pop    %ebx
    14c4:	5e                   	pop    %esi
    14c5:	5f                   	pop    %edi
    14c6:	5d                   	pop    %ebp
    14c7:	c3                   	ret    
    14c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cf:	90                   	nop
  write(fd, &c, 1);
    14d0:	83 ec 04             	sub    $0x4,%esp
    14d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    14d6:	6a 01                	push   $0x1
    14d8:	57                   	push   %edi
    14d9:	56                   	push   %esi
    14da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14de:	e8 10 fe ff ff       	call   12f3 <write>
        putc(fd, c);
    14e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    14e7:	83 c4 0c             	add    $0xc,%esp
    14ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14ed:	6a 01                	push   $0x1
    14ef:	57                   	push   %edi
    14f0:	56                   	push   %esi
    14f1:	e8 fd fd ff ff       	call   12f3 <write>
        putc(fd, c);
    14f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14f9:	31 c9                	xor    %ecx,%ecx
    14fb:	eb 95                	jmp    1492 <printf+0x52>
    14fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1500:	83 ec 0c             	sub    $0xc,%esp
    1503:	b9 10 00 00 00       	mov    $0x10,%ecx
    1508:	6a 00                	push   $0x0
    150a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    150d:	8b 10                	mov    (%eax),%edx
    150f:	89 f0                	mov    %esi,%eax
    1511:	e8 7a fe ff ff       	call   1390 <printint>
        ap++;
    1516:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    151a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    151d:	31 c9                	xor    %ecx,%ecx
    151f:	e9 6e ff ff ff       	jmp    1492 <printf+0x52>
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1528:	8b 45 d0             	mov    -0x30(%ebp),%eax
    152b:	8b 10                	mov    (%eax),%edx
        ap++;
    152d:	83 c0 04             	add    $0x4,%eax
    1530:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1533:	85 d2                	test   %edx,%edx
    1535:	0f 84 8d 00 00 00    	je     15c8 <printf+0x188>
        while(*s != 0){
    153b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    153e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1540:	84 c0                	test   %al,%al
    1542:	0f 84 4a ff ff ff    	je     1492 <printf+0x52>
    1548:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    154b:	89 d3                	mov    %edx,%ebx
    154d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1550:	83 ec 04             	sub    $0x4,%esp
          s++;
    1553:	83 c3 01             	add    $0x1,%ebx
    1556:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1559:	6a 01                	push   $0x1
    155b:	57                   	push   %edi
    155c:	56                   	push   %esi
    155d:	e8 91 fd ff ff       	call   12f3 <write>
        while(*s != 0){
    1562:	0f b6 03             	movzbl (%ebx),%eax
    1565:	83 c4 10             	add    $0x10,%esp
    1568:	84 c0                	test   %al,%al
    156a:	75 e4                	jne    1550 <printf+0x110>
      state = 0;
    156c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    156f:	31 c9                	xor    %ecx,%ecx
    1571:	e9 1c ff ff ff       	jmp    1492 <printf+0x52>
    1576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1588:	6a 01                	push   $0x1
    158a:	e9 7b ff ff ff       	jmp    150a <printf+0xca>
    158f:	90                   	nop
        putc(fd, *ap);
    1590:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1593:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1596:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1598:	6a 01                	push   $0x1
    159a:	57                   	push   %edi
    159b:	56                   	push   %esi
        putc(fd, *ap);
    159c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    159f:	e8 4f fd ff ff       	call   12f3 <write>
        ap++;
    15a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15ab:	31 c9                	xor    %ecx,%ecx
    15ad:	e9 e0 fe ff ff       	jmp    1492 <printf+0x52>
    15b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    15b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    15bb:	83 ec 04             	sub    $0x4,%esp
    15be:	e9 2a ff ff ff       	jmp    14ed <printf+0xad>
    15c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15c7:	90                   	nop
          s = "(null)";
    15c8:	ba 95 17 00 00       	mov    $0x1795,%edx
        while(*s != 0){
    15cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15d0:	b8 28 00 00 00       	mov    $0x28,%eax
    15d5:	89 d3                	mov    %edx,%ebx
    15d7:	e9 74 ff ff ff       	jmp    1550 <printf+0x110>
    15dc:	66 90                	xchg   %ax,%ax
    15de:	66 90                	xchg   %ax,%ax

000015e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e1:	a1 ac 1a 00 00       	mov    0x1aac,%eax
{
    15e6:	89 e5                	mov    %esp,%ebp
    15e8:	57                   	push   %edi
    15e9:	56                   	push   %esi
    15ea:	53                   	push   %ebx
    15eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15f8:	89 c2                	mov    %eax,%edx
    15fa:	8b 00                	mov    (%eax),%eax
    15fc:	39 ca                	cmp    %ecx,%edx
    15fe:	73 30                	jae    1630 <free+0x50>
    1600:	39 c1                	cmp    %eax,%ecx
    1602:	72 04                	jb     1608 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1604:	39 c2                	cmp    %eax,%edx
    1606:	72 f0                	jb     15f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1608:	8b 73 fc             	mov    -0x4(%ebx),%esi
    160b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    160e:	39 f8                	cmp    %edi,%eax
    1610:	74 30                	je     1642 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1612:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1615:	8b 42 04             	mov    0x4(%edx),%eax
    1618:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    161b:	39 f1                	cmp    %esi,%ecx
    161d:	74 3a                	je     1659 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    161f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1621:	5b                   	pop    %ebx
  freep = p;
    1622:	89 15 ac 1a 00 00    	mov    %edx,0x1aac
}
    1628:	5e                   	pop    %esi
    1629:	5f                   	pop    %edi
    162a:	5d                   	pop    %ebp
    162b:	c3                   	ret    
    162c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1630:	39 c2                	cmp    %eax,%edx
    1632:	72 c4                	jb     15f8 <free+0x18>
    1634:	39 c1                	cmp    %eax,%ecx
    1636:	73 c0                	jae    15f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1638:	8b 73 fc             	mov    -0x4(%ebx),%esi
    163b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    163e:	39 f8                	cmp    %edi,%eax
    1640:	75 d0                	jne    1612 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1642:	03 70 04             	add    0x4(%eax),%esi
    1645:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1648:	8b 02                	mov    (%edx),%eax
    164a:	8b 00                	mov    (%eax),%eax
    164c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    164f:	8b 42 04             	mov    0x4(%edx),%eax
    1652:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1655:	39 f1                	cmp    %esi,%ecx
    1657:	75 c6                	jne    161f <free+0x3f>
    p->s.size += bp->s.size;
    1659:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    165c:	89 15 ac 1a 00 00    	mov    %edx,0x1aac
    p->s.size += bp->s.size;
    1662:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1665:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1668:	89 0a                	mov    %ecx,(%edx)
}
    166a:	5b                   	pop    %ebx
    166b:	5e                   	pop    %esi
    166c:	5f                   	pop    %edi
    166d:	5d                   	pop    %ebp
    166e:	c3                   	ret    
    166f:	90                   	nop

00001670 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1670:	55                   	push   %ebp
    1671:	89 e5                	mov    %esp,%ebp
    1673:	57                   	push   %edi
    1674:	56                   	push   %esi
    1675:	53                   	push   %ebx
    1676:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1679:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    167c:	8b 3d ac 1a 00 00    	mov    0x1aac,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1682:	8d 70 07             	lea    0x7(%eax),%esi
    1685:	c1 ee 03             	shr    $0x3,%esi
    1688:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    168b:	85 ff                	test   %edi,%edi
    168d:	0f 84 9d 00 00 00    	je     1730 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1693:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1695:	8b 4a 04             	mov    0x4(%edx),%ecx
    1698:	39 f1                	cmp    %esi,%ecx
    169a:	73 6a                	jae    1706 <malloc+0x96>
    169c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16a1:	39 de                	cmp    %ebx,%esi
    16a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    16ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16b0:	eb 17                	jmp    16c9 <malloc+0x59>
    16b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16ba:	8b 48 04             	mov    0x4(%eax),%ecx
    16bd:	39 f1                	cmp    %esi,%ecx
    16bf:	73 4f                	jae    1710 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16c1:	8b 3d ac 1a 00 00    	mov    0x1aac,%edi
    16c7:	89 c2                	mov    %eax,%edx
    16c9:	39 d7                	cmp    %edx,%edi
    16cb:	75 eb                	jne    16b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16cd:	83 ec 0c             	sub    $0xc,%esp
    16d0:	ff 75 e4             	push   -0x1c(%ebp)
    16d3:	e8 83 fc ff ff       	call   135b <sbrk>
  if(p == (char*)-1)
    16d8:	83 c4 10             	add    $0x10,%esp
    16db:	83 f8 ff             	cmp    $0xffffffff,%eax
    16de:	74 1c                	je     16fc <malloc+0x8c>
  hp->s.size = nu;
    16e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16e3:	83 ec 0c             	sub    $0xc,%esp
    16e6:	83 c0 08             	add    $0x8,%eax
    16e9:	50                   	push   %eax
    16ea:	e8 f1 fe ff ff       	call   15e0 <free>
  return freep;
    16ef:	8b 15 ac 1a 00 00    	mov    0x1aac,%edx
      if((p = morecore(nunits)) == 0)
    16f5:	83 c4 10             	add    $0x10,%esp
    16f8:	85 d2                	test   %edx,%edx
    16fa:	75 bc                	jne    16b8 <malloc+0x48>
        return 0;
  }
}
    16fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16ff:	31 c0                	xor    %eax,%eax
}
    1701:	5b                   	pop    %ebx
    1702:	5e                   	pop    %esi
    1703:	5f                   	pop    %edi
    1704:	5d                   	pop    %ebp
    1705:	c3                   	ret    
    if(p->s.size >= nunits){
    1706:	89 d0                	mov    %edx,%eax
    1708:	89 fa                	mov    %edi,%edx
    170a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1710:	39 ce                	cmp    %ecx,%esi
    1712:	74 4c                	je     1760 <malloc+0xf0>
        p->s.size -= nunits;
    1714:	29 f1                	sub    %esi,%ecx
    1716:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1719:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    171c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    171f:	89 15 ac 1a 00 00    	mov    %edx,0x1aac
}
    1725:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1728:	83 c0 08             	add    $0x8,%eax
}
    172b:	5b                   	pop    %ebx
    172c:	5e                   	pop    %esi
    172d:	5f                   	pop    %edi
    172e:	5d                   	pop    %ebp
    172f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1730:	c7 05 ac 1a 00 00 b0 	movl   $0x1ab0,0x1aac
    1737:	1a 00 00 
    base.s.size = 0;
    173a:	bf b0 1a 00 00       	mov    $0x1ab0,%edi
    base.s.ptr = freep = prevp = &base;
    173f:	c7 05 b0 1a 00 00 b0 	movl   $0x1ab0,0x1ab0
    1746:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1749:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    174b:	c7 05 b4 1a 00 00 00 	movl   $0x0,0x1ab4
    1752:	00 00 00 
    if(p->s.size >= nunits){
    1755:	e9 42 ff ff ff       	jmp    169c <malloc+0x2c>
    175a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1760:	8b 08                	mov    (%eax),%ecx
    1762:	89 0a                	mov    %ecx,(%edx)
    1764:	eb b9                	jmp    171f <malloc+0xaf>
