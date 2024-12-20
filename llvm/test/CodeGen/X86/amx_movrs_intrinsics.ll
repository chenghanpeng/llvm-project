; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -O0 -mtriple=x86_64-unknown-unknown -mattr=+amx-tile,+amx-movrs | FileCheck %s

define void @test_amx_internal(i16 %m, i16 %n, ptr %buf, i64 %s) {
; CHECK-LABEL: test_amx_internal:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    pushq %rbp
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    .cfi_offset %rbp, -16
; CHECK-NEXT:    movq %rsp, %rbp
; CHECK-NEXT:    .cfi_def_cfa_register %rbp
; CHECK-NEXT:    andq $-1024, %rsp # imm = 0xFC00
; CHECK-NEXT:    subq $3072, %rsp # imm = 0xC00
; CHECK-NEXT:    xorps %xmm0, %xmm0
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movb $1, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movq %rcx, {{[-0-9]+}}(%r{{[sb]}}p) # 8-byte Spill
; CHECK-NEXT:    movl %esi, %eax
; CHECK-NEXT:    movq {{[-0-9]+}}(%r{{[sb]}}p), %rsi # 8-byte Reload
; CHECK-NEXT:    movw %ax, %cx
; CHECK-NEXT:    movw %di, %ax
; CHECK-NEXT:    # implicit-def: $al
; CHECK-NEXT:    movb %al, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movw %cx, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    ldtilecfg {{[0-9]+}}(%rsp)
; CHECK-NEXT:    tileloaddrs (%rdx,%rsi), %tmm0
; CHECK-NEXT:    movl $64, %esi
; CHECK-NEXT:    leaq {{[0-9]+}}(%rsp), %rdx
; CHECK-NEXT:    tilestored %tmm0, (%rdx,%rsi)
; CHECK-NEXT:    movq %rbp, %rsp
; CHECK-NEXT:    popq %rbp
; CHECK-NEXT:    .cfi_def_cfa %rsp, 8
; CHECK-NEXT:    tilerelease
; CHECK-NEXT:    retq
entry:
  %t1 = call x86_amx @llvm.x86.tileloaddrs64.internal(i16 %m, i16 %n, ptr %buf, i64 %s)
  %t2 = call <256 x i32> @llvm.x86.cast.tile.to.vector.v256i32(x86_amx %t1)
  ret void
}
declare x86_amx @llvm.x86.tileloaddrs64.internal(i16, i16, ptr, i64)

define void @test_amx_old(i16 %m, i16 %n, ptr %buf) {
; CHECK-LABEL: test_amx_old:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    movl $32, %eax
; CHECK-NEXT:    tileloaddrs (%rdx,%rax), %tmm2
; CHECK-NEXT:    retq
entry:
  call void @llvm.x86.tileloaddrs64(i8 2, ptr %buf, i64 32)
  ret void
}
declare void @llvm.x86.tileloaddrs64(i8 immarg, ptr, i64)

define void @test_amx_t1_internal(i16 %m, i16 %n, ptr %buf, i64 %s) {
; CHECK-LABEL: test_amx_t1_internal:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    pushq %rbp
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    .cfi_offset %rbp, -16
; CHECK-NEXT:    movq %rsp, %rbp
; CHECK-NEXT:    .cfi_def_cfa_register %rbp
; CHECK-NEXT:    andq $-1024, %rsp # imm = 0xFC00
; CHECK-NEXT:    subq $3072, %rsp # imm = 0xC00
; CHECK-NEXT:    xorps %xmm0, %xmm0
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movups %xmm0, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movb $1, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movq %rcx, {{[-0-9]+}}(%r{{[sb]}}p) # 8-byte Spill
; CHECK-NEXT:    movl %esi, %eax
; CHECK-NEXT:    movq {{[-0-9]+}}(%r{{[sb]}}p), %rsi # 8-byte Reload
; CHECK-NEXT:    movw %ax, %cx
; CHECK-NEXT:    movw %di, %ax
; CHECK-NEXT:    # implicit-def: $al
; CHECK-NEXT:    movb %al, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    movw %cx, {{[0-9]+}}(%rsp)
; CHECK-NEXT:    ldtilecfg {{[0-9]+}}(%rsp)
; CHECK-NEXT:    tileloaddrst1 (%rdx,%rsi), %tmm0
; CHECK-NEXT:    movl $64, %esi
; CHECK-NEXT:    leaq {{[0-9]+}}(%rsp), %rdx
; CHECK-NEXT:    tilestored %tmm0, (%rdx,%rsi)
; CHECK-NEXT:    movq %rbp, %rsp
; CHECK-NEXT:    popq %rbp
; CHECK-NEXT:    .cfi_def_cfa %rsp, 8
; CHECK-NEXT:    tilerelease
; CHECK-NEXT:    retq
entry:
  %t1 = call x86_amx @llvm.x86.tileloaddrst164.internal(i16 %m, i16 %n, ptr %buf, i64 %s)
  %t2 = call <256 x i32> @llvm.x86.cast.tile.to.vector.v256i32(x86_amx %t1)
  ret void
}
declare x86_amx @llvm.x86.tileloaddrst164.internal(i16, i16, ptr, i64)

define void @test_amx_t1_old(i16 %m, i16 %n, ptr %buf) {
; CHECK-LABEL: test_amx_t1_old:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    movl $32, %eax
; CHECK-NEXT:    tileloaddrst1 (%rdx,%rax), %tmm2
; CHECK-NEXT:    retq
entry:
  call void @llvm.x86.tileloaddrst164(i8 2, ptr %buf, i64 32)
  ret void
}
declare void @llvm.x86.tileloaddrst164(i8 immarg, ptr, i64)
