import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuComputeCore where
  kernel : Type
  memoryHierarchy : Type
  parallelismModel : Prop
  memoryCoherence : Prop
  kernelClosed : kernel
  memoryHierarchyClosed : memoryHierarchy
  parallelismModelClosed : parallelismModel
  memoryCoherenceClosed : memoryCoherence

def GpuComputeCoreClosed (C : GpuComputeCore) : Prop :=
  C.parallelismModel ∧ C.memoryCoherence

theorem gpu_compute_core_closed_from_evidence (C : GpuComputeCore) : GpuComputeCoreClosed C := by
  exact And.intro C.parallelismModelClosed C.memoryCoherenceClosed

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse