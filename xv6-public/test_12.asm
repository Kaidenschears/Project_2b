
_test_12:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	81 ec 18 08 00 00    	sub    $0x818,%esp
  int pid_low = getpid();
    1017:	e8 27 05 00 00       	call   1543 <getpid>
  int lowtickets = 0, hightickets = 1;

  if (settickets(lowtickets) != 0) {
    101c:	83 ec 0c             	sub    $0xc,%esp
    101f:	6a 00                	push   $0x0
  int pid_low = getpid();
    1021:	89 c3                	mov    %eax,%ebx
  if (settickets(lowtickets) != 0) {
    1023:	e8 43 05 00 00       	call   156b <settickets>
    1028:	83 c4 10             	add    $0x10,%esp
    102b:	85 c0                	test   %eax,%eax
    102d:	75 41                	jne    1070 <main+0x70>
    printf(1, "XV6_SCHEDULER\t FAILED\n"); 
    exit();
  }

  if (fork() == 0) {  	
    102f:	e8 87 04 00 00       	call   14bb <fork>
    1034:	85 c0                	test   %eax,%eax
    1036:	74 26                	je     105e <main+0x5e>
	
    compare(pid_low, pid_high, &st_before, &st_after);
         
    exit();
  }
  printf(1,"Spinning...%d\n", spin());
    1038:	e8 e3 00 00 00       	call   1120 <spin>
    103d:	52                   	push   %edx
    103e:	50                   	push   %eax
    103f:	68 0e 1a 00 00       	push   $0x1a0e
    1044:	6a 01                	push   $0x1
    1046:	e8 f5 05 00 00       	call   1640 <printf>

  while (wait() > -1);
    104b:	83 c4 10             	add    $0x10,%esp
    104e:	66 90                	xchg   %ax,%ax
    1050:	e8 76 04 00 00       	call   14cb <wait>
    1055:	85 c0                	test   %eax,%eax
    1057:	79 f7                	jns    1050 <main+0x50>
  exit();
    1059:	e8 65 04 00 00       	call   14c3 <exit>
    if (settickets(hightickets) != 0) {
    105e:	83 ec 0c             	sub    $0xc,%esp
    1061:	6a 01                	push   $0x1
    1063:	e8 03 05 00 00       	call   156b <settickets>
    1068:	83 c4 10             	add    $0x10,%esp
    106b:	85 c0                	test   %eax,%eax
    106d:	74 15                	je     1084 <main+0x84>
    106f:	90                   	nop
    printf(1, "XV6_SCHEDULER\t FAILED\n"); 
    1070:	83 ec 08             	sub    $0x8,%esp
    1073:	68 de 19 00 00       	push   $0x19de
    1078:	6a 01                	push   $0x1
    107a:	e8 c1 05 00 00       	call   1640 <printf>
    exit();
    107f:	e8 3f 04 00 00       	call   14c3 <exit>
    int pid_high = getpid();
    1084:	e8 ba 04 00 00       	call   1543 <getpid>
    if (getpinfo(&st_before) != 0) {
    1089:	8d b5 e8 f7 ff ff    	lea    -0x818(%ebp),%esi
    108f:	83 ec 0c             	sub    $0xc,%esp
    1092:	56                   	push   %esi
    int pid_high = getpid();
    1093:	89 85 e4 f7 ff ff    	mov    %eax,-0x81c(%ebp)
    if (getpinfo(&st_before) != 0) {
    1099:	e8 c5 04 00 00       	call   1563 <getpinfo>
    109e:	83 c4 10             	add    $0x10,%esp
    10a1:	85 c0                	test   %eax,%eax
    10a3:	75 cb                	jne    1070 <main+0x70>
    printf(1, "\n ****PInfo before**** \n");
    10a5:	57                   	push   %edi
    10a6:	57                   	push   %edi
    if (getpinfo(&st_after) != 0) {
    10a7:	8d bd e8 fb ff ff    	lea    -0x418(%ebp),%edi
    printf(1, "\n ****PInfo before**** \n");
    10ad:	68 f5 19 00 00       	push   $0x19f5
    10b2:	6a 01                	push   $0x1
    10b4:	e8 87 05 00 00       	call   1640 <printf>
    print(&st_before);
    10b9:	89 34 24             	mov    %esi,(%esp)
    10bc:	e8 6f 00 00 00       	call   1130 <print>
    printf(1,"Spinning...%d\n", spin());
    10c1:	e8 5a 00 00 00       	call   1120 <spin>
    10c6:	83 c4 0c             	add    $0xc,%esp
    10c9:	50                   	push   %eax
    10ca:	68 0e 1a 00 00       	push   $0x1a0e
    10cf:	6a 01                	push   $0x1
    10d1:	e8 6a 05 00 00       	call   1640 <printf>
    if (getpinfo(&st_after) != 0) {
    10d6:	89 3c 24             	mov    %edi,(%esp)
    10d9:	e8 85 04 00 00       	call   1563 <getpinfo>
    10de:	83 c4 10             	add    $0x10,%esp
    10e1:	85 c0                	test   %eax,%eax
    10e3:	75 8b                	jne    1070 <main+0x70>
    printf(1, "\n ****PInfo after**** \n");
    10e5:	51                   	push   %ecx
    10e6:	51                   	push   %ecx
    10e7:	68 1d 1a 00 00       	push   $0x1a1d
    10ec:	6a 01                	push   $0x1
    10ee:	e8 4d 05 00 00       	call   1640 <printf>
    print(&st_after);
    10f3:	89 3c 24             	mov    %edi,(%esp)
    10f6:	e8 35 00 00 00       	call   1130 <print>
    compare(pid_low, pid_high, &st_before, &st_after);
    10fb:	57                   	push   %edi
    10fc:	56                   	push   %esi
    10fd:	ff b5 e4 f7 ff ff    	push   -0x81c(%ebp)
    1103:	53                   	push   %ebx
    1104:	e8 77 00 00 00       	call   1180 <compare>
    exit();
    1109:	83 c4 20             	add    $0x20,%esp
    110c:	e8 b2 03 00 00       	call   14c3 <exit>
    1111:	66 90                	xchg   %ax,%ax
    1113:	66 90                	xchg   %ax,%ax
    1115:	66 90                	xchg   %ax,%ax
    1117:	66 90                	xchg   %ax,%ax
    1119:	66 90                	xchg   %ax,%ax
    111b:	66 90                	xchg   %ax,%ax
    111d:	66 90                	xchg   %ax,%ax
    111f:	90                   	nop

00001120 <spin>:
}
    1120:	b8 91 13 00 00       	mov    $0x1391,%eax
    1125:	c3                   	ret    
    1126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112d:	8d 76 00             	lea    0x0(%esi),%esi

00001130 <print>:
void print(struct pstat *st) {
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	56                   	push   %esi
    1134:	53                   	push   %ebx
    1135:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1138:	8d b3 00 01 00 00    	lea    0x100(%ebx),%esi
    113e:	eb 07                	jmp    1147 <print+0x17>
   for(i = 0; i < NPROC; i++) {
    1140:	83 c3 04             	add    $0x4,%ebx
    1143:	39 f3                	cmp    %esi,%ebx
    1145:	74 31                	je     1178 <print+0x48>
     if (st->inuse[i]) {
    1147:	8b 03                	mov    (%ebx),%eax
    1149:	85 c0                	test   %eax,%eax
    114b:	74 f3                	je     1140 <print+0x10>
       printf(1, "pid: %d tickets: %d ticks: %d\n", st->pid[i], st->tickets[i], st->ticks[i]);
    114d:	83 ec 0c             	sub    $0xc,%esp
    1150:	ff b3 00 03 00 00    	push   0x300(%ebx)
   for(i = 0; i < NPROC; i++) {
    1156:	83 c3 04             	add    $0x4,%ebx
       printf(1, "pid: %d tickets: %d ticks: %d\n", st->pid[i], st->tickets[i], st->ticks[i]);
    1159:	ff b3 fc 00 00 00    	push   0xfc(%ebx)
    115f:	ff b3 fc 01 00 00    	push   0x1fc(%ebx)
    1165:	68 68 19 00 00       	push   $0x1968
    116a:	6a 01                	push   $0x1
    116c:	e8 cf 04 00 00       	call   1640 <printf>
    1171:	83 c4 20             	add    $0x20,%esp
   for(i = 0; i < NPROC; i++) {
    1174:	39 f3                	cmp    %esi,%ebx
    1176:	75 cf                	jne    1147 <print+0x17>
}
    1178:	8d 65 f8             	lea    -0x8(%ebp),%esp
    117b:	5b                   	pop    %ebx
    117c:	5e                   	pop    %esi
    117d:	5d                   	pop    %ebp
    117e:	c3                   	ret    
    117f:	90                   	nop

00001180 <compare>:
void compare(int pid_low, int pid_high, struct pstat *before, struct pstat *after) {
    1180:	55                   	push   %ebp
  for(i = 0; i < NPROC; i++) {
    1181:	31 c0                	xor    %eax,%eax
void compare(int pid_low, int pid_high, struct pstat *before, struct pstat *after) {
    1183:	89 e5                	mov    %esp,%ebp
    1185:	57                   	push   %edi
    1186:	56                   	push   %esi
    1187:	53                   	push   %ebx
    1188:	83 ec 2c             	sub    $0x2c,%esp
    118b:	8b 75 14             	mov    0x14(%ebp),%esi
    118e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i, ticks_low_before=-1, ticks_low_after=-1, ticks_high_before=-1, ticks_high_after=-1;
    1191:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
void compare(int pid_low, int pid_high, struct pstat *before, struct pstat *after) {
    1198:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    119b:	8b 7d 10             	mov    0x10(%ebp),%edi
  int i, ticks_low_before=-1, ticks_low_after=-1, ticks_high_before=-1, ticks_high_after=-1;
    119e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
    11a5:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%ebp)
    11ac:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  for(i = 0; i < NPROC; i++) {
    11b3:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    11b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
    if (before->pid[i] == pid_low) 
    11c0:	8b 94 87 00 02 00 00 	mov    0x200(%edi,%eax,4),%edx
    11c7:	39 da                	cmp    %ebx,%edx
    11c9:	75 0a                	jne    11d5 <compare+0x55>
        ticks_low_before = before->ticks[i];
    11cb:	8b b4 87 00 03 00 00 	mov    0x300(%edi,%eax,4),%esi
    11d2:	89 75 e0             	mov    %esi,-0x20(%ebp)
    if (before->pid[i] == pid_high)
    11d5:	39 ca                	cmp    %ecx,%edx
    11d7:	75 0a                	jne    11e3 <compare+0x63>
        ticks_high_before = before->ticks[i];
    11d9:	8b b4 87 00 03 00 00 	mov    0x300(%edi,%eax,4),%esi
    11e0:	89 75 d8             	mov    %esi,-0x28(%ebp)
    if (after->pid[i] == pid_low)
    11e3:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    11e6:	8b 94 86 00 02 00 00 	mov    0x200(%esi,%eax,4),%edx
    11ed:	39 da                	cmp    %ebx,%edx
    11ef:	75 0a                	jne    11fb <compare+0x7b>
        ticks_low_after = after->ticks[i];
    11f1:	8b b4 86 00 03 00 00 	mov    0x300(%esi,%eax,4),%esi
    11f8:	89 75 dc             	mov    %esi,-0x24(%ebp)
    if (after->pid[i] == pid_high)
    11fb:	39 ca                	cmp    %ecx,%edx
    11fd:	75 0d                	jne    120c <compare+0x8c>
        ticks_high_after = after->ticks[i];
    11ff:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    1202:	8b b4 86 00 03 00 00 	mov    0x300(%esi,%eax,4),%esi
    1209:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  for(i = 0; i < NPROC; i++) {
    120c:	83 c0 01             	add    $0x1,%eax
    120f:	83 f8 40             	cmp    $0x40,%eax
    1212:	75 ac                	jne    11c0 <compare+0x40>
  printf(1, "high before: %d high after: %d, low before: %d low after: %d\n", 
    1214:	8b 5d dc             	mov    -0x24(%ebp),%ebx
    1217:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    121a:	83 ec 08             	sub    $0x8,%esp
    121d:	8b 75 d8             	mov    -0x28(%ebp),%esi
    1220:	53                   	push   %ebx
    1221:	ff 75 e0             	push   -0x20(%ebp)
    1224:	57                   	push   %edi
  if ( (ticks_high_after-ticks_high_before) > (ticks_low_after - ticks_low_before)) {
    1225:	29 f7                	sub    %esi,%edi
  printf(1, "high before: %d high after: %d, low before: %d low after: %d\n", 
    1227:	56                   	push   %esi
    1228:	68 88 19 00 00       	push   $0x1988
    122d:	6a 01                	push   $0x1
    122f:	e8 0c 04 00 00       	call   1640 <printf>
  if ( (ticks_high_after-ticks_high_before) > (ticks_low_after - ticks_low_before)) {
    1234:	89 d8                	mov    %ebx,%eax
    1236:	2b 45 e0             	sub    -0x20(%ebp),%eax
    1239:	83 c4 20             	add    $0x20,%esp
    123c:	39 c7                	cmp    %eax,%edi
    123e:	7e 1a                	jle    125a <compare+0xda>
    printf(1, "XV6_SCHEDULER\t SUCCESS\n"); 
    1240:	c7 45 0c c6 19 00 00 	movl   $0x19c6,0xc(%ebp)
    1247:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
    124e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1251:	5b                   	pop    %ebx
    1252:	5e                   	pop    %esi
    1253:	5f                   	pop    %edi
    1254:	5d                   	pop    %ebp
    printf(1, "XV6_SCHEDULER\t SUCCESS\n"); 
    1255:	e9 e6 03 00 00       	jmp    1640 <printf>
    printf(1, "XV6_SCHEDULER\t FAILED\n"); 
    125a:	50                   	push   %eax
    125b:	50                   	push   %eax
    125c:	68 de 19 00 00       	push   $0x19de
    1261:	6a 01                	push   $0x1
    1263:	e8 d8 03 00 00       	call   1640 <printf>
    exit();
    1268:	e8 56 02 00 00       	call   14c3 <exit>
    126d:	66 90                	xchg   %ax,%ax
    126f:	90                   	nop

00001270 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1270:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1271:	31 c0                	xor    %eax,%eax
{
    1273:	89 e5                	mov    %esp,%ebp
    1275:	53                   	push   %ebx
    1276:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1279:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1280:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1284:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1287:	83 c0 01             	add    $0x1,%eax
    128a:	84 d2                	test   %dl,%dl
    128c:	75 f2                	jne    1280 <strcpy+0x10>
    ;
  return os;
}
    128e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1291:	89 c8                	mov    %ecx,%eax
    1293:	c9                   	leave  
    1294:	c3                   	ret    
    1295:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	53                   	push   %ebx
    12a4:	8b 55 08             	mov    0x8(%ebp),%edx
    12a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    12aa:	0f b6 02             	movzbl (%edx),%eax
    12ad:	84 c0                	test   %al,%al
    12af:	75 17                	jne    12c8 <strcmp+0x28>
    12b1:	eb 3a                	jmp    12ed <strcmp+0x4d>
    12b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12b7:	90                   	nop
    12b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    12bc:	83 c2 01             	add    $0x1,%edx
    12bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    12c2:	84 c0                	test   %al,%al
    12c4:	74 1a                	je     12e0 <strcmp+0x40>
    p++, q++;
    12c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    12c8:	0f b6 19             	movzbl (%ecx),%ebx
    12cb:	38 c3                	cmp    %al,%bl
    12cd:	74 e9                	je     12b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    12cf:	29 d8                	sub    %ebx,%eax
}
    12d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    12d4:	c9                   	leave  
    12d5:	c3                   	ret    
    12d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    12e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    12e4:	31 c0                	xor    %eax,%eax
    12e6:	29 d8                	sub    %ebx,%eax
}
    12e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    12eb:	c9                   	leave  
    12ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    12ed:	0f b6 19             	movzbl (%ecx),%ebx
    12f0:	31 c0                	xor    %eax,%eax
    12f2:	eb db                	jmp    12cf <strcmp+0x2f>
    12f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop

00001300 <strlen>:

uint
strlen(const char *s)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1306:	80 3a 00             	cmpb   $0x0,(%edx)
    1309:	74 15                	je     1320 <strlen+0x20>
    130b:	31 c0                	xor    %eax,%eax
    130d:	8d 76 00             	lea    0x0(%esi),%esi
    1310:	83 c0 01             	add    $0x1,%eax
    1313:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1317:	89 c1                	mov    %eax,%ecx
    1319:	75 f5                	jne    1310 <strlen+0x10>
    ;
  return n;
}
    131b:	89 c8                	mov    %ecx,%eax
    131d:	5d                   	pop    %ebp
    131e:	c3                   	ret    
    131f:	90                   	nop
  for(n = 0; s[n]; n++)
    1320:	31 c9                	xor    %ecx,%ecx
}
    1322:	5d                   	pop    %ebp
    1323:	89 c8                	mov    %ecx,%eax
    1325:	c3                   	ret    
    1326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132d:	8d 76 00             	lea    0x0(%esi),%esi

00001330 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1337:	8b 4d 10             	mov    0x10(%ebp),%ecx
    133a:	8b 45 0c             	mov    0xc(%ebp),%eax
    133d:	89 d7                	mov    %edx,%edi
    133f:	fc                   	cld    
    1340:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1342:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1345:	89 d0                	mov    %edx,%eax
    1347:	c9                   	leave  
    1348:	c3                   	ret    
    1349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001350 <strchr>:

char*
strchr(const char *s, char c)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	8b 45 08             	mov    0x8(%ebp),%eax
    1356:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    135a:	0f b6 10             	movzbl (%eax),%edx
    135d:	84 d2                	test   %dl,%dl
    135f:	75 12                	jne    1373 <strchr+0x23>
    1361:	eb 1d                	jmp    1380 <strchr+0x30>
    1363:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1367:	90                   	nop
    1368:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    136c:	83 c0 01             	add    $0x1,%eax
    136f:	84 d2                	test   %dl,%dl
    1371:	74 0d                	je     1380 <strchr+0x30>
    if(*s == c)
    1373:	38 d1                	cmp    %dl,%cl
    1375:	75 f1                	jne    1368 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1377:	5d                   	pop    %ebp
    1378:	c3                   	ret    
    1379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1380:	31 c0                	xor    %eax,%eax
}
    1382:	5d                   	pop    %ebp
    1383:	c3                   	ret    
    1384:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    138b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    138f:	90                   	nop

00001390 <gets>:

char*
gets(char *buf, int max)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	57                   	push   %edi
    1394:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1395:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1398:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1399:	31 db                	xor    %ebx,%ebx
{
    139b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    139e:	eb 27                	jmp    13c7 <gets+0x37>
    cc = read(0, &c, 1);
    13a0:	83 ec 04             	sub    $0x4,%esp
    13a3:	6a 01                	push   $0x1
    13a5:	57                   	push   %edi
    13a6:	6a 00                	push   $0x0
    13a8:	e8 2e 01 00 00       	call   14db <read>
    if(cc < 1)
    13ad:	83 c4 10             	add    $0x10,%esp
    13b0:	85 c0                	test   %eax,%eax
    13b2:	7e 1d                	jle    13d1 <gets+0x41>
      break;
    buf[i++] = c;
    13b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    13b8:	8b 55 08             	mov    0x8(%ebp),%edx
    13bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    13bf:	3c 0a                	cmp    $0xa,%al
    13c1:	74 1d                	je     13e0 <gets+0x50>
    13c3:	3c 0d                	cmp    $0xd,%al
    13c5:	74 19                	je     13e0 <gets+0x50>
  for(i=0; i+1 < max; ){
    13c7:	89 de                	mov    %ebx,%esi
    13c9:	83 c3 01             	add    $0x1,%ebx
    13cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    13cf:	7c cf                	jl     13a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    13d1:	8b 45 08             	mov    0x8(%ebp),%eax
    13d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    13d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13db:	5b                   	pop    %ebx
    13dc:	5e                   	pop    %esi
    13dd:	5f                   	pop    %edi
    13de:	5d                   	pop    %ebp
    13df:	c3                   	ret    
  buf[i] = '\0';
    13e0:	8b 45 08             	mov    0x8(%ebp),%eax
    13e3:	89 de                	mov    %ebx,%esi
    13e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    13e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13ec:	5b                   	pop    %ebx
    13ed:	5e                   	pop    %esi
    13ee:	5f                   	pop    %edi
    13ef:	5d                   	pop    %ebp
    13f0:	c3                   	ret    
    13f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ff:	90                   	nop

00001400 <stat>:

int
stat(const char *n, struct stat *st)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	56                   	push   %esi
    1404:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1405:	83 ec 08             	sub    $0x8,%esp
    1408:	6a 00                	push   $0x0
    140a:	ff 75 08             	push   0x8(%ebp)
    140d:	e8 f1 00 00 00       	call   1503 <open>
  if(fd < 0)
    1412:	83 c4 10             	add    $0x10,%esp
    1415:	85 c0                	test   %eax,%eax
    1417:	78 27                	js     1440 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1419:	83 ec 08             	sub    $0x8,%esp
    141c:	ff 75 0c             	push   0xc(%ebp)
    141f:	89 c3                	mov    %eax,%ebx
    1421:	50                   	push   %eax
    1422:	e8 f4 00 00 00       	call   151b <fstat>
  close(fd);
    1427:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    142a:	89 c6                	mov    %eax,%esi
  close(fd);
    142c:	e8 ba 00 00 00       	call   14eb <close>
  return r;
    1431:	83 c4 10             	add    $0x10,%esp
}
    1434:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1437:	89 f0                	mov    %esi,%eax
    1439:	5b                   	pop    %ebx
    143a:	5e                   	pop    %esi
    143b:	5d                   	pop    %ebp
    143c:	c3                   	ret    
    143d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1440:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1445:	eb ed                	jmp    1434 <stat+0x34>
    1447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    144e:	66 90                	xchg   %ax,%ax

00001450 <atoi>:

int
atoi(const char *s)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	53                   	push   %ebx
    1454:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1457:	0f be 02             	movsbl (%edx),%eax
    145a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    145d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1460:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1465:	77 1e                	ja     1485 <atoi+0x35>
    1467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    146e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1470:	83 c2 01             	add    $0x1,%edx
    1473:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1476:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    147a:	0f be 02             	movsbl (%edx),%eax
    147d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1480:	80 fb 09             	cmp    $0x9,%bl
    1483:	76 eb                	jbe    1470 <atoi+0x20>
  return n;
}
    1485:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1488:	89 c8                	mov    %ecx,%eax
    148a:	c9                   	leave  
    148b:	c3                   	ret    
    148c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001490 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	57                   	push   %edi
    1494:	8b 45 10             	mov    0x10(%ebp),%eax
    1497:	8b 55 08             	mov    0x8(%ebp),%edx
    149a:	56                   	push   %esi
    149b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    149e:	85 c0                	test   %eax,%eax
    14a0:	7e 13                	jle    14b5 <memmove+0x25>
    14a2:	01 d0                	add    %edx,%eax
  dst = vdst;
    14a4:	89 d7                	mov    %edx,%edi
    14a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    14b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    14b1:	39 f8                	cmp    %edi,%eax
    14b3:	75 fb                	jne    14b0 <memmove+0x20>
  return vdst;
}
    14b5:	5e                   	pop    %esi
    14b6:	89 d0                	mov    %edx,%eax
    14b8:	5f                   	pop    %edi
    14b9:	5d                   	pop    %ebp
    14ba:	c3                   	ret    

000014bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    14bb:	b8 01 00 00 00       	mov    $0x1,%eax
    14c0:	cd 40                	int    $0x40
    14c2:	c3                   	ret    

000014c3 <exit>:
SYSCALL(exit)
    14c3:	b8 02 00 00 00       	mov    $0x2,%eax
    14c8:	cd 40                	int    $0x40
    14ca:	c3                   	ret    

000014cb <wait>:
SYSCALL(wait)
    14cb:	b8 03 00 00 00       	mov    $0x3,%eax
    14d0:	cd 40                	int    $0x40
    14d2:	c3                   	ret    

000014d3 <pipe>:
SYSCALL(pipe)
    14d3:	b8 04 00 00 00       	mov    $0x4,%eax
    14d8:	cd 40                	int    $0x40
    14da:	c3                   	ret    

000014db <read>:
SYSCALL(read)
    14db:	b8 05 00 00 00       	mov    $0x5,%eax
    14e0:	cd 40                	int    $0x40
    14e2:	c3                   	ret    

000014e3 <write>:
SYSCALL(write)
    14e3:	b8 10 00 00 00       	mov    $0x10,%eax
    14e8:	cd 40                	int    $0x40
    14ea:	c3                   	ret    

000014eb <close>:
SYSCALL(close)
    14eb:	b8 15 00 00 00       	mov    $0x15,%eax
    14f0:	cd 40                	int    $0x40
    14f2:	c3                   	ret    

000014f3 <kill>:
SYSCALL(kill)
    14f3:	b8 06 00 00 00       	mov    $0x6,%eax
    14f8:	cd 40                	int    $0x40
    14fa:	c3                   	ret    

000014fb <exec>:
SYSCALL(exec)
    14fb:	b8 07 00 00 00       	mov    $0x7,%eax
    1500:	cd 40                	int    $0x40
    1502:	c3                   	ret    

00001503 <open>:
SYSCALL(open)
    1503:	b8 0f 00 00 00       	mov    $0xf,%eax
    1508:	cd 40                	int    $0x40
    150a:	c3                   	ret    

0000150b <mknod>:
SYSCALL(mknod)
    150b:	b8 11 00 00 00       	mov    $0x11,%eax
    1510:	cd 40                	int    $0x40
    1512:	c3                   	ret    

00001513 <unlink>:
SYSCALL(unlink)
    1513:	b8 12 00 00 00       	mov    $0x12,%eax
    1518:	cd 40                	int    $0x40
    151a:	c3                   	ret    

0000151b <fstat>:
SYSCALL(fstat)
    151b:	b8 08 00 00 00       	mov    $0x8,%eax
    1520:	cd 40                	int    $0x40
    1522:	c3                   	ret    

00001523 <link>:
SYSCALL(link)
    1523:	b8 13 00 00 00       	mov    $0x13,%eax
    1528:	cd 40                	int    $0x40
    152a:	c3                   	ret    

0000152b <mkdir>:
SYSCALL(mkdir)
    152b:	b8 14 00 00 00       	mov    $0x14,%eax
    1530:	cd 40                	int    $0x40
    1532:	c3                   	ret    

00001533 <chdir>:
SYSCALL(chdir)
    1533:	b8 09 00 00 00       	mov    $0x9,%eax
    1538:	cd 40                	int    $0x40
    153a:	c3                   	ret    

0000153b <dup>:
SYSCALL(dup)
    153b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1540:	cd 40                	int    $0x40
    1542:	c3                   	ret    

00001543 <getpid>:
SYSCALL(getpid)
    1543:	b8 0b 00 00 00       	mov    $0xb,%eax
    1548:	cd 40                	int    $0x40
    154a:	c3                   	ret    

0000154b <sbrk>:
SYSCALL(sbrk)
    154b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1550:	cd 40                	int    $0x40
    1552:	c3                   	ret    

00001553 <sleep>:
SYSCALL(sleep)
    1553:	b8 0d 00 00 00       	mov    $0xd,%eax
    1558:	cd 40                	int    $0x40
    155a:	c3                   	ret    

0000155b <uptime>:
SYSCALL(uptime)
    155b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1560:	cd 40                	int    $0x40
    1562:	c3                   	ret    

00001563 <getpinfo>:

SYSCALL(getpinfo)
    1563:	b8 16 00 00 00       	mov    $0x16,%eax
    1568:	cd 40                	int    $0x40
    156a:	c3                   	ret    

0000156b <settickets>:
SYSCALL(settickets)
    156b:	b8 17 00 00 00       	mov    $0x17,%eax
    1570:	cd 40                	int    $0x40
    1572:	c3                   	ret    

00001573 <mprotect>:
SYSCALL(mprotect)
    1573:	b8 18 00 00 00       	mov    $0x18,%eax
    1578:	cd 40                	int    $0x40
    157a:	c3                   	ret    

0000157b <munprotect>:
SYSCALL(munprotect)
    157b:	b8 19 00 00 00       	mov    $0x19,%eax
    1580:	cd 40                	int    $0x40
    1582:	c3                   	ret    
    1583:	66 90                	xchg   %ax,%ax
    1585:	66 90                	xchg   %ax,%ax
    1587:	66 90                	xchg   %ax,%ax
    1589:	66 90                	xchg   %ax,%ax
    158b:	66 90                	xchg   %ax,%ax
    158d:	66 90                	xchg   %ax,%ax
    158f:	90                   	nop

00001590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	57                   	push   %edi
    1594:	56                   	push   %esi
    1595:	53                   	push   %ebx
    1596:	83 ec 3c             	sub    $0x3c,%esp
    1599:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    159c:	89 d1                	mov    %edx,%ecx
{
    159e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    15a1:	85 d2                	test   %edx,%edx
    15a3:	0f 89 7f 00 00 00    	jns    1628 <printint+0x98>
    15a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    15ad:	74 79                	je     1628 <printint+0x98>
    neg = 1;
    15af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    15b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    15b8:	31 db                	xor    %ebx,%ebx
    15ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    15c0:	89 c8                	mov    %ecx,%eax
    15c2:	31 d2                	xor    %edx,%edx
    15c4:	89 cf                	mov    %ecx,%edi
    15c6:	f7 75 c4             	divl   -0x3c(%ebp)
    15c9:	0f b6 92 94 1a 00 00 	movzbl 0x1a94(%edx),%edx
    15d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    15d3:	89 d8                	mov    %ebx,%eax
    15d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    15d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    15db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    15de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    15e1:	76 dd                	jbe    15c0 <printint+0x30>
  if(neg)
    15e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    15e6:	85 c9                	test   %ecx,%ecx
    15e8:	74 0c                	je     15f6 <printint+0x66>
    buf[i++] = '-';
    15ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    15ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    15f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    15f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    15f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    15fd:	eb 07                	jmp    1606 <printint+0x76>
    15ff:	90                   	nop
    putc(fd, buf[i]);
    1600:	0f b6 13             	movzbl (%ebx),%edx
    1603:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1606:	83 ec 04             	sub    $0x4,%esp
    1609:	88 55 d7             	mov    %dl,-0x29(%ebp)
    160c:	6a 01                	push   $0x1
    160e:	56                   	push   %esi
    160f:	57                   	push   %edi
    1610:	e8 ce fe ff ff       	call   14e3 <write>
  while(--i >= 0)
    1615:	83 c4 10             	add    $0x10,%esp
    1618:	39 de                	cmp    %ebx,%esi
    161a:	75 e4                	jne    1600 <printint+0x70>
}
    161c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    161f:	5b                   	pop    %ebx
    1620:	5e                   	pop    %esi
    1621:	5f                   	pop    %edi
    1622:	5d                   	pop    %ebp
    1623:	c3                   	ret    
    1624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1628:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    162f:	eb 87                	jmp    15b8 <printint+0x28>
    1631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163f:	90                   	nop

00001640 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1640:	55                   	push   %ebp
    1641:	89 e5                	mov    %esp,%ebp
    1643:	57                   	push   %edi
    1644:	56                   	push   %esi
    1645:	53                   	push   %ebx
    1646:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1649:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    164c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    164f:	0f b6 13             	movzbl (%ebx),%edx
    1652:	84 d2                	test   %dl,%dl
    1654:	74 6a                	je     16c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1656:	8d 45 10             	lea    0x10(%ebp),%eax
    1659:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    165c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    165f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1661:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1664:	eb 36                	jmp    169c <printf+0x5c>
    1666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    166d:	8d 76 00             	lea    0x0(%esi),%esi
    1670:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1673:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1678:	83 f8 25             	cmp    $0x25,%eax
    167b:	74 15                	je     1692 <printf+0x52>
  write(fd, &c, 1);
    167d:	83 ec 04             	sub    $0x4,%esp
    1680:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1683:	6a 01                	push   $0x1
    1685:	57                   	push   %edi
    1686:	56                   	push   %esi
    1687:	e8 57 fe ff ff       	call   14e3 <write>
    168c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    168f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1692:	0f b6 13             	movzbl (%ebx),%edx
    1695:	83 c3 01             	add    $0x1,%ebx
    1698:	84 d2                	test   %dl,%dl
    169a:	74 24                	je     16c0 <printf+0x80>
    c = fmt[i] & 0xff;
    169c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    169f:	85 c9                	test   %ecx,%ecx
    16a1:	74 cd                	je     1670 <printf+0x30>
      }
    } else if(state == '%'){
    16a3:	83 f9 25             	cmp    $0x25,%ecx
    16a6:	75 ea                	jne    1692 <printf+0x52>
      if(c == 'd'){
    16a8:	83 f8 25             	cmp    $0x25,%eax
    16ab:	0f 84 07 01 00 00    	je     17b8 <printf+0x178>
    16b1:	83 e8 63             	sub    $0x63,%eax
    16b4:	83 f8 15             	cmp    $0x15,%eax
    16b7:	77 17                	ja     16d0 <printf+0x90>
    16b9:	ff 24 85 3c 1a 00 00 	jmp    *0x1a3c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    16c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16c3:	5b                   	pop    %ebx
    16c4:	5e                   	pop    %esi
    16c5:	5f                   	pop    %edi
    16c6:	5d                   	pop    %ebp
    16c7:	c3                   	ret    
    16c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16cf:	90                   	nop
  write(fd, &c, 1);
    16d0:	83 ec 04             	sub    $0x4,%esp
    16d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    16d6:	6a 01                	push   $0x1
    16d8:	57                   	push   %edi
    16d9:	56                   	push   %esi
    16da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16de:	e8 00 fe ff ff       	call   14e3 <write>
        putc(fd, c);
    16e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    16e7:	83 c4 0c             	add    $0xc,%esp
    16ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
    16ed:	6a 01                	push   $0x1
    16ef:	57                   	push   %edi
    16f0:	56                   	push   %esi
    16f1:	e8 ed fd ff ff       	call   14e3 <write>
        putc(fd, c);
    16f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16f9:	31 c9                	xor    %ecx,%ecx
    16fb:	eb 95                	jmp    1692 <printf+0x52>
    16fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1700:	83 ec 0c             	sub    $0xc,%esp
    1703:	b9 10 00 00 00       	mov    $0x10,%ecx
    1708:	6a 00                	push   $0x0
    170a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    170d:	8b 10                	mov    (%eax),%edx
    170f:	89 f0                	mov    %esi,%eax
    1711:	e8 7a fe ff ff       	call   1590 <printint>
        ap++;
    1716:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    171a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    171d:	31 c9                	xor    %ecx,%ecx
    171f:	e9 6e ff ff ff       	jmp    1692 <printf+0x52>
    1724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1728:	8b 45 d0             	mov    -0x30(%ebp),%eax
    172b:	8b 10                	mov    (%eax),%edx
        ap++;
    172d:	83 c0 04             	add    $0x4,%eax
    1730:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1733:	85 d2                	test   %edx,%edx
    1735:	0f 84 8d 00 00 00    	je     17c8 <printf+0x188>
        while(*s != 0){
    173b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    173e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1740:	84 c0                	test   %al,%al
    1742:	0f 84 4a ff ff ff    	je     1692 <printf+0x52>
    1748:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    174b:	89 d3                	mov    %edx,%ebx
    174d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1750:	83 ec 04             	sub    $0x4,%esp
          s++;
    1753:	83 c3 01             	add    $0x1,%ebx
    1756:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1759:	6a 01                	push   $0x1
    175b:	57                   	push   %edi
    175c:	56                   	push   %esi
    175d:	e8 81 fd ff ff       	call   14e3 <write>
        while(*s != 0){
    1762:	0f b6 03             	movzbl (%ebx),%eax
    1765:	83 c4 10             	add    $0x10,%esp
    1768:	84 c0                	test   %al,%al
    176a:	75 e4                	jne    1750 <printf+0x110>
      state = 0;
    176c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    176f:	31 c9                	xor    %ecx,%ecx
    1771:	e9 1c ff ff ff       	jmp    1692 <printf+0x52>
    1776:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    177d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1780:	83 ec 0c             	sub    $0xc,%esp
    1783:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1788:	6a 01                	push   $0x1
    178a:	e9 7b ff ff ff       	jmp    170a <printf+0xca>
    178f:	90                   	nop
        putc(fd, *ap);
    1790:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1793:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1796:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1798:	6a 01                	push   $0x1
    179a:	57                   	push   %edi
    179b:	56                   	push   %esi
        putc(fd, *ap);
    179c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    179f:	e8 3f fd ff ff       	call   14e3 <write>
        ap++;
    17a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    17a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17ab:	31 c9                	xor    %ecx,%ecx
    17ad:	e9 e0 fe ff ff       	jmp    1692 <printf+0x52>
    17b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    17b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    17bb:	83 ec 04             	sub    $0x4,%esp
    17be:	e9 2a ff ff ff       	jmp    16ed <printf+0xad>
    17c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17c7:	90                   	nop
          s = "(null)";
    17c8:	ba 35 1a 00 00       	mov    $0x1a35,%edx
        while(*s != 0){
    17cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    17d0:	b8 28 00 00 00       	mov    $0x28,%eax
    17d5:	89 d3                	mov    %edx,%ebx
    17d7:	e9 74 ff ff ff       	jmp    1750 <printf+0x110>
    17dc:	66 90                	xchg   %ax,%ax
    17de:	66 90                	xchg   %ax,%ax

000017e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    17e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17e1:	a1 b4 1d 00 00       	mov    0x1db4,%eax
{
    17e6:	89 e5                	mov    %esp,%ebp
    17e8:	57                   	push   %edi
    17e9:	56                   	push   %esi
    17ea:	53                   	push   %ebx
    17eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    17ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17f8:	89 c2                	mov    %eax,%edx
    17fa:	8b 00                	mov    (%eax),%eax
    17fc:	39 ca                	cmp    %ecx,%edx
    17fe:	73 30                	jae    1830 <free+0x50>
    1800:	39 c1                	cmp    %eax,%ecx
    1802:	72 04                	jb     1808 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1804:	39 c2                	cmp    %eax,%edx
    1806:	72 f0                	jb     17f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1808:	8b 73 fc             	mov    -0x4(%ebx),%esi
    180b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    180e:	39 f8                	cmp    %edi,%eax
    1810:	74 30                	je     1842 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1812:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1815:	8b 42 04             	mov    0x4(%edx),%eax
    1818:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    181b:	39 f1                	cmp    %esi,%ecx
    181d:	74 3a                	je     1859 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    181f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1821:	5b                   	pop    %ebx
  freep = p;
    1822:	89 15 b4 1d 00 00    	mov    %edx,0x1db4
}
    1828:	5e                   	pop    %esi
    1829:	5f                   	pop    %edi
    182a:	5d                   	pop    %ebp
    182b:	c3                   	ret    
    182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1830:	39 c2                	cmp    %eax,%edx
    1832:	72 c4                	jb     17f8 <free+0x18>
    1834:	39 c1                	cmp    %eax,%ecx
    1836:	73 c0                	jae    17f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1838:	8b 73 fc             	mov    -0x4(%ebx),%esi
    183b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    183e:	39 f8                	cmp    %edi,%eax
    1840:	75 d0                	jne    1812 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1842:	03 70 04             	add    0x4(%eax),%esi
    1845:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1848:	8b 02                	mov    (%edx),%eax
    184a:	8b 00                	mov    (%eax),%eax
    184c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    184f:	8b 42 04             	mov    0x4(%edx),%eax
    1852:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1855:	39 f1                	cmp    %esi,%ecx
    1857:	75 c6                	jne    181f <free+0x3f>
    p->s.size += bp->s.size;
    1859:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    185c:	89 15 b4 1d 00 00    	mov    %edx,0x1db4
    p->s.size += bp->s.size;
    1862:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1865:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1868:	89 0a                	mov    %ecx,(%edx)
}
    186a:	5b                   	pop    %ebx
    186b:	5e                   	pop    %esi
    186c:	5f                   	pop    %edi
    186d:	5d                   	pop    %ebp
    186e:	c3                   	ret    
    186f:	90                   	nop

00001870 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1870:	55                   	push   %ebp
    1871:	89 e5                	mov    %esp,%ebp
    1873:	57                   	push   %edi
    1874:	56                   	push   %esi
    1875:	53                   	push   %ebx
    1876:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1879:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    187c:	8b 3d b4 1d 00 00    	mov    0x1db4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1882:	8d 70 07             	lea    0x7(%eax),%esi
    1885:	c1 ee 03             	shr    $0x3,%esi
    1888:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    188b:	85 ff                	test   %edi,%edi
    188d:	0f 84 9d 00 00 00    	je     1930 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1893:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1895:	8b 4a 04             	mov    0x4(%edx),%ecx
    1898:	39 f1                	cmp    %esi,%ecx
    189a:	73 6a                	jae    1906 <malloc+0x96>
    189c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    18a1:	39 de                	cmp    %ebx,%esi
    18a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    18a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    18ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    18b0:	eb 17                	jmp    18c9 <malloc+0x59>
    18b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    18ba:	8b 48 04             	mov    0x4(%eax),%ecx
    18bd:	39 f1                	cmp    %esi,%ecx
    18bf:	73 4f                	jae    1910 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    18c1:	8b 3d b4 1d 00 00    	mov    0x1db4,%edi
    18c7:	89 c2                	mov    %eax,%edx
    18c9:	39 d7                	cmp    %edx,%edi
    18cb:	75 eb                	jne    18b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    18cd:	83 ec 0c             	sub    $0xc,%esp
    18d0:	ff 75 e4             	push   -0x1c(%ebp)
    18d3:	e8 73 fc ff ff       	call   154b <sbrk>
  if(p == (char*)-1)
    18d8:	83 c4 10             	add    $0x10,%esp
    18db:	83 f8 ff             	cmp    $0xffffffff,%eax
    18de:	74 1c                	je     18fc <malloc+0x8c>
  hp->s.size = nu;
    18e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    18e3:	83 ec 0c             	sub    $0xc,%esp
    18e6:	83 c0 08             	add    $0x8,%eax
    18e9:	50                   	push   %eax
    18ea:	e8 f1 fe ff ff       	call   17e0 <free>
  return freep;
    18ef:	8b 15 b4 1d 00 00    	mov    0x1db4,%edx
      if((p = morecore(nunits)) == 0)
    18f5:	83 c4 10             	add    $0x10,%esp
    18f8:	85 d2                	test   %edx,%edx
    18fa:	75 bc                	jne    18b8 <malloc+0x48>
        return 0;
  }
}
    18fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    18ff:	31 c0                	xor    %eax,%eax
}
    1901:	5b                   	pop    %ebx
    1902:	5e                   	pop    %esi
    1903:	5f                   	pop    %edi
    1904:	5d                   	pop    %ebp
    1905:	c3                   	ret    
    if(p->s.size >= nunits){
    1906:	89 d0                	mov    %edx,%eax
    1908:	89 fa                	mov    %edi,%edx
    190a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1910:	39 ce                	cmp    %ecx,%esi
    1912:	74 4c                	je     1960 <malloc+0xf0>
        p->s.size -= nunits;
    1914:	29 f1                	sub    %esi,%ecx
    1916:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1919:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    191c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    191f:	89 15 b4 1d 00 00    	mov    %edx,0x1db4
}
    1925:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1928:	83 c0 08             	add    $0x8,%eax
}
    192b:	5b                   	pop    %ebx
    192c:	5e                   	pop    %esi
    192d:	5f                   	pop    %edi
    192e:	5d                   	pop    %ebp
    192f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1930:	c7 05 b4 1d 00 00 b8 	movl   $0x1db8,0x1db4
    1937:	1d 00 00 
    base.s.size = 0;
    193a:	bf b8 1d 00 00       	mov    $0x1db8,%edi
    base.s.ptr = freep = prevp = &base;
    193f:	c7 05 b8 1d 00 00 b8 	movl   $0x1db8,0x1db8
    1946:	1d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1949:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    194b:	c7 05 bc 1d 00 00 00 	movl   $0x0,0x1dbc
    1952:	00 00 00 
    if(p->s.size >= nunits){
    1955:	e9 42 ff ff ff       	jmp    189c <malloc+0x2c>
    195a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1960:	8b 08                	mov    (%eax),%ecx
    1962:	89 0a                	mov    %ecx,(%edx)
    1964:	eb b9                	jmp    191f <malloc+0xaf>
