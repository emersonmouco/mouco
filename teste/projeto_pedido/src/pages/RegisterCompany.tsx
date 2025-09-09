import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card';
import { toast } from '@/hooks/use-toast';
import { Loader2, Building2 } from 'lucide-react';
import type { Database } from '@/integrations/supabase/database.types';
type ProfileInsert = Database['public']['Tables']['profiles']['Insert'];

export default function RegisterCompany() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    email: '',
    password: '',
    companyName: '',
    companyDocument: '',
    fullName: '',
    phone: '',
    address: '',
  });

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      const { data: signUpData, error: signUpError } = await supabase.auth.signUp({
        email: formData.email.trim(),
        password: formData.password,
      });
      if (signUpError) throw signUpError;

      let user = signUpData.user ?? null;
      let session = signUpData.session ?? null;

      if (!session) {
        const { data: signInData, error: signInError } = await supabase.auth.signInWithPassword({
          email: formData.email.trim(),
          password: formData.password,
        });
        if (signInError) throw signInError;
        user = signInData.user ?? signInData.session?.user ?? null;
        session = signInData.session ?? null;
      }
      if (!user) throw new Error('Não foi possível obter o usuário autenticado.');

      const payload: ProfileInsert = {
        id: user.id,
        email: formData.email.trim(),
        full_name: formData.fullName || null,
        phone: formData.phone || null,
        address: formData.address || null,
        user_type: 'company',
        company_name: formData.companyName || null,
        company_document: formData.companyDocument || null,
      };
      await supabase.from('profiles').insert<ProfileInsert>(payload);


      toast({ title: 'Conta criada', description: 'Cadastro realizado com sucesso!' });
      navigate('/');
    } catch (err: any) {
      toast({ title: 'Erro no cadastro', description: err.message, variant: 'destructive' });
    } finally {
      setLoading(false);
    }
  };


  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-4">
      <Card className="w-full max-w-md">
        <CardHeader className="space-y-1">
          <CardTitle className="text-2xl font-bold text-center">
            Cadastrar empresa
          </CardTitle>
          <CardDescription className="text-center">
            Cadastre sua empresa para gerenciar produtos e pedidos
          </CardDescription>
        </CardHeader>
        <form onSubmit={handleRegister}>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="companyName">Nome da empresa</Label>
              <Input
                id="companyName"
                name="companyName"
                type="text"
                placeholder="Pizzaria Delícia"
                value={formData.companyName}
                onChange={handleChange}
                required
                disabled={loading}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="companyDocument">CNPJ</Label>
              <Input
                id="companyDocument"
                name="companyDocument"
                type="text"
                placeholder="00.000.000/0000-00"
                value={formData.companyDocument}
                onChange={handleChange}
                required
                disabled={loading}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="fullName">Nome do responsável</Label>
              <Input
                id="fullName"
                name="fullName"
                type="text"
                placeholder="Maria Santos"
                value={formData.fullName}
                onChange={handleChange}
                required
                disabled={loading}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                name="email"
                type="email"
                placeholder="empresa@email.com"
                value={formData.email}
                onChange={handleChange}
                required
                disabled={loading}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="password">Senha</Label>
              <Input
                id="password"
                name="password"
                type="password"
                placeholder="Mínimo 6 caracteres"
                value={formData.password}
                onChange={handleChange}
                required
                minLength={6}
                disabled={loading}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="phone">Telefone</Label>
              <Input
                id="phone"
                name="phone"
                type="tel"
                placeholder="(11) 3456-7890"
                value={formData.phone}
                onChange={handleChange}
                required
                disabled={loading}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="address">Endereço</Label>
              <Input
                id="address"
                name="address"
                type="text"
                placeholder="Av. Principal, 500"
                value={formData.address}
                onChange={handleChange}
                required
                disabled={loading}
              />
            </div>
          </CardContent>
          <CardFooter className="flex flex-col space-y-4">
            <Button
              type="submit"
              className="w-full"
              disabled={loading}
            >
              {loading ? (
                <>
                  <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                  Cadastrando...
                </>
              ) : (
                <>
                  <Building2 className="mr-2 h-4 w-4" />
                  Cadastrar empresa
                </>
              )}
            </Button>
            <div className="text-sm text-center space-y-2">
              <p className="text-muted-foreground">
                Já tem uma conta?{' '}
                <Link to="/login" className="text-primary hover:underline">
                  Fazer login
                </Link>
              </p>
              <p className="text-muted-foreground">
                É um cliente?{' '}
                <Link to="/register" className="text-primary hover:underline">
                  Cadastre-se como cliente
                </Link>
              </p>
            </div>
          </CardFooter>
        </form>
      </Card>
    </div>
  );
}