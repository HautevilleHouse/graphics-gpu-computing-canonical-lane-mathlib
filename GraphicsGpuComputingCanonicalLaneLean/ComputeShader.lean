import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ComputeShader where
  threadGroup : Type
  sharedMemory : Type
  barrierSync : Type
  atomicOp : Type
  workGroup : Type
  kernelCompiled : Prop
  threadGroupClosed : threadGroup
  sharedMemoryClosed : sharedMemory
  barrierSyncClosed : barrierSync
  atomicOpClosed : atomicOp
  workGroupClosed : workGroup
  kernelCompiledClosed : kernelCompiled

structure ComputeShaderEvidence (C : ComputeShader) where
  threadGroupClosed : C.threadGroup
  sharedMemoryClosed : C.sharedMemory
  barrierSyncClosed : C.barrierSync
  atomicOpClosed : C.atomicOp
  workGroupClosed : C.workGroup
  kernelCompiledClosed : C.kernelCompiled

def ComputeShaderClosed (C : ComputeShader) : Prop :=
  C.threadGroup ∧ C.sharedMemory ∧ C.barrierSync ∧ C.atomicOp ∧ C.workGroup ∧ C.kernelCompiled

theorem compute_shader_closed_from_evidence (C : ComputeShader) (E : ComputeShaderEvidence C) : ComputeShaderClosed C := by
  exact And.intro E.threadGroupClosed (And.intro E.sharedMemoryClosed (And.intro E.barrierSyncClosed (And.intro E.atomicOpClosed (And.intro E.workGroupClosed E.kernelCompiledClosed))))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse