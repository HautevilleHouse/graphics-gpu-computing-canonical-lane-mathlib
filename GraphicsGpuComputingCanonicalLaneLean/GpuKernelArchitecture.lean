import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuKernelArchitecturePackage where
  warpSize : Nat
  sharedMemoryBytes : Nat
  registerFileSize : Nat
  simdWidth : Nat
  memoryHierarchy : Prop
  instructionSet : Prop
  occupancyModel : Prop

structure GpuKernelArchitectureEvidence (A : GpuKernelArchitecturePackage) where
  memoryHierarchyClosed : A.memoryHierarchy
  instructionSetClosed : A.instructionSet
  occupancyModelClosed : A.occupancyModel

def GpuKernelArchitectureClosed (A : GpuKernelArchitecturePackage) : Prop :=
  A.memoryHierarchy ∧ A.instructionSet ∧ A.occupancyModel

theorem gpu_kernel_architecture_closed_from_evidence (A : GpuKernelArchitecturePackage)
    (E : GpuKernelArchitectureEvidence A) : GpuKernelArchitectureClosed A := by
  exact And.intro E.memoryHierarchyClosed (And.intro E.instructionSetClosed E.occupancyModelClosed)

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
