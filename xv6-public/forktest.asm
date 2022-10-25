
_forktest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
    1006:	e8 35 00 00 00       	call   1040 <forktest>
  exit();
    100b:	e8 63 03 00 00       	call   1373 <exit>

00001010 <printf>:
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	53                   	push   %ebx
    1014:	83 ec 10             	sub    $0x10,%esp
    1017:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
    101a:	53                   	push   %ebx
    101b:	e8 90 01 00 00       	call   11b0 <strlen>
    1020:	83 c4 0c             	add    $0xc,%esp
    1023:	50                   	push   %eax
    1024:	53                   	push   %ebx
    1025:	ff 75 08             	push   0x8(%ebp)
    1028:	e8 66 03 00 00       	call   1393 <write>
}
    102d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1030:	83 c4 10             	add    $0x10,%esp
    1033:	c9                   	leave  
    1034:	c3                   	ret    
    1035:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001040 <forktest>:
{
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	53                   	push   %ebx
  for(n=0; n<N; n++){
    1044:	31 db                	xor    %ebx,%ebx
{
    1046:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
    1049:	68 24 14 00 00       	push   $0x1424
    104e:	e8 5d 01 00 00       	call   11b0 <strlen>
    1053:	83 c4 0c             	add    $0xc,%esp
    1056:	50                   	push   %eax
    1057:	68 24 14 00 00       	push   $0x1424
    105c:	6a 01                	push   $0x1
    105e:	e8 30 03 00 00       	call   1393 <write>
    1063:	83 c4 10             	add    $0x10,%esp
    1066:	eb 19                	jmp    1081 <forktest+0x41>
    1068:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106f:	90                   	nop
    if(pid == 0)
    1070:	74 58                	je     10ca <forktest+0x8a>
  for(n=0; n<N; n++){
    1072:	83 c3 01             	add    $0x1,%ebx
    1075:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    107b:	0f 84 83 00 00 00    	je     1104 <forktest+0xc4>
    pid = fork();
    1081:	e8 e5 02 00 00       	call   136b <fork>
    if(pid < 0)
    1086:	85 c0                	test   %eax,%eax
    1088:	79 e6                	jns    1070 <forktest+0x30>
  for(; n > 0; n--){
    108a:	85 db                	test   %ebx,%ebx
    108c:	74 10                	je     109e <forktest+0x5e>
    108e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
    1090:	e8 e6 02 00 00       	call   137b <wait>
    1095:	85 c0                	test   %eax,%eax
    1097:	78 36                	js     10cf <forktest+0x8f>
  for(; n > 0; n--){
    1099:	83 eb 01             	sub    $0x1,%ebx
    109c:	75 f2                	jne    1090 <forktest+0x50>
  if(wait() != -1){
    109e:	e8 d8 02 00 00       	call   137b <wait>
    10a3:	83 f8 ff             	cmp    $0xffffffff,%eax
    10a6:	75 49                	jne    10f1 <forktest+0xb1>
  write(fd, s, strlen(s));
    10a8:	83 ec 0c             	sub    $0xc,%esp
    10ab:	68 56 14 00 00       	push   $0x1456
    10b0:	e8 fb 00 00 00       	call   11b0 <strlen>
    10b5:	83 c4 0c             	add    $0xc,%esp
    10b8:	50                   	push   %eax
    10b9:	68 56 14 00 00       	push   $0x1456
    10be:	6a 01                	push   $0x1
    10c0:	e8 ce 02 00 00       	call   1393 <write>
}
    10c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10c8:	c9                   	leave  
    10c9:	c3                   	ret    
      exit();
    10ca:	e8 a4 02 00 00       	call   1373 <exit>
  write(fd, s, strlen(s));
    10cf:	83 ec 0c             	sub    $0xc,%esp
    10d2:	68 2f 14 00 00       	push   $0x142f
    10d7:	e8 d4 00 00 00       	call   11b0 <strlen>
    10dc:	83 c4 0c             	add    $0xc,%esp
    10df:	50                   	push   %eax
    10e0:	68 2f 14 00 00       	push   $0x142f
    10e5:	6a 01                	push   $0x1
    10e7:	e8 a7 02 00 00       	call   1393 <write>
      exit();
    10ec:	e8 82 02 00 00       	call   1373 <exit>
    printf(1, "wait got too many\n");
    10f1:	52                   	push   %edx
    10f2:	52                   	push   %edx
    10f3:	68 43 14 00 00       	push   $0x1443
    10f8:	6a 01                	push   $0x1
    10fa:	e8 11 ff ff ff       	call   1010 <printf>
    exit();
    10ff:	e8 6f 02 00 00       	call   1373 <exit>
    printf(1, "fork claimed to work N times!\n", N);
    1104:	50                   	push   %eax
    1105:	68 e8 03 00 00       	push   $0x3e8
    110a:	68 64 14 00 00       	push   $0x1464
    110f:	6a 01                	push   $0x1
    1111:	e8 fa fe ff ff       	call   1010 <printf>
    exit();
    1116:	e8 58 02 00 00       	call   1373 <exit>
    111b:	66 90                	xchg   %ax,%ax
    111d:	66 90                	xchg   %ax,%ax
    111f:	90                   	nop

00001120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1121:	31 c0                	xor    %eax,%eax
{
    1123:	89 e5                	mov    %esp,%ebp
    1125:	53                   	push   %ebx
    1126:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1137:	83 c0 01             	add    $0x1,%eax
    113a:	84 d2                	test   %dl,%dl
    113c:	75 f2                	jne    1130 <strcpy+0x10>
    ;
  return os;
}
    113e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1141:	89 c8                	mov    %ecx,%eax
    1143:	c9                   	leave  
    1144:	c3                   	ret    
    1145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	8b 55 08             	mov    0x8(%ebp),%edx
    1157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    115a:	0f b6 02             	movzbl (%edx),%eax
    115d:	84 c0                	test   %al,%al
    115f:	75 17                	jne    1178 <strcmp+0x28>
    1161:	eb 3a                	jmp    119d <strcmp+0x4d>
    1163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1167:	90                   	nop
    1168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    116c:	83 c2 01             	add    $0x1,%edx
    116f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1172:	84 c0                	test   %al,%al
    1174:	74 1a                	je     1190 <strcmp+0x40>
    p++, q++;
    1176:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1178:	0f b6 19             	movzbl (%ecx),%ebx
    117b:	38 c3                	cmp    %al,%bl
    117d:	74 e9                	je     1168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    117f:	29 d8                	sub    %ebx,%eax
}
    1181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1184:	c9                   	leave  
    1185:	c3                   	ret    
    1186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    118d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1194:	31 c0                	xor    %eax,%eax
    1196:	29 d8                	sub    %ebx,%eax
}
    1198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    119b:	c9                   	leave  
    119c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    119d:	0f b6 19             	movzbl (%ecx),%ebx
    11a0:	31 c0                	xor    %eax,%eax
    11a2:	eb db                	jmp    117f <strcmp+0x2f>
    11a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11af:	90                   	nop

000011b0 <strlen>:

uint
strlen(const char *s)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11b6:	80 3a 00             	cmpb   $0x0,(%edx)
    11b9:	74 15                	je     11d0 <strlen+0x20>
    11bb:	31 c0                	xor    %eax,%eax
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
    11c0:	83 c0 01             	add    $0x1,%eax
    11c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11c7:	89 c1                	mov    %eax,%ecx
    11c9:	75 f5                	jne    11c0 <strlen+0x10>
    ;
  return n;
}
    11cb:	89 c8                	mov    %ecx,%eax
    11cd:	5d                   	pop    %ebp
    11ce:	c3                   	ret    
    11cf:	90                   	nop
  for(n = 0; s[n]; n++)
    11d0:	31 c9                	xor    %ecx,%ecx
}
    11d2:	5d                   	pop    %ebp
    11d3:	89 c8                	mov    %ecx,%eax
    11d5:	c3                   	ret    
    11d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11dd:	8d 76 00             	lea    0x0(%esi),%esi

000011e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ed:	89 d7                	mov    %edx,%edi
    11ef:	fc                   	cld    
    11f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11f5:	89 d0                	mov    %edx,%eax
    11f7:	c9                   	leave  
    11f8:	c3                   	ret    
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001200 <strchr>:

char*
strchr(const char *s, char c)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	8b 45 08             	mov    0x8(%ebp),%eax
    1206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    120a:	0f b6 10             	movzbl (%eax),%edx
    120d:	84 d2                	test   %dl,%dl
    120f:	75 12                	jne    1223 <strchr+0x23>
    1211:	eb 1d                	jmp    1230 <strchr+0x30>
    1213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1217:	90                   	nop
    1218:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    121c:	83 c0 01             	add    $0x1,%eax
    121f:	84 d2                	test   %dl,%dl
    1221:	74 0d                	je     1230 <strchr+0x30>
    if(*s == c)
    1223:	38 d1                	cmp    %dl,%cl
    1225:	75 f1                	jne    1218 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1227:	5d                   	pop    %ebp
    1228:	c3                   	ret    
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1230:	31 c0                	xor    %eax,%eax
}
    1232:	5d                   	pop    %ebp
    1233:	c3                   	ret    
    1234:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    123f:	90                   	nop

00001240 <gets>:

char*
gets(char *buf, int max)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1245:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1248:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1249:	31 db                	xor    %ebx,%ebx
{
    124b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    124e:	eb 27                	jmp    1277 <gets+0x37>
    cc = read(0, &c, 1);
    1250:	83 ec 04             	sub    $0x4,%esp
    1253:	6a 01                	push   $0x1
    1255:	57                   	push   %edi
    1256:	6a 00                	push   $0x0
    1258:	e8 2e 01 00 00       	call   138b <read>
    if(cc < 1)
    125d:	83 c4 10             	add    $0x10,%esp
    1260:	85 c0                	test   %eax,%eax
    1262:	7e 1d                	jle    1281 <gets+0x41>
      break;
    buf[i++] = c;
    1264:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1268:	8b 55 08             	mov    0x8(%ebp),%edx
    126b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    126f:	3c 0a                	cmp    $0xa,%al
    1271:	74 1d                	je     1290 <gets+0x50>
    1273:	3c 0d                	cmp    $0xd,%al
    1275:	74 19                	je     1290 <gets+0x50>
  for(i=0; i+1 < max; ){
    1277:	89 de                	mov    %ebx,%esi
    1279:	83 c3 01             	add    $0x1,%ebx
    127c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    127f:	7c cf                	jl     1250 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1281:	8b 45 08             	mov    0x8(%ebp),%eax
    1284:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1288:	8d 65 f4             	lea    -0xc(%ebp),%esp
    128b:	5b                   	pop    %ebx
    128c:	5e                   	pop    %esi
    128d:	5f                   	pop    %edi
    128e:	5d                   	pop    %ebp
    128f:	c3                   	ret    
  buf[i] = '\0';
    1290:	8b 45 08             	mov    0x8(%ebp),%eax
    1293:	89 de                	mov    %ebx,%esi
    1295:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1299:	8d 65 f4             	lea    -0xc(%ebp),%esp
    129c:	5b                   	pop    %ebx
    129d:	5e                   	pop    %esi
    129e:	5f                   	pop    %edi
    129f:	5d                   	pop    %ebp
    12a0:	c3                   	ret    
    12a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12af:	90                   	nop

000012b0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	56                   	push   %esi
    12b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12b5:	83 ec 08             	sub    $0x8,%esp
    12b8:	6a 00                	push   $0x0
    12ba:	ff 75 08             	push   0x8(%ebp)
    12bd:	e8 f1 00 00 00       	call   13b3 <open>
  if(fd < 0)
    12c2:	83 c4 10             	add    $0x10,%esp
    12c5:	85 c0                	test   %eax,%eax
    12c7:	78 27                	js     12f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12c9:	83 ec 08             	sub    $0x8,%esp
    12cc:	ff 75 0c             	push   0xc(%ebp)
    12cf:	89 c3                	mov    %eax,%ebx
    12d1:	50                   	push   %eax
    12d2:	e8 f4 00 00 00       	call   13cb <fstat>
  close(fd);
    12d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12da:	89 c6                	mov    %eax,%esi
  close(fd);
    12dc:	e8 ba 00 00 00       	call   139b <close>
  return r;
    12e1:	83 c4 10             	add    $0x10,%esp
}
    12e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12e7:	89 f0                	mov    %esi,%eax
    12e9:	5b                   	pop    %ebx
    12ea:	5e                   	pop    %esi
    12eb:	5d                   	pop    %ebp
    12ec:	c3                   	ret    
    12ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12f5:	eb ed                	jmp    12e4 <stat+0x34>
    12f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fe:	66 90                	xchg   %ax,%ax

00001300 <atoi>:

int
atoi(const char *s)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	53                   	push   %ebx
    1304:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1307:	0f be 02             	movsbl (%edx),%eax
    130a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    130d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1310:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1315:	77 1e                	ja     1335 <atoi+0x35>
    1317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    131e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1320:	83 c2 01             	add    $0x1,%edx
    1323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    132a:	0f be 02             	movsbl (%edx),%eax
    132d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1330:	80 fb 09             	cmp    $0x9,%bl
    1333:	76 eb                	jbe    1320 <atoi+0x20>
  return n;
}
    1335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1338:	89 c8                	mov    %ecx,%eax
    133a:	c9                   	leave  
    133b:	c3                   	ret    
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	8b 45 10             	mov    0x10(%ebp),%eax
    1347:	8b 55 08             	mov    0x8(%ebp),%edx
    134a:	56                   	push   %esi
    134b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    134e:	85 c0                	test   %eax,%eax
    1350:	7e 13                	jle    1365 <memmove+0x25>
    1352:	01 d0                	add    %edx,%eax
  dst = vdst;
    1354:	89 d7                	mov    %edx,%edi
    1356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    135d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1361:	39 f8                	cmp    %edi,%eax
    1363:	75 fb                	jne    1360 <memmove+0x20>
  return vdst;
}
    1365:	5e                   	pop    %esi
    1366:	89 d0                	mov    %edx,%eax
    1368:	5f                   	pop    %edi
    1369:	5d                   	pop    %ebp
    136a:	c3                   	ret    

0000136b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    136b:	b8 01 00 00 00       	mov    $0x1,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <exit>:
SYSCALL(exit)
    1373:	b8 02 00 00 00       	mov    $0x2,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <wait>:
SYSCALL(wait)
    137b:	b8 03 00 00 00       	mov    $0x3,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <pipe>:
SYSCALL(pipe)
    1383:	b8 04 00 00 00       	mov    $0x4,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <read>:
SYSCALL(read)
    138b:	b8 05 00 00 00       	mov    $0x5,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <write>:
SYSCALL(write)
    1393:	b8 10 00 00 00       	mov    $0x10,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <close>:
SYSCALL(close)
    139b:	b8 15 00 00 00       	mov    $0x15,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <kill>:
SYSCALL(kill)
    13a3:	b8 06 00 00 00       	mov    $0x6,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <exec>:
SYSCALL(exec)
    13ab:	b8 07 00 00 00       	mov    $0x7,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <open>:
SYSCALL(open)
    13b3:	b8 0f 00 00 00       	mov    $0xf,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <mknod>:
SYSCALL(mknod)
    13bb:	b8 11 00 00 00       	mov    $0x11,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <unlink>:
SYSCALL(unlink)
    13c3:	b8 12 00 00 00       	mov    $0x12,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <fstat>:
SYSCALL(fstat)
    13cb:	b8 08 00 00 00       	mov    $0x8,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <link>:
SYSCALL(link)
    13d3:	b8 13 00 00 00       	mov    $0x13,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <mkdir>:
SYSCALL(mkdir)
    13db:	b8 14 00 00 00       	mov    $0x14,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <chdir>:
SYSCALL(chdir)
    13e3:	b8 09 00 00 00       	mov    $0x9,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <dup>:
SYSCALL(dup)
    13eb:	b8 0a 00 00 00       	mov    $0xa,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <getpid>:
SYSCALL(getpid)
    13f3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <sbrk>:
SYSCALL(sbrk)
    13fb:	b8 0c 00 00 00       	mov    $0xc,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <sleep>:
SYSCALL(sleep)
    1403:	b8 0d 00 00 00       	mov    $0xd,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <uptime>:
SYSCALL(uptime)
    140b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <getpinfo>:

SYSCALL(getpinfo)
    1413:	b8 16 00 00 00       	mov    $0x16,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <settickets>:
SYSCALL(settickets)
    141b:	b8 17 00 00 00       	mov    $0x17,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    
