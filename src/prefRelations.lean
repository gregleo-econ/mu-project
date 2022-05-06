import tactic

section

parameters {A : Type} {R : A → A → Prop}

/- Defininig Complete Relations -/
def complete (R : A → A → Prop) : Prop :=
∀ x y, R x y ∨ R y x

/- Defininig Complete Relations -/
def incomplete (R : A → A → Prop) : Prop :=
∃ x y, ¬ (R x y ∨ R y x)

def rational (R : A → A → Prop) : Prop :=
complete R ∧ reflexive R ∧ transitive R

/- R is a relexive, complete, transitive relation -/
parameter (rationalR : rational R)

/- Defininig S the Strict Preference Relation-/
def S (a b : A) : Prop := R a b ∧ ¬ R b a

/-###################################-/
/- Properties of the Strict Relation-/
/-#################################-/

/- Include the preference relations properties in proofs. -/

/- The Strict Relation is Irreflexive -/
theorem irreflS : irreflexive S :=
begin
intros x R, /-Put an object and the reltion into the proof context.-/
cases R,  /-Split S into Rxx and ¬ Rxx-/
finish, /-Show False-/
end

/- The Strict Relation is Incomplete -/
theorem incompS [nonempty A]: incomplete S :=
begin
inhabit A, /-Get an item in the A.-/
use [default, default], /-Use some object in A.-/
norm_num, /-Simplify goal.-/
intro hS,
cases hS,
trivial, 
end

theorem transitiveS : rational R → transitive S :=
begin
intro rationalR,
cases rationalR,
cases rationalR_right,
intro x,
intro y,
intro z,
intro Sxy,
intro Syz,
cases Syz, cases Sxy,
fconstructor,
tauto,





end
end
