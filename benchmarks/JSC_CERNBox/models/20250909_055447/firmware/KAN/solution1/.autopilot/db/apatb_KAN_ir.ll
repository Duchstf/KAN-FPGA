; ModuleID = '/data/dhoang/test/KAN-FPGA/benchmarks/JSC_CERNBox/models/20250909_055447/firmware/KAN/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<6>" = type { %"struct.ap_int_base<6, false>" }
%"struct.ap_int_base<6, false>" = type { %"struct.ssdm_int<6, false>" }
%"struct.ssdm_int<6, false>" = type { i6 }
%"struct.ap_int<8>" = type { %"struct.ap_int_base<8, true>" }
%"struct.ap_int_base<8, true>" = type { %"struct.ssdm_int<8, true>" }
%"struct.ssdm_int<8, true>" = type { i8 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_KAN_ir(%"struct.ap_uint<6>"* noalias nonnull readonly "fpga.decayed.dim.hint"="16" "partition" %input, %"struct.ap_int<8>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" "partition" %output) local_unnamed_addr #0 {
entry:
  %input_copy_0 = alloca i6, align 512
  %input_copy_1 = alloca i6, align 512
  %input_copy_2 = alloca i6, align 512
  %input_copy_3 = alloca i6, align 512
  %input_copy_4 = alloca i6, align 512
  %input_copy_5 = alloca i6, align 512
  %input_copy_6 = alloca i6, align 512
  %input_copy_7 = alloca i6, align 512
  %input_copy_8 = alloca i6, align 512
  %input_copy_9 = alloca i6, align 512
  %input_copy_10 = alloca i6, align 512
  %input_copy_11 = alloca i6, align 512
  %input_copy_12 = alloca i6, align 512
  %input_copy_13 = alloca i6, align 512
  %input_copy_14 = alloca i6, align 512
  %input_copy_15 = alloca i6, align 512
  %output_copy_0 = alloca i8, align 512
  %output_copy_1 = alloca i8, align 512
  %output_copy_2 = alloca i8, align 512
  %output_copy_3 = alloca i8, align 512
  %output_copy_4 = alloca i8, align 512
  %0 = bitcast %"struct.ap_uint<6>"* %input to [16 x %"struct.ap_uint<6>"]*
  %1 = bitcast %"struct.ap_int<8>"* %output to [5 x %"struct.ap_int<8>"]*
  call void @copy_in([16 x %"struct.ap_uint<6>"]* nonnull %0, i6* nonnull align 512 %input_copy_0, i6* nonnull align 512 %input_copy_1, i6* nonnull align 512 %input_copy_2, i6* nonnull align 512 %input_copy_3, i6* nonnull align 512 %input_copy_4, i6* nonnull align 512 %input_copy_5, i6* nonnull align 512 %input_copy_6, i6* nonnull align 512 %input_copy_7, i6* nonnull align 512 %input_copy_8, i6* nonnull align 512 %input_copy_9, i6* nonnull align 512 %input_copy_10, i6* nonnull align 512 %input_copy_11, i6* nonnull align 512 %input_copy_12, i6* nonnull align 512 %input_copy_13, i6* nonnull align 512 %input_copy_14, i6* nonnull align 512 %input_copy_15, [5 x %"struct.ap_int<8>"]* nonnull %1, i8* nonnull align 512 %output_copy_0, i8* nonnull align 512 %output_copy_1, i8* nonnull align 512 %output_copy_2, i8* nonnull align 512 %output_copy_3, i8* nonnull align 512 %output_copy_4)
  call void @apatb_KAN_hw(i6* %input_copy_0, i6* %input_copy_1, i6* %input_copy_2, i6* %input_copy_3, i6* %input_copy_4, i6* %input_copy_5, i6* %input_copy_6, i6* %input_copy_7, i6* %input_copy_8, i6* %input_copy_9, i6* %input_copy_10, i6* %input_copy_11, i6* %input_copy_12, i6* %input_copy_13, i6* %input_copy_14, i6* %input_copy_15, i8* %output_copy_0, i8* %output_copy_1, i8* %output_copy_2, i8* %output_copy_3, i8* %output_copy_4)
  call void @copy_back([16 x %"struct.ap_uint<6>"]* %0, i6* %input_copy_0, i6* %input_copy_1, i6* %input_copy_2, i6* %input_copy_3, i6* %input_copy_4, i6* %input_copy_5, i6* %input_copy_6, i6* %input_copy_7, i6* %input_copy_8, i6* %input_copy_9, i6* %input_copy_10, i6* %input_copy_11, i6* %input_copy_12, i6* %input_copy_13, i6* %input_copy_14, i6* %input_copy_15, [5 x %"struct.ap_int<8>"]* %1, i8* %output_copy_0, i8* %output_copy_1, i8* %output_copy_2, i8* %output_copy_3, i8* %output_copy_4)
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a16struct.ap_uint<6>.348"(i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.0" %dst_0, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.1" %dst_1, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.2" %dst_2, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.3" %dst_3, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.4" %dst_4, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.5" %dst_5, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.6" %dst_6, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.7" %dst_7, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.8" %dst_8, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.9" %dst_9, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.10" %dst_10, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.11" %dst_11, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.12" %dst_12, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.13" %dst_13, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.14" %dst_14, i6* nocapture "orig.arg.no"="0" "unpacked"="0.0.15" %dst_15, [16 x %"struct.ap_uint<6>"]* readonly "orig.arg.no"="1" "unpacked"="1" %src, i64 "orig.arg.no"="2" "unpacked"="2" %num) #2 {
entry:
  %0 = icmp eq [16 x %"struct.ap_uint<6>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.0.0.06.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.0.0.06.exit ]
  %src.addr.0.0.05 = getelementptr [16 x %"struct.ap_uint<6>"], [16 x %"struct.ap_uint<6>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = bitcast i6* %src.addr.0.0.05 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i6
  switch i64 %for.loop.idx2, label %dst.addr.0.0.06.case.15 [
    i64 0, label %dst.addr.0.0.06.case.0
    i64 1, label %dst.addr.0.0.06.case.1
    i64 2, label %dst.addr.0.0.06.case.2
    i64 3, label %dst.addr.0.0.06.case.3
    i64 4, label %dst.addr.0.0.06.case.4
    i64 5, label %dst.addr.0.0.06.case.5
    i64 6, label %dst.addr.0.0.06.case.6
    i64 7, label %dst.addr.0.0.06.case.7
    i64 8, label %dst.addr.0.0.06.case.8
    i64 9, label %dst.addr.0.0.06.case.9
    i64 10, label %dst.addr.0.0.06.case.10
    i64 11, label %dst.addr.0.0.06.case.11
    i64 12, label %dst.addr.0.0.06.case.12
    i64 13, label %dst.addr.0.0.06.case.13
    i64 14, label %dst.addr.0.0.06.case.14
  ]

dst.addr.0.0.06.case.0:                           ; preds = %for.loop
  store i6 %3, i6* %dst_0, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.1:                           ; preds = %for.loop
  store i6 %3, i6* %dst_1, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.2:                           ; preds = %for.loop
  store i6 %3, i6* %dst_2, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.3:                           ; preds = %for.loop
  store i6 %3, i6* %dst_3, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.4:                           ; preds = %for.loop
  store i6 %3, i6* %dst_4, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.5:                           ; preds = %for.loop
  store i6 %3, i6* %dst_5, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.6:                           ; preds = %for.loop
  store i6 %3, i6* %dst_6, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.7:                           ; preds = %for.loop
  store i6 %3, i6* %dst_7, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.8:                           ; preds = %for.loop
  store i6 %3, i6* %dst_8, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.9:                           ; preds = %for.loop
  store i6 %3, i6* %dst_9, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.10:                          ; preds = %for.loop
  store i6 %3, i6* %dst_10, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.11:                          ; preds = %for.loop
  store i6 %3, i6* %dst_11, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.12:                          ; preds = %for.loop
  store i6 %3, i6* %dst_12, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.13:                          ; preds = %for.loop
  store i6 %3, i6* %dst_13, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.14:                          ; preds = %for.loop
  store i6 %3, i6* %dst_14, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.15:                          ; preds = %for.loop
  %4 = icmp eq i64 %for.loop.idx2, 15
  call void @llvm.assume(i1 %4)
  store i6 %3, i6* %dst_15, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.exit:                             ; preds = %dst.addr.0.0.06.case.15, %dst.addr.0.0.06.case.14, %dst.addr.0.0.06.case.13, %dst.addr.0.0.06.case.12, %dst.addr.0.0.06.case.11, %dst.addr.0.0.06.case.10, %dst.addr.0.0.06.case.9, %dst.addr.0.0.06.case.8, %dst.addr.0.0.06.case.7, %dst.addr.0.0.06.case.6, %dst.addr.0.0.06.case.5, %dst.addr.0.0.06.case.4, %dst.addr.0.0.06.case.3, %dst.addr.0.0.06.case.2, %dst.addr.0.0.06.case.1, %dst.addr.0.0.06.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.0.0.06.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a16struct.ap_uint<6>.345"(i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.0" %dst_0, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.1" %dst_1, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.2" %dst_2, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.3" %dst_3, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.4" %dst_4, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.5" %dst_5, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.6" %dst_6, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.7" %dst_7, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.8" %dst_8, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.9" %dst_9, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.10" %dst_10, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.11" %dst_11, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.12" %dst_12, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.13" %dst_13, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.14" %dst_14, i6* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.15" %dst_15, [16 x %"struct.ap_uint<6>"]* noalias readonly "orig.arg.no"="1" "unpacked"="1" %src) #3 {
entry:
  %0 = icmp eq [16 x %"struct.ap_uint<6>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a16struct.ap_uint<6>.348"(i6* %dst_0, i6* %dst_1, i6* %dst_2, i6* %dst_3, i6* %dst_4, i6* %dst_5, i6* %dst_6, i6* %dst_7, i6* %dst_8, i6* %dst_9, i6* %dst_10, i6* %dst_11, i6* %dst_12, i6* %dst_13, i6* %dst_14, i6* %dst_15, [16 x %"struct.ap_uint<6>"]* nonnull %src, i64 16)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5struct.ap_int<8>"(i8* nocapture "orig.arg.no"="0" "unpacked"="0.0.0" %dst_0, i8* nocapture "orig.arg.no"="0" "unpacked"="0.0.1" %dst_1, i8* nocapture "orig.arg.no"="0" "unpacked"="0.0.2" %dst_2, i8* nocapture "orig.arg.no"="0" "unpacked"="0.0.3" %dst_3, i8* nocapture "orig.arg.no"="0" "unpacked"="0.0.4" %dst_4, [5 x %"struct.ap_int<8>"]* readonly "orig.arg.no"="1" "unpacked"="1" %src, i64 "orig.arg.no"="2" "unpacked"="2" %num) #2 {
entry:
  %0 = icmp eq [5 x %"struct.ap_int<8>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.0.0.06.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.0.0.06.exit ]
  %src.addr.0.0.05 = getelementptr [5 x %"struct.ap_int<8>"], [5 x %"struct.ap_int<8>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i8, i8* %src.addr.0.0.05, align 1
  switch i64 %for.loop.idx2, label %dst.addr.0.0.06.case.4 [
    i64 0, label %dst.addr.0.0.06.case.0
    i64 1, label %dst.addr.0.0.06.case.1
    i64 2, label %dst.addr.0.0.06.case.2
    i64 3, label %dst.addr.0.0.06.case.3
  ]

dst.addr.0.0.06.case.0:                           ; preds = %for.loop
  store i8 %1, i8* %dst_0, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.1:                           ; preds = %for.loop
  store i8 %1, i8* %dst_1, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.2:                           ; preds = %for.loop
  store i8 %1, i8* %dst_2, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.3:                           ; preds = %for.loop
  store i8 %1, i8* %dst_3, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.4:                           ; preds = %for.loop
  %2 = icmp eq i64 %for.loop.idx2, 4
  call void @llvm.assume(i1 %2)
  store i8 %1, i8* %dst_4, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.exit:                             ; preds = %dst.addr.0.0.06.case.4, %dst.addr.0.0.06.case.3, %dst.addr.0.0.06.case.2, %dst.addr.0.0.06.case.1, %dst.addr.0.0.06.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.0.0.06.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a5struct.ap_int<8>"(i8* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.0" %dst_0, i8* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.1" %dst_1, i8* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.2" %dst_2, i8* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.3" %dst_3, i8* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.4" %dst_4, [5 x %"struct.ap_int<8>"]* noalias readonly "orig.arg.no"="1" "unpacked"="1" %src) #3 {
entry:
  %0 = icmp eq [5 x %"struct.ap_int<8>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a5struct.ap_int<8>"(i8* %dst_0, i8* %dst_1, i8* %dst_2, i8* %dst_3, i8* %dst_4, [5 x %"struct.ap_int<8>"]* nonnull %src, i64 5)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_in([16 x %"struct.ap_uint<6>"]* noalias readonly "orig.arg.no"="0" "unpacked"="0", i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.0" %_0, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.1" %_1, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.2" %_2, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.3" %_3, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.4" %_4, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.5" %_5, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.6" %_6, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.7" %_7, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.8" %_8, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.9" %_9, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.10" %_10, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.11" %_11, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.12" %_12, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.13" %_13, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.14" %_14, i6* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0.15" %_15, [5 x %"struct.ap_int<8>"]* noalias readonly "orig.arg.no"="2" "unpacked"="2", i8* noalias nocapture align 512 "orig.arg.no"="3" "unpacked"="3.0.0" %_01, i8* noalias nocapture align 512 "orig.arg.no"="3" "unpacked"="3.0.1" %_16, i8* noalias nocapture align 512 "orig.arg.no"="3" "unpacked"="3.0.2" %_27, i8* noalias nocapture align 512 "orig.arg.no"="3" "unpacked"="3.0.3" %_38, i8* noalias nocapture align 512 "orig.arg.no"="3" "unpacked"="3.0.4" %_49) #4 {
entry:
  call void @"onebyonecpy_hls.p0a16struct.ap_uint<6>.345"(i6* align 512 %_0, i6* align 512 %_1, i6* align 512 %_2, i6* align 512 %_3, i6* align 512 %_4, i6* align 512 %_5, i6* align 512 %_6, i6* align 512 %_7, i6* align 512 %_8, i6* align 512 %_9, i6* align 512 %_10, i6* align 512 %_11, i6* align 512 %_12, i6* align 512 %_13, i6* align 512 %_14, i6* align 512 %_15, [16 x %"struct.ap_uint<6>"]* %0)
  call void @"onebyonecpy_hls.p0a5struct.ap_int<8>"(i8* align 512 %_01, i8* align 512 %_16, i8* align 512 %_27, i8* align 512 %_38, i8* align 512 %_49, [5 x %"struct.ap_int<8>"]* %1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a16struct.ap_uint<6>"([16 x %"struct.ap_uint<6>"]* "orig.arg.no"="0" "unpacked"="0" %dst, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.0" %src_0, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.1" %src_1, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.2" %src_2, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.3" %src_3, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.4" %src_4, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.5" %src_5, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.6" %src_6, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.7" %src_7, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.8" %src_8, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.9" %src_9, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.10" %src_10, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.11" %src_11, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.12" %src_12, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.13" %src_13, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.14" %src_14, i6* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.15" %src_15, i64 "orig.arg.no"="2" "unpacked"="2" %num) #2 {
entry:
  %0 = icmp eq [16 x %"struct.ap_uint<6>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.0.0.05.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.0.0.05.exit ]
  %dst.addr.0.0.06 = getelementptr [16 x %"struct.ap_uint<6>"], [16 x %"struct.ap_uint<6>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  switch i64 %for.loop.idx2, label %src.addr.0.0.05.case.15 [
    i64 0, label %src.addr.0.0.05.case.0
    i64 1, label %src.addr.0.0.05.case.1
    i64 2, label %src.addr.0.0.05.case.2
    i64 3, label %src.addr.0.0.05.case.3
    i64 4, label %src.addr.0.0.05.case.4
    i64 5, label %src.addr.0.0.05.case.5
    i64 6, label %src.addr.0.0.05.case.6
    i64 7, label %src.addr.0.0.05.case.7
    i64 8, label %src.addr.0.0.05.case.8
    i64 9, label %src.addr.0.0.05.case.9
    i64 10, label %src.addr.0.0.05.case.10
    i64 11, label %src.addr.0.0.05.case.11
    i64 12, label %src.addr.0.0.05.case.12
    i64 13, label %src.addr.0.0.05.case.13
    i64 14, label %src.addr.0.0.05.case.14
  ]

src.addr.0.0.05.case.0:                           ; preds = %for.loop
  %1 = bitcast i6* %src_0 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.1:                           ; preds = %for.loop
  %4 = bitcast i6* %src_1 to i8*
  %5 = load i8, i8* %4
  %6 = trunc i8 %5 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.2:                           ; preds = %for.loop
  %7 = bitcast i6* %src_2 to i8*
  %8 = load i8, i8* %7
  %9 = trunc i8 %8 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.3:                           ; preds = %for.loop
  %10 = bitcast i6* %src_3 to i8*
  %11 = load i8, i8* %10
  %12 = trunc i8 %11 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.4:                           ; preds = %for.loop
  %13 = bitcast i6* %src_4 to i8*
  %14 = load i8, i8* %13
  %15 = trunc i8 %14 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.5:                           ; preds = %for.loop
  %16 = bitcast i6* %src_5 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.6:                           ; preds = %for.loop
  %19 = bitcast i6* %src_6 to i8*
  %20 = load i8, i8* %19
  %21 = trunc i8 %20 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.7:                           ; preds = %for.loop
  %22 = bitcast i6* %src_7 to i8*
  %23 = load i8, i8* %22
  %24 = trunc i8 %23 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.8:                           ; preds = %for.loop
  %25 = bitcast i6* %src_8 to i8*
  %26 = load i8, i8* %25
  %27 = trunc i8 %26 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.9:                           ; preds = %for.loop
  %28 = bitcast i6* %src_9 to i8*
  %29 = load i8, i8* %28
  %30 = trunc i8 %29 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.10:                          ; preds = %for.loop
  %31 = bitcast i6* %src_10 to i8*
  %32 = load i8, i8* %31
  %33 = trunc i8 %32 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.11:                          ; preds = %for.loop
  %34 = bitcast i6* %src_11 to i8*
  %35 = load i8, i8* %34
  %36 = trunc i8 %35 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.12:                          ; preds = %for.loop
  %37 = bitcast i6* %src_12 to i8*
  %38 = load i8, i8* %37
  %39 = trunc i8 %38 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.13:                          ; preds = %for.loop
  %40 = bitcast i6* %src_13 to i8*
  %41 = load i8, i8* %40
  %42 = trunc i8 %41 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.14:                          ; preds = %for.loop
  %43 = bitcast i6* %src_14 to i8*
  %44 = load i8, i8* %43
  %45 = trunc i8 %44 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.15:                          ; preds = %for.loop
  %46 = icmp eq i64 %for.loop.idx2, 15
  call void @llvm.assume(i1 %46)
  %47 = bitcast i6* %src_15 to i8*
  %48 = load i8, i8* %47
  %49 = trunc i8 %48 to i6
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.exit:                             ; preds = %src.addr.0.0.05.case.15, %src.addr.0.0.05.case.14, %src.addr.0.0.05.case.13, %src.addr.0.0.05.case.12, %src.addr.0.0.05.case.11, %src.addr.0.0.05.case.10, %src.addr.0.0.05.case.9, %src.addr.0.0.05.case.8, %src.addr.0.0.05.case.7, %src.addr.0.0.05.case.6, %src.addr.0.0.05.case.5, %src.addr.0.0.05.case.4, %src.addr.0.0.05.case.3, %src.addr.0.0.05.case.2, %src.addr.0.0.05.case.1, %src.addr.0.0.05.case.0
  %50 = phi i6 [ %3, %src.addr.0.0.05.case.0 ], [ %6, %src.addr.0.0.05.case.1 ], [ %9, %src.addr.0.0.05.case.2 ], [ %12, %src.addr.0.0.05.case.3 ], [ %15, %src.addr.0.0.05.case.4 ], [ %18, %src.addr.0.0.05.case.5 ], [ %21, %src.addr.0.0.05.case.6 ], [ %24, %src.addr.0.0.05.case.7 ], [ %27, %src.addr.0.0.05.case.8 ], [ %30, %src.addr.0.0.05.case.9 ], [ %33, %src.addr.0.0.05.case.10 ], [ %36, %src.addr.0.0.05.case.11 ], [ %39, %src.addr.0.0.05.case.12 ], [ %42, %src.addr.0.0.05.case.13 ], [ %45, %src.addr.0.0.05.case.14 ], [ %49, %src.addr.0.0.05.case.15 ]
  store i6 %50, i6* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.0.0.05.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a16struct.ap_uint<6>"([16 x %"struct.ap_uint<6>"]* noalias "orig.arg.no"="0" "unpacked"="0" %dst, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.0" %src_0, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.1" %src_1, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.2" %src_2, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.3" %src_3, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.4" %src_4, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.5" %src_5, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.6" %src_6, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.7" %src_7, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.8" %src_8, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.9" %src_9, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.10" %src_10, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.11" %src_11, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.12" %src_12, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.13" %src_13, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.14" %src_14, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.15" %src_15) #3 {
entry:
  %0 = icmp eq [16 x %"struct.ap_uint<6>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a16struct.ap_uint<6>"([16 x %"struct.ap_uint<6>"]* nonnull %dst, i6* %src_0, i6* %src_1, i6* %src_2, i6* %src_3, i6* %src_4, i6* %src_5, i6* %src_6, i6* %src_7, i6* %src_8, i6* %src_9, i6* %src_10, i6* %src_11, i6* %src_12, i6* %src_13, i6* %src_14, i6* %src_15, i64 16)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5struct.ap_int<8>.338"([5 x %"struct.ap_int<8>"]* "orig.arg.no"="0" "unpacked"="0" %dst, i8* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.0" %src_0, i8* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.1" %src_1, i8* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.2" %src_2, i8* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.3" %src_3, i8* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.4" %src_4, i64 "orig.arg.no"="2" "unpacked"="2" %num) #2 {
entry:
  %0 = icmp eq [5 x %"struct.ap_int<8>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.0.0.05.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.0.0.05.exit ]
  %dst.addr.0.0.06 = getelementptr [5 x %"struct.ap_int<8>"], [5 x %"struct.ap_int<8>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  switch i64 %for.loop.idx2, label %src.addr.0.0.05.case.4 [
    i64 0, label %src.addr.0.0.05.case.0
    i64 1, label %src.addr.0.0.05.case.1
    i64 2, label %src.addr.0.0.05.case.2
    i64 3, label %src.addr.0.0.05.case.3
  ]

src.addr.0.0.05.case.0:                           ; preds = %for.loop
  %_0 = load i8, i8* %src_0, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.1:                           ; preds = %for.loop
  %_1 = load i8, i8* %src_1, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.2:                           ; preds = %for.loop
  %_2 = load i8, i8* %src_2, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.3:                           ; preds = %for.loop
  %_3 = load i8, i8* %src_3, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.4:                           ; preds = %for.loop
  %1 = icmp eq i64 %for.loop.idx2, 4
  call void @llvm.assume(i1 %1)
  %_4 = load i8, i8* %src_4, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.exit:                             ; preds = %src.addr.0.0.05.case.4, %src.addr.0.0.05.case.3, %src.addr.0.0.05.case.2, %src.addr.0.0.05.case.1, %src.addr.0.0.05.case.0
  %2 = phi i8 [ %_0, %src.addr.0.0.05.case.0 ], [ %_1, %src.addr.0.0.05.case.1 ], [ %_2, %src.addr.0.0.05.case.2 ], [ %_3, %src.addr.0.0.05.case.3 ], [ %_4, %src.addr.0.0.05.case.4 ]
  store i8 %2, i8* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.0.0.05.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a5struct.ap_int<8>.335"([5 x %"struct.ap_int<8>"]* noalias "orig.arg.no"="0" "unpacked"="0" %dst, i8* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.0" %src_0, i8* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.1" %src_1, i8* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.2" %src_2, i8* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.3" %src_3, i8* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.4" %src_4) #3 {
entry:
  %0 = icmp eq [5 x %"struct.ap_int<8>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a5struct.ap_int<8>.338"([5 x %"struct.ap_int<8>"]* nonnull %dst, i8* %src_0, i8* %src_1, i8* %src_2, i8* %src_3, i8* %src_4, i64 5)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_out([16 x %"struct.ap_uint<6>"]* noalias "orig.arg.no"="0" "unpacked"="0", i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.0" %_0, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.1" %_1, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.2" %_2, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.3" %_3, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.4" %_4, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.5" %_5, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.6" %_6, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.7" %_7, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.8" %_8, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.9" %_9, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.10" %_10, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.11" %_11, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.12" %_12, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.13" %_13, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.14" %_14, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.15" %_15, [5 x %"struct.ap_int<8>"]* noalias "orig.arg.no"="2" "unpacked"="2", i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.0" %_01, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.1" %_16, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.2" %_27, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.3" %_38, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.4" %_49) #5 {
entry:
  call void @"onebyonecpy_hls.p0a16struct.ap_uint<6>"([16 x %"struct.ap_uint<6>"]* %0, i6* align 512 %_0, i6* align 512 %_1, i6* align 512 %_2, i6* align 512 %_3, i6* align 512 %_4, i6* align 512 %_5, i6* align 512 %_6, i6* align 512 %_7, i6* align 512 %_8, i6* align 512 %_9, i6* align 512 %_10, i6* align 512 %_11, i6* align 512 %_12, i6* align 512 %_13, i6* align 512 %_14, i6* align 512 %_15)
  call void @"onebyonecpy_hls.p0a5struct.ap_int<8>.335"([5 x %"struct.ap_int<8>"]* %1, i8* align 512 %_01, i8* align 512 %_16, i8* align 512 %_27, i8* align 512 %_38, i8* align 512 %_49)
  ret void
}

declare void @apatb_KAN_hw(i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i8*, i8*, i8*, i8*, i8*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_back([16 x %"struct.ap_uint<6>"]* noalias "orig.arg.no"="0" "unpacked"="0", i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.0" %_0, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.1" %_1, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.2" %_2, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.3" %_3, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.4" %_4, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.5" %_5, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.6" %_6, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.7" %_7, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.8" %_8, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.9" %_9, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.10" %_10, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.11" %_11, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.12" %_12, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.13" %_13, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.14" %_14, i6* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.15" %_15, [5 x %"struct.ap_int<8>"]* noalias "orig.arg.no"="2" "unpacked"="2", i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.0" %_01, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.1" %_16, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.2" %_27, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.3" %_38, i8* noalias nocapture readonly align 512 "orig.arg.no"="3" "unpacked"="3.0.4" %_49) #5 {
entry:
  call void @"onebyonecpy_hls.p0a5struct.ap_int<8>.335"([5 x %"struct.ap_int<8>"]* %1, i8* align 512 %_01, i8* align 512 %_16, i8* align 512 %_27, i8* align 512 %_38, i8* align 512 %_49)
  ret void
}

define void @KAN_hw_stub_wrapper(i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i6*, i8*, i8*, i8*, i8*, i8*) #6 {
entry:
  %21 = alloca [16 x %"struct.ap_uint<6>"]
  %22 = alloca [5 x %"struct.ap_int<8>"]
  call void @copy_out([16 x %"struct.ap_uint<6>"]* %21, i6* %0, i6* %1, i6* %2, i6* %3, i6* %4, i6* %5, i6* %6, i6* %7, i6* %8, i6* %9, i6* %10, i6* %11, i6* %12, i6* %13, i6* %14, i6* %15, [5 x %"struct.ap_int<8>"]* %22, i8* %16, i8* %17, i8* %18, i8* %19, i8* %20)
  %23 = bitcast [16 x %"struct.ap_uint<6>"]* %21 to %"struct.ap_uint<6>"*
  %24 = bitcast [5 x %"struct.ap_int<8>"]* %22 to %"struct.ap_int<8>"*
  call void @KAN_hw_stub(%"struct.ap_uint<6>"* %23, %"struct.ap_int<8>"* %24)
  call void @copy_in([16 x %"struct.ap_uint<6>"]* %21, i6* %0, i6* %1, i6* %2, i6* %3, i6* %4, i6* %5, i6* %6, i6* %7, i6* %8, i6* %9, i6* %10, i6* %11, i6* %12, i6* %13, i6* %14, i6* %15, [5 x %"struct.ap_int<8>"]* %22, i8* %16, i8* %17, i8* %18, i8* %19, i8* %20)
  ret void
}

declare void @KAN_hw_stub(%"struct.ap_uint<6>"* noalias nonnull readonly, %"struct.ap_int<8>"* noalias nocapture nonnull)

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { nounwind willreturn }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}
!datalayout.transforms.on.top = !{!5, !27}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !{!6, !8, !10}
!6 = !{!7}
!7 = !{!"0.0", [16 x i6]* null}
!8 = !{!9}
!9 = !{!"array_partition", !"type=Complete", !"dim=1"}
!10 = !{!11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26}
!11 = !{!"0.0.0", i6* null}
!12 = !{!"0.0.1", i6* null}
!13 = !{!"0.0.2", i6* null}
!14 = !{!"0.0.3", i6* null}
!15 = !{!"0.0.4", i6* null}
!16 = !{!"0.0.5", i6* null}
!17 = !{!"0.0.6", i6* null}
!18 = !{!"0.0.7", i6* null}
!19 = !{!"0.0.8", i6* null}
!20 = !{!"0.0.9", i6* null}
!21 = !{!"0.0.10", i6* null}
!22 = !{!"0.0.11", i6* null}
!23 = !{!"0.0.12", i6* null}
!24 = !{!"0.0.13", i6* null}
!25 = !{!"0.0.14", i6* null}
!26 = !{!"0.0.15", i6* null}
!27 = !{!28, !8, !30}
!28 = !{!29}
!29 = !{!"1.0", [5 x i8]* null}
!30 = !{!31, !32, !33, !34, !35}
!31 = !{!"1.0.0", i8* null}
!32 = !{!"1.0.1", i8* null}
!33 = !{!"1.0.2", i8* null}
!34 = !{!"1.0.3", i8* null}
!35 = !{!"1.0.4", i8* null}
