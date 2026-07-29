import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure MemoryConsistencyModelPackage where
  coherenceProtocol : Prop
  visibilityOrdering : Prop
  atomicOperations : Prop
  scratchpadMemory : Prop

structure MemoryConsistencyModelEvidence (M : MemoryConsistencyModelPackage) where
  coherenceProtocolClosed : M.coherenceProtocol
  visibilityOrderingClosed : M.visibilityOrdering
  atomicOperationsClosed : M.atomicOperations
  scratchpadMemoryClosed : M.scratchpadMemory

def MemoryConsistencyModelClosed (M : MemoryConsistencyModelPackage) : Prop :=
  M.coherenceProtocol ∧ M.visibilityOrdering ∧ M.atomicOperations ∧ M.scratchpadMemory

theorem memory_consistency_model_closed_from_evidence (M : MemoryConsistencyModelPackage)
    (E : MemoryConsistencyModelEvidence M) : MemoryConsistencyModelClosed M := by
  exact And.intro E.coherenceProtocolClosed (And.intro E.visibilityOrderingClosed
    (And.intro E.atomicOperationsClosed E.scratchpadMemoryClosed))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
