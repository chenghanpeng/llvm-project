; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown -mattr=+sse4.2 | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-unknown -mattr=+sse4.2 | FileCheck %s --check-prefix=X64

;
; AND/XOR/OR i32 as v4i8
;

define i32 @and_i32_as_v4i8(i32 %a, i32 %b) nounwind {
; X86-LABEL: and_i32_as_v4i8:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    andl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: and_i32_as_v4i8:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    andl %esi, %eax
; X64-NEXT:    retq
  %1 = bitcast i32 %a to <4 x i8>
  %2 = bitcast i32 %b to <4 x i8>
  %3 = and <4 x i8> %1, %2
  %4 = bitcast <4 x i8> %3 to i32
  ret i32 %4
}

define i32 @xor_i32_as_v4i8(i32 %a, i32 %b) nounwind {
; X86-LABEL: xor_i32_as_v4i8:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    xorl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: xor_i32_as_v4i8:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    xorl %esi, %eax
; X64-NEXT:    retq
  %1 = bitcast i32 %a to <4 x i8>
  %2 = bitcast i32 %b to <4 x i8>
  %3 = xor <4 x i8> %1, %2
  %4 = bitcast <4 x i8> %3 to i32
  ret i32 %4
}

define i32 @or_i32_as_v4i8(i32 %a, i32 %b) nounwind {
; X86-LABEL: or_i32_as_v4i8:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    orl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: or_i32_as_v4i8:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    orl %esi, %eax
; X64-NEXT:    retq
  %1 = bitcast i32 %a to <4 x i8>
  %2 = bitcast i32 %b to <4 x i8>
  %3 = or <4 x i8> %1, %2
  %4 = bitcast <4 x i8> %3 to i32
  ret i32 %4
}

;
; AND/XOR/OR i32 as v8i4
;

define i32 @and_i32_as_v8i4(i32 %a, i32 %b) nounwind {
; X86-LABEL: and_i32_as_v8i4:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    andl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: and_i32_as_v8i4:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    andl %esi, %eax
; X64-NEXT:    retq
  %1 = bitcast i32 %a to <8 x i4>
  %2 = bitcast i32 %b to <8 x i4>
  %3 = and <8 x i4> %1, %2
  %4 = bitcast <8 x i4> %3 to i32
  ret i32 %4
}

define i32 @xor_i32_as_v8i4(i32 %a, i32 %b) nounwind {
; X86-LABEL: xor_i32_as_v8i4:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    xorl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: xor_i32_as_v8i4:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    xorl %esi, %eax
; X64-NEXT:    retq
  %1 = bitcast i32 %a to <8 x i4>
  %2 = bitcast i32 %b to <8 x i4>
  %3 = xor <8 x i4> %1, %2
  %4 = bitcast <8 x i4> %3 to i32
  ret i32 %4
}

define i32 @or_i32_as_v8i4(i32 %a, i32 %b) nounwind {
; X86-LABEL: or_i32_as_v8i4:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    orl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: or_i32_as_v8i4:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    orl %esi, %eax
; X64-NEXT:    retq
  %1 = bitcast i32 %a to <8 x i4>
  %2 = bitcast i32 %b to <8 x i4>
  %3 = or <8 x i4> %1, %2
  %4 = bitcast <8 x i4> %3 to i32
  ret i32 %4
}

;
; AND/XOR/OR v4i8 as i32
;

define <4 x i8> @and_v4i8_as_i32(<4 x i8> %a, <4 x i8> %b) nounwind {
; X86-LABEL: and_v4i8_as_i32:
; X86:       # %bb.0:
; X86-NEXT:    andps %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: and_v4i8_as_i32:
; X64:       # %bb.0:
; X64-NEXT:    andps %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = bitcast <4 x i8> %a to i32
  %2 = bitcast <4 x i8> %b to i32
  %3 = and i32 %1, %2
  %4 = bitcast i32 %3 to <4 x i8>
  ret <4 x i8>  %4
}

define <4 x i8> @xor_v4i8_as_i32(<4 x i8> %a, <4 x i8> %b) nounwind {
; X86-LABEL: xor_v4i8_as_i32:
; X86:       # %bb.0:
; X86-NEXT:    xorps %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: xor_v4i8_as_i32:
; X64:       # %bb.0:
; X64-NEXT:    xorps %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = bitcast <4 x i8> %a to i32
  %2 = bitcast <4 x i8> %b to i32
  %3 = xor i32 %1, %2
  %4 = bitcast i32 %3 to <4 x i8>
  ret <4 x i8>  %4
}

define <4 x i8> @or_v4i8_as_i32(<4 x i8> %a, <4 x i8> %b) nounwind {
; X86-LABEL: or_v4i8_as_i32:
; X86:       # %bb.0:
; X86-NEXT:    orps %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: or_v4i8_as_i32:
; X64:       # %bb.0:
; X64-NEXT:    orps %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = bitcast <4 x i8> %a to i32
  %2 = bitcast <4 x i8> %b to i32
  %3 = or i32 %1, %2
  %4 = bitcast i32 %3 to <4 x i8>
  ret <4 x i8>  %4
}

;
; AND/XOR/OR v8i4 as i32
;

define <8 x i4> @and_v8i4_as_i32(<8 x i4> %a, <8 x i4> %b) nounwind {
; X86-LABEL: and_v8i4_as_i32:
; X86:       # %bb.0:
; X86-NEXT:    andps %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: and_v8i4_as_i32:
; X64:       # %bb.0:
; X64-NEXT:    andps %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = bitcast <8 x i4> %a to i32
  %2 = bitcast <8 x i4> %b to i32
  %3 = and i32 %1, %2
  %4 = bitcast i32 %3 to <8 x i4>
  ret <8 x i4>  %4
}

define <8 x i4> @xor_v8i4_as_i32(<8 x i4> %a, <8 x i4> %b) nounwind {
; X86-LABEL: xor_v8i4_as_i32:
; X86:       # %bb.0:
; X86-NEXT:    xorps %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: xor_v8i4_as_i32:
; X64:       # %bb.0:
; X64-NEXT:    xorps %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = bitcast <8 x i4> %a to i32
  %2 = bitcast <8 x i4> %b to i32
  %3 = xor i32 %1, %2
  %4 = bitcast i32 %3 to <8 x i4>
  ret <8 x i4>  %4
}

define <8 x i4> @or_v8i4_as_i32(<8 x i4> %a, <8 x i4> %b) nounwind {
; X86-LABEL: or_v8i4_as_i32:
; X86:       # %bb.0:
; X86-NEXT:    orps %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: or_v8i4_as_i32:
; X64:       # %bb.0:
; X64-NEXT:    orps %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = bitcast <8 x i4> %a to i32
  %2 = bitcast <8 x i4> %b to i32
  %3 = or i32 %1, %2
  %4 = bitcast i32 %3 to <8 x i4>
  ret <8 x i4>  %4
}
