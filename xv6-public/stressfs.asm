
_stressfs:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
    1007:	b8 30 00 00 00       	mov    $0x30,%eax
{
    100c:	ff 71 fc             	push   -0x4(%ecx)
    100f:	55                   	push   %ebp
    1010:	89 e5                	mov    %esp,%ebp
    1012:	57                   	push   %edi
    1013:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
    1014:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
    101a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
    101b:	31 db                	xor    %ebx,%ebx
{
    101d:	51                   	push   %ecx
    101e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
    1024:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
    102b:	68 28 18 00 00       	push   $0x1828
    1030:	6a 01                	push   $0x1
  char path[] = "stressfs0";
    1032:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
    1039:	74 72 65 
    103c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
    1043:	73 66 73 
  printf(1, "stressfs starting\n");
    1046:	e8 b5 04 00 00       	call   1500 <printf>
  memset(data, 'a', sizeof(data));
    104b:	83 c4 0c             	add    $0xc,%esp
    104e:	68 00 02 00 00       	push   $0x200
    1053:	6a 61                	push   $0x61
    1055:	56                   	push   %esi
    1056:	e8 a5 01 00 00       	call   1200 <memset>
    105b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
    105e:	e8 28 03 00 00       	call   138b <fork>
    1063:	85 c0                	test   %eax,%eax
    1065:	0f 8f bf 00 00 00    	jg     112a <main+0x12a>
  for(i = 0; i < 4; i++)
    106b:	83 c3 01             	add    $0x1,%ebx
    106e:	83 fb 04             	cmp    $0x4,%ebx
    1071:	75 eb                	jne    105e <main+0x5e>
    1073:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
    1078:	83 ec 04             	sub    $0x4,%esp
    107b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
    107c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
    1081:	68 3b 18 00 00       	push   $0x183b
    1086:	6a 01                	push   $0x1
    1088:	e8 73 04 00 00       	call   1500 <printf>
  path[8] += i;
    108d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
    108f:	5f                   	pop    %edi
  path[8] += i;
    1090:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
    1096:	58                   	pop    %eax
    1097:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    109d:	68 02 02 00 00       	push   $0x202
    10a2:	50                   	push   %eax
    10a3:	e8 2b 03 00 00       	call   13d3 <open>
    10a8:	83 c4 10             	add    $0x10,%esp
    10ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 02 00 00       	push   $0x200
    10b8:	56                   	push   %esi
    10b9:	57                   	push   %edi
    10ba:	e8 f4 02 00 00       	call   13b3 <write>
  for(i = 0; i < 20; i++)
    10bf:	83 c4 10             	add    $0x10,%esp
    10c2:	83 eb 01             	sub    $0x1,%ebx
    10c5:	75 e9                	jne    10b0 <main+0xb0>
  close(fd);
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	57                   	push   %edi
    10cb:	e8 eb 02 00 00       	call   13bb <close>

  printf(1, "read\n");
    10d0:	58                   	pop    %eax
    10d1:	5a                   	pop    %edx
    10d2:	68 45 18 00 00       	push   $0x1845
    10d7:	6a 01                	push   $0x1
    10d9:	e8 22 04 00 00       	call   1500 <printf>

  fd = open(path, O_RDONLY);
    10de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    10e4:	59                   	pop    %ecx
    10e5:	5b                   	pop    %ebx
    10e6:	6a 00                	push   $0x0
    10e8:	bb 14 00 00 00       	mov    $0x14,%ebx
    10ed:	50                   	push   %eax
    10ee:	e8 e0 02 00 00       	call   13d3 <open>
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    10f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ff:	90                   	nop
    read(fd, data, sizeof(data));
    1100:	83 ec 04             	sub    $0x4,%esp
    1103:	68 00 02 00 00       	push   $0x200
    1108:	56                   	push   %esi
    1109:	57                   	push   %edi
    110a:	e8 9c 02 00 00       	call   13ab <read>
  for (i = 0; i < 20; i++)
    110f:	83 c4 10             	add    $0x10,%esp
    1112:	83 eb 01             	sub    $0x1,%ebx
    1115:	75 e9                	jne    1100 <main+0x100>
  close(fd);
    1117:	83 ec 0c             	sub    $0xc,%esp
    111a:	57                   	push   %edi
    111b:	e8 9b 02 00 00       	call   13bb <close>

  wait();
    1120:	e8 76 02 00 00       	call   139b <wait>

  exit();
    1125:	e8 69 02 00 00       	call   1393 <exit>
  path[8] += i;
    112a:	89 df                	mov    %ebx,%edi
    112c:	e9 47 ff ff ff       	jmp    1078 <main+0x78>
    1131:	66 90                	xchg   %ax,%ax
    1133:	66 90                	xchg   %ax,%ax
    1135:	66 90                	xchg   %ax,%ax
    1137:	66 90                	xchg   %ax,%ax
    1139:	66 90                	xchg   %ax,%ax
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1141:	31 c0                	xor    %eax,%eax
{
    1143:	89 e5                	mov    %esp,%ebp
    1145:	53                   	push   %ebx
    1146:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1157:	83 c0 01             	add    $0x1,%eax
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strcpy+0x10>
    ;
  return os;
}
    115e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1161:	89 c8                	mov    %ecx,%eax
    1163:	c9                   	leave  
    1164:	c3                   	ret    
    1165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 55 08             	mov    0x8(%ebp),%edx
    1177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    117a:	0f b6 02             	movzbl (%edx),%eax
    117d:	84 c0                	test   %al,%al
    117f:	75 17                	jne    1198 <strcmp+0x28>
    1181:	eb 3a                	jmp    11bd <strcmp+0x4d>
    1183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1187:	90                   	nop
    1188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    118c:	83 c2 01             	add    $0x1,%edx
    118f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1192:	84 c0                	test   %al,%al
    1194:	74 1a                	je     11b0 <strcmp+0x40>
    p++, q++;
    1196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1198:	0f b6 19             	movzbl (%ecx),%ebx
    119b:	38 c3                	cmp    %al,%bl
    119d:	74 e9                	je     1188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    119f:	29 d8                	sub    %ebx,%eax
}
    11a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11a4:	c9                   	leave  
    11a5:	c3                   	ret    
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    11b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    11b4:	31 c0                	xor    %eax,%eax
    11b6:	29 d8                	sub    %ebx,%eax
}
    11b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11bb:	c9                   	leave  
    11bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    11bd:	0f b6 19             	movzbl (%ecx),%ebx
    11c0:	31 c0                	xor    %eax,%eax
    11c2:	eb db                	jmp    119f <strcmp+0x2f>
    11c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11cf:	90                   	nop

000011d0 <strlen>:

uint
strlen(const char *s)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11d6:	80 3a 00             	cmpb   $0x0,(%edx)
    11d9:	74 15                	je     11f0 <strlen+0x20>
    11db:	31 c0                	xor    %eax,%eax
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
    11e0:	83 c0 01             	add    $0x1,%eax
    11e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11e7:	89 c1                	mov    %eax,%ecx
    11e9:	75 f5                	jne    11e0 <strlen+0x10>
    ;
  return n;
}
    11eb:	89 c8                	mov    %ecx,%eax
    11ed:	5d                   	pop    %ebp
    11ee:	c3                   	ret    
    11ef:	90                   	nop
  for(n = 0; s[n]; n++)
    11f0:	31 c9                	xor    %ecx,%ecx
}
    11f2:	5d                   	pop    %ebp
    11f3:	89 c8                	mov    %ecx,%eax
    11f5:	c3                   	ret    
    11f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11fd:	8d 76 00             	lea    0x0(%esi),%esi

00001200 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	57                   	push   %edi
    1204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1207:	8b 4d 10             	mov    0x10(%ebp),%ecx
    120a:	8b 45 0c             	mov    0xc(%ebp),%eax
    120d:	89 d7                	mov    %edx,%edi
    120f:	fc                   	cld    
    1210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1212:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1215:	89 d0                	mov    %edx,%eax
    1217:	c9                   	leave  
    1218:	c3                   	ret    
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001220 <strchr>:

char*
strchr(const char *s, char c)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	8b 45 08             	mov    0x8(%ebp),%eax
    1226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    122a:	0f b6 10             	movzbl (%eax),%edx
    122d:	84 d2                	test   %dl,%dl
    122f:	75 12                	jne    1243 <strchr+0x23>
    1231:	eb 1d                	jmp    1250 <strchr+0x30>
    1233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1237:	90                   	nop
    1238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    123c:	83 c0 01             	add    $0x1,%eax
    123f:	84 d2                	test   %dl,%dl
    1241:	74 0d                	je     1250 <strchr+0x30>
    if(*s == c)
    1243:	38 d1                	cmp    %dl,%cl
    1245:	75 f1                	jne    1238 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1247:	5d                   	pop    %ebp
    1248:	c3                   	ret    
    1249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1250:	31 c0                	xor    %eax,%eax
}
    1252:	5d                   	pop    %ebp
    1253:	c3                   	ret    
    1254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    125f:	90                   	nop

00001260 <gets>:

char*
gets(char *buf, int max)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	57                   	push   %edi
    1264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1269:	31 db                	xor    %ebx,%ebx
{
    126b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    126e:	eb 27                	jmp    1297 <gets+0x37>
    cc = read(0, &c, 1);
    1270:	83 ec 04             	sub    $0x4,%esp
    1273:	6a 01                	push   $0x1
    1275:	57                   	push   %edi
    1276:	6a 00                	push   $0x0
    1278:	e8 2e 01 00 00       	call   13ab <read>
    if(cc < 1)
    127d:	83 c4 10             	add    $0x10,%esp
    1280:	85 c0                	test   %eax,%eax
    1282:	7e 1d                	jle    12a1 <gets+0x41>
      break;
    buf[i++] = c;
    1284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1288:	8b 55 08             	mov    0x8(%ebp),%edx
    128b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    128f:	3c 0a                	cmp    $0xa,%al
    1291:	74 1d                	je     12b0 <gets+0x50>
    1293:	3c 0d                	cmp    $0xd,%al
    1295:	74 19                	je     12b0 <gets+0x50>
  for(i=0; i+1 < max; ){
    1297:	89 de                	mov    %ebx,%esi
    1299:	83 c3 01             	add    $0x1,%ebx
    129c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    129f:	7c cf                	jl     1270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    12a1:	8b 45 08             	mov    0x8(%ebp),%eax
    12a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ab:	5b                   	pop    %ebx
    12ac:	5e                   	pop    %esi
    12ad:	5f                   	pop    %edi
    12ae:	5d                   	pop    %ebp
    12af:	c3                   	ret    
  buf[i] = '\0';
    12b0:	8b 45 08             	mov    0x8(%ebp),%eax
    12b3:	89 de                	mov    %ebx,%esi
    12b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    12b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12bc:	5b                   	pop    %ebx
    12bd:	5e                   	pop    %esi
    12be:	5f                   	pop    %edi
    12bf:	5d                   	pop    %ebp
    12c0:	c3                   	ret    
    12c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12cf:	90                   	nop

000012d0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	56                   	push   %esi
    12d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12d5:	83 ec 08             	sub    $0x8,%esp
    12d8:	6a 00                	push   $0x0
    12da:	ff 75 08             	push   0x8(%ebp)
    12dd:	e8 f1 00 00 00       	call   13d3 <open>
  if(fd < 0)
    12e2:	83 c4 10             	add    $0x10,%esp
    12e5:	85 c0                	test   %eax,%eax
    12e7:	78 27                	js     1310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12e9:	83 ec 08             	sub    $0x8,%esp
    12ec:	ff 75 0c             	push   0xc(%ebp)
    12ef:	89 c3                	mov    %eax,%ebx
    12f1:	50                   	push   %eax
    12f2:	e8 f4 00 00 00       	call   13eb <fstat>
  close(fd);
    12f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12fa:	89 c6                	mov    %eax,%esi
  close(fd);
    12fc:	e8 ba 00 00 00       	call   13bb <close>
  return r;
    1301:	83 c4 10             	add    $0x10,%esp
}
    1304:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1307:	89 f0                	mov    %esi,%eax
    1309:	5b                   	pop    %ebx
    130a:	5e                   	pop    %esi
    130b:	5d                   	pop    %ebp
    130c:	c3                   	ret    
    130d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1310:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1315:	eb ed                	jmp    1304 <stat+0x34>
    1317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    131e:	66 90                	xchg   %ax,%ax

00001320 <atoi>:

int
atoi(const char *s)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	53                   	push   %ebx
    1324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1327:	0f be 02             	movsbl (%edx),%eax
    132a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    132d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1335:	77 1e                	ja     1355 <atoi+0x35>
    1337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    133e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1340:	83 c2 01             	add    $0x1,%edx
    1343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    134a:	0f be 02             	movsbl (%edx),%eax
    134d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1350:	80 fb 09             	cmp    $0x9,%bl
    1353:	76 eb                	jbe    1340 <atoi+0x20>
  return n;
}
    1355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1358:	89 c8                	mov    %ecx,%eax
    135a:	c9                   	leave  
    135b:	c3                   	ret    
    135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	8b 45 10             	mov    0x10(%ebp),%eax
    1367:	8b 55 08             	mov    0x8(%ebp),%edx
    136a:	56                   	push   %esi
    136b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    136e:	85 c0                	test   %eax,%eax
    1370:	7e 13                	jle    1385 <memmove+0x25>
    1372:	01 d0                	add    %edx,%eax
  dst = vdst;
    1374:	89 d7                	mov    %edx,%edi
    1376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    137d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1381:	39 f8                	cmp    %edi,%eax
    1383:	75 fb                	jne    1380 <memmove+0x20>
  return vdst;
}
    1385:	5e                   	pop    %esi
    1386:	89 d0                	mov    %edx,%eax
    1388:	5f                   	pop    %edi
    1389:	5d                   	pop    %ebp
    138a:	c3                   	ret    

0000138b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    138b:	b8 01 00 00 00       	mov    $0x1,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <exit>:
SYSCALL(exit)
    1393:	b8 02 00 00 00       	mov    $0x2,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <wait>:
SYSCALL(wait)
    139b:	b8 03 00 00 00       	mov    $0x3,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <pipe>:
SYSCALL(pipe)
    13a3:	b8 04 00 00 00       	mov    $0x4,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <read>:
SYSCALL(read)
    13ab:	b8 05 00 00 00       	mov    $0x5,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <write>:
SYSCALL(write)
    13b3:	b8 10 00 00 00       	mov    $0x10,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <close>:
SYSCALL(close)
    13bb:	b8 15 00 00 00       	mov    $0x15,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <kill>:
SYSCALL(kill)
    13c3:	b8 06 00 00 00       	mov    $0x6,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <exec>:
SYSCALL(exec)
    13cb:	b8 07 00 00 00       	mov    $0x7,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <open>:
SYSCALL(open)
    13d3:	b8 0f 00 00 00       	mov    $0xf,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <mknod>:
SYSCALL(mknod)
    13db:	b8 11 00 00 00       	mov    $0x11,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <unlink>:
SYSCALL(unlink)
    13e3:	b8 12 00 00 00       	mov    $0x12,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <fstat>:
SYSCALL(fstat)
    13eb:	b8 08 00 00 00       	mov    $0x8,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <link>:
SYSCALL(link)
    13f3:	b8 13 00 00 00       	mov    $0x13,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <mkdir>:
SYSCALL(mkdir)
    13fb:	b8 14 00 00 00       	mov    $0x14,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <chdir>:
SYSCALL(chdir)
    1403:	b8 09 00 00 00       	mov    $0x9,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <dup>:
SYSCALL(dup)
    140b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <getpid>:
SYSCALL(getpid)
    1413:	b8 0b 00 00 00       	mov    $0xb,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <sbrk>:
SYSCALL(sbrk)
    141b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    

00001423 <sleep>:
SYSCALL(sleep)
    1423:	b8 0d 00 00 00       	mov    $0xd,%eax
    1428:	cd 40                	int    $0x40
    142a:	c3                   	ret    

0000142b <uptime>:
SYSCALL(uptime)
    142b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1430:	cd 40                	int    $0x40
    1432:	c3                   	ret    

00001433 <getpinfo>:

SYSCALL(getpinfo)
    1433:	b8 16 00 00 00       	mov    $0x16,%eax
    1438:	cd 40                	int    $0x40
    143a:	c3                   	ret    

0000143b <settickets>:
SYSCALL(settickets)
    143b:	b8 17 00 00 00       	mov    $0x17,%eax
    1440:	cd 40                	int    $0x40
    1442:	c3                   	ret    
    1443:	66 90                	xchg   %ax,%ax
    1445:	66 90                	xchg   %ax,%ax
    1447:	66 90                	xchg   %ax,%ax
    1449:	66 90                	xchg   %ax,%ax
    144b:	66 90                	xchg   %ax,%ax
    144d:	66 90                	xchg   %ax,%ax
    144f:	90                   	nop

00001450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	57                   	push   %edi
    1454:	56                   	push   %esi
    1455:	53                   	push   %ebx
    1456:	83 ec 3c             	sub    $0x3c,%esp
    1459:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    145c:	89 d1                	mov    %edx,%ecx
{
    145e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1461:	85 d2                	test   %edx,%edx
    1463:	0f 89 7f 00 00 00    	jns    14e8 <printint+0x98>
    1469:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    146d:	74 79                	je     14e8 <printint+0x98>
    neg = 1;
    146f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1476:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1478:	31 db                	xor    %ebx,%ebx
    147a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    147d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1480:	89 c8                	mov    %ecx,%eax
    1482:	31 d2                	xor    %edx,%edx
    1484:	89 cf                	mov    %ecx,%edi
    1486:	f7 75 c4             	divl   -0x3c(%ebp)
    1489:	0f b6 92 ac 18 00 00 	movzbl 0x18ac(%edx),%edx
    1490:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1493:	89 d8                	mov    %ebx,%eax
    1495:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1498:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    149b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    149e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    14a1:	76 dd                	jbe    1480 <printint+0x30>
  if(neg)
    14a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    14a6:	85 c9                	test   %ecx,%ecx
    14a8:	74 0c                	je     14b6 <printint+0x66>
    buf[i++] = '-';
    14aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    14af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    14b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    14b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    14b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14bd:	eb 07                	jmp    14c6 <printint+0x76>
    14bf:	90                   	nop
    putc(fd, buf[i]);
    14c0:	0f b6 13             	movzbl (%ebx),%edx
    14c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    14c6:	83 ec 04             	sub    $0x4,%esp
    14c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14cc:	6a 01                	push   $0x1
    14ce:	56                   	push   %esi
    14cf:	57                   	push   %edi
    14d0:	e8 de fe ff ff       	call   13b3 <write>
  while(--i >= 0)
    14d5:	83 c4 10             	add    $0x10,%esp
    14d8:	39 de                	cmp    %ebx,%esi
    14da:	75 e4                	jne    14c0 <printint+0x70>
}
    14dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14df:	5b                   	pop    %ebx
    14e0:	5e                   	pop    %esi
    14e1:	5f                   	pop    %edi
    14e2:	5d                   	pop    %ebp
    14e3:	c3                   	ret    
    14e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14ef:	eb 87                	jmp    1478 <printint+0x28>
    14f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop

00001500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	57                   	push   %edi
    1504:	56                   	push   %esi
    1505:	53                   	push   %ebx
    1506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1509:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    150c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    150f:	0f b6 13             	movzbl (%ebx),%edx
    1512:	84 d2                	test   %dl,%dl
    1514:	74 6a                	je     1580 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1516:	8d 45 10             	lea    0x10(%ebp),%eax
    1519:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    151c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    151f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1521:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1524:	eb 36                	jmp    155c <printf+0x5c>
    1526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152d:	8d 76 00             	lea    0x0(%esi),%esi
    1530:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1533:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1538:	83 f8 25             	cmp    $0x25,%eax
    153b:	74 15                	je     1552 <printf+0x52>
  write(fd, &c, 1);
    153d:	83 ec 04             	sub    $0x4,%esp
    1540:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1543:	6a 01                	push   $0x1
    1545:	57                   	push   %edi
    1546:	56                   	push   %esi
    1547:	e8 67 fe ff ff       	call   13b3 <write>
    154c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    154f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1552:	0f b6 13             	movzbl (%ebx),%edx
    1555:	83 c3 01             	add    $0x1,%ebx
    1558:	84 d2                	test   %dl,%dl
    155a:	74 24                	je     1580 <printf+0x80>
    c = fmt[i] & 0xff;
    155c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    155f:	85 c9                	test   %ecx,%ecx
    1561:	74 cd                	je     1530 <printf+0x30>
      }
    } else if(state == '%'){
    1563:	83 f9 25             	cmp    $0x25,%ecx
    1566:	75 ea                	jne    1552 <printf+0x52>
      if(c == 'd'){
    1568:	83 f8 25             	cmp    $0x25,%eax
    156b:	0f 84 07 01 00 00    	je     1678 <printf+0x178>
    1571:	83 e8 63             	sub    $0x63,%eax
    1574:	83 f8 15             	cmp    $0x15,%eax
    1577:	77 17                	ja     1590 <printf+0x90>
    1579:	ff 24 85 54 18 00 00 	jmp    *0x1854(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1580:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1583:	5b                   	pop    %ebx
    1584:	5e                   	pop    %esi
    1585:	5f                   	pop    %edi
    1586:	5d                   	pop    %ebp
    1587:	c3                   	ret    
    1588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158f:	90                   	nop
  write(fd, &c, 1);
    1590:	83 ec 04             	sub    $0x4,%esp
    1593:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1596:	6a 01                	push   $0x1
    1598:	57                   	push   %edi
    1599:	56                   	push   %esi
    159a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    159e:	e8 10 fe ff ff       	call   13b3 <write>
        putc(fd, c);
    15a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    15a7:	83 c4 0c             	add    $0xc,%esp
    15aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15ad:	6a 01                	push   $0x1
    15af:	57                   	push   %edi
    15b0:	56                   	push   %esi
    15b1:	e8 fd fd ff ff       	call   13b3 <write>
        putc(fd, c);
    15b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15b9:	31 c9                	xor    %ecx,%ecx
    15bb:	eb 95                	jmp    1552 <printf+0x52>
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15c0:	83 ec 0c             	sub    $0xc,%esp
    15c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15c8:	6a 00                	push   $0x0
    15ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15cd:	8b 10                	mov    (%eax),%edx
    15cf:	89 f0                	mov    %esi,%eax
    15d1:	e8 7a fe ff ff       	call   1450 <printint>
        ap++;
    15d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15da:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15dd:	31 c9                	xor    %ecx,%ecx
    15df:	e9 6e ff ff ff       	jmp    1552 <printf+0x52>
    15e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15eb:	8b 10                	mov    (%eax),%edx
        ap++;
    15ed:	83 c0 04             	add    $0x4,%eax
    15f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15f3:	85 d2                	test   %edx,%edx
    15f5:	0f 84 8d 00 00 00    	je     1688 <printf+0x188>
        while(*s != 0){
    15fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1600:	84 c0                	test   %al,%al
    1602:	0f 84 4a ff ff ff    	je     1552 <printf+0x52>
    1608:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    160b:	89 d3                	mov    %edx,%ebx
    160d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1610:	83 ec 04             	sub    $0x4,%esp
          s++;
    1613:	83 c3 01             	add    $0x1,%ebx
    1616:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1619:	6a 01                	push   $0x1
    161b:	57                   	push   %edi
    161c:	56                   	push   %esi
    161d:	e8 91 fd ff ff       	call   13b3 <write>
        while(*s != 0){
    1622:	0f b6 03             	movzbl (%ebx),%eax
    1625:	83 c4 10             	add    $0x10,%esp
    1628:	84 c0                	test   %al,%al
    162a:	75 e4                	jne    1610 <printf+0x110>
      state = 0;
    162c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    162f:	31 c9                	xor    %ecx,%ecx
    1631:	e9 1c ff ff ff       	jmp    1552 <printf+0x52>
    1636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1640:	83 ec 0c             	sub    $0xc,%esp
    1643:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1648:	6a 01                	push   $0x1
    164a:	e9 7b ff ff ff       	jmp    15ca <printf+0xca>
    164f:	90                   	nop
        putc(fd, *ap);
    1650:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1653:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1656:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1658:	6a 01                	push   $0x1
    165a:	57                   	push   %edi
    165b:	56                   	push   %esi
        putc(fd, *ap);
    165c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    165f:	e8 4f fd ff ff       	call   13b3 <write>
        ap++;
    1664:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1668:	83 c4 10             	add    $0x10,%esp
      state = 0;
    166b:	31 c9                	xor    %ecx,%ecx
    166d:	e9 e0 fe ff ff       	jmp    1552 <printf+0x52>
    1672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1678:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    167b:	83 ec 04             	sub    $0x4,%esp
    167e:	e9 2a ff ff ff       	jmp    15ad <printf+0xad>
    1683:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1687:	90                   	nop
          s = "(null)";
    1688:	ba 4b 18 00 00       	mov    $0x184b,%edx
        while(*s != 0){
    168d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1690:	b8 28 00 00 00       	mov    $0x28,%eax
    1695:	89 d3                	mov    %edx,%ebx
    1697:	e9 74 ff ff ff       	jmp    1610 <printf+0x110>
    169c:	66 90                	xchg   %ax,%ax
    169e:	66 90                	xchg   %ax,%ax

000016a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a1:	a1 64 1b 00 00       	mov    0x1b64,%eax
{
    16a6:	89 e5                	mov    %esp,%ebp
    16a8:	57                   	push   %edi
    16a9:	56                   	push   %esi
    16aa:	53                   	push   %ebx
    16ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16b8:	89 c2                	mov    %eax,%edx
    16ba:	8b 00                	mov    (%eax),%eax
    16bc:	39 ca                	cmp    %ecx,%edx
    16be:	73 30                	jae    16f0 <free+0x50>
    16c0:	39 c1                	cmp    %eax,%ecx
    16c2:	72 04                	jb     16c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16c4:	39 c2                	cmp    %eax,%edx
    16c6:	72 f0                	jb     16b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ce:	39 f8                	cmp    %edi,%eax
    16d0:	74 30                	je     1702 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    16d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16d5:	8b 42 04             	mov    0x4(%edx),%eax
    16d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16db:	39 f1                	cmp    %esi,%ecx
    16dd:	74 3a                	je     1719 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    16df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16e1:	5b                   	pop    %ebx
  freep = p;
    16e2:	89 15 64 1b 00 00    	mov    %edx,0x1b64
}
    16e8:	5e                   	pop    %esi
    16e9:	5f                   	pop    %edi
    16ea:	5d                   	pop    %ebp
    16eb:	c3                   	ret    
    16ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16f0:	39 c2                	cmp    %eax,%edx
    16f2:	72 c4                	jb     16b8 <free+0x18>
    16f4:	39 c1                	cmp    %eax,%ecx
    16f6:	73 c0                	jae    16b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16fe:	39 f8                	cmp    %edi,%eax
    1700:	75 d0                	jne    16d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1702:	03 70 04             	add    0x4(%eax),%esi
    1705:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1708:	8b 02                	mov    (%edx),%eax
    170a:	8b 00                	mov    (%eax),%eax
    170c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    170f:	8b 42 04             	mov    0x4(%edx),%eax
    1712:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1715:	39 f1                	cmp    %esi,%ecx
    1717:	75 c6                	jne    16df <free+0x3f>
    p->s.size += bp->s.size;
    1719:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    171c:	89 15 64 1b 00 00    	mov    %edx,0x1b64
    p->s.size += bp->s.size;
    1722:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1725:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1728:	89 0a                	mov    %ecx,(%edx)
}
    172a:	5b                   	pop    %ebx
    172b:	5e                   	pop    %esi
    172c:	5f                   	pop    %edi
    172d:	5d                   	pop    %ebp
    172e:	c3                   	ret    
    172f:	90                   	nop

00001730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1730:	55                   	push   %ebp
    1731:	89 e5                	mov    %esp,%ebp
    1733:	57                   	push   %edi
    1734:	56                   	push   %esi
    1735:	53                   	push   %ebx
    1736:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    173c:	8b 3d 64 1b 00 00    	mov    0x1b64,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1742:	8d 70 07             	lea    0x7(%eax),%esi
    1745:	c1 ee 03             	shr    $0x3,%esi
    1748:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    174b:	85 ff                	test   %edi,%edi
    174d:	0f 84 9d 00 00 00    	je     17f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1753:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1755:	8b 4a 04             	mov    0x4(%edx),%ecx
    1758:	39 f1                	cmp    %esi,%ecx
    175a:	73 6a                	jae    17c6 <malloc+0x96>
    175c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1761:	39 de                	cmp    %ebx,%esi
    1763:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1766:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    176d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1770:	eb 17                	jmp    1789 <malloc+0x59>
    1772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1778:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    177a:	8b 48 04             	mov    0x4(%eax),%ecx
    177d:	39 f1                	cmp    %esi,%ecx
    177f:	73 4f                	jae    17d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1781:	8b 3d 64 1b 00 00    	mov    0x1b64,%edi
    1787:	89 c2                	mov    %eax,%edx
    1789:	39 d7                	cmp    %edx,%edi
    178b:	75 eb                	jne    1778 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    178d:	83 ec 0c             	sub    $0xc,%esp
    1790:	ff 75 e4             	push   -0x1c(%ebp)
    1793:	e8 83 fc ff ff       	call   141b <sbrk>
  if(p == (char*)-1)
    1798:	83 c4 10             	add    $0x10,%esp
    179b:	83 f8 ff             	cmp    $0xffffffff,%eax
    179e:	74 1c                	je     17bc <malloc+0x8c>
  hp->s.size = nu;
    17a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17a3:	83 ec 0c             	sub    $0xc,%esp
    17a6:	83 c0 08             	add    $0x8,%eax
    17a9:	50                   	push   %eax
    17aa:	e8 f1 fe ff ff       	call   16a0 <free>
  return freep;
    17af:	8b 15 64 1b 00 00    	mov    0x1b64,%edx
      if((p = morecore(nunits)) == 0)
    17b5:	83 c4 10             	add    $0x10,%esp
    17b8:	85 d2                	test   %edx,%edx
    17ba:	75 bc                	jne    1778 <malloc+0x48>
        return 0;
  }
}
    17bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17bf:	31 c0                	xor    %eax,%eax
}
    17c1:	5b                   	pop    %ebx
    17c2:	5e                   	pop    %esi
    17c3:	5f                   	pop    %edi
    17c4:	5d                   	pop    %ebp
    17c5:	c3                   	ret    
    if(p->s.size >= nunits){
    17c6:	89 d0                	mov    %edx,%eax
    17c8:	89 fa                	mov    %edi,%edx
    17ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17d0:	39 ce                	cmp    %ecx,%esi
    17d2:	74 4c                	je     1820 <malloc+0xf0>
        p->s.size -= nunits;
    17d4:	29 f1                	sub    %esi,%ecx
    17d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17df:	89 15 64 1b 00 00    	mov    %edx,0x1b64
}
    17e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17e8:	83 c0 08             	add    $0x8,%eax
}
    17eb:	5b                   	pop    %ebx
    17ec:	5e                   	pop    %esi
    17ed:	5f                   	pop    %edi
    17ee:	5d                   	pop    %ebp
    17ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17f0:	c7 05 64 1b 00 00 68 	movl   $0x1b68,0x1b64
    17f7:	1b 00 00 
    base.s.size = 0;
    17fa:	bf 68 1b 00 00       	mov    $0x1b68,%edi
    base.s.ptr = freep = prevp = &base;
    17ff:	c7 05 68 1b 00 00 68 	movl   $0x1b68,0x1b68
    1806:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1809:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    180b:	c7 05 6c 1b 00 00 00 	movl   $0x0,0x1b6c
    1812:	00 00 00 
    if(p->s.size >= nunits){
    1815:	e9 42 ff ff ff       	jmp    175c <malloc+0x2c>
    181a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1820:	8b 08                	mov    (%eax),%ecx
    1822:	89 0a                	mov    %ecx,(%edx)
    1824:	eb b9                	jmp    17df <malloc+0xaf>
